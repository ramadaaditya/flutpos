import 'dart:async';

import 'package:flutpos/features/products/domain/entities/user_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

enum AuthStatus { loading, authenticated, unauthenticated }

final appAuthController = AppAuthController();

class AppAuthController extends ChangeNotifier {
  AppAuthController({supabase.SupabaseClient? client})
    : _client = client ?? supabase.Supabase.instance.client {
    _subscription = _client.auth.onAuthStateChange.listen((
      supabase.AuthState state,
    ) {
      _syncUser(state.session?.user);
    });

    _bootstrap();
  }

  final supabase.SupabaseClient _client;
  late final StreamSubscription<supabase.AuthState> _subscription;

  AuthStatus _status = AuthStatus.loading;
  UserRole _role = UserRole.cashier;
  String? _displayName;
  String? _email;

  AuthStatus get status => _status;
  UserRole get role => _role;
  String get roleLabel => _role.label;
  String? get displayName => _displayName;
  String? get email => _email;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get canManageProducts => _role != UserRole.cashier;

  Future<void> _bootstrap() async {
    _syncUser(_client.auth.currentSession?.user);
  }

  void _syncUser(supabase.User? user) {
    if (user == null) {
      _status = AuthStatus.unauthenticated;
      _role = UserRole.cashier;
      _displayName = null;
      _email = null;
      notifyListeners();
      return;
    }

    _status = AuthStatus.authenticated;
    _role = _parseRole(user);
    _displayName = _parseDisplayName(user);
    _email = user.email;
    notifyListeners();
  }

  Future<supabase.AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    _status = AuthStatus.loading;
    notifyListeners();

    try {
      final supabase.AuthResponse response = await _client.auth
          .signInWithPassword(email: email, password: password);
      _syncUser(response.user ?? _client.auth.currentUser);
      return response;
    } catch (_) {
      _syncUser(_client.auth.currentSession?.user);
      rethrow;
    }
  }

  Future<supabase.AuthResponse> signUp({
    required String name,
    required String email,
    required String password,
    required UserRole role,
  }) async {
    _status = AuthStatus.loading;
    notifyListeners();

    try {
      final supabase.AuthResponse response = await _client.auth.signUp(
        email: email,
        password: password,
        data: <String, dynamic>{'full_name': name, 'role': role.name},
      );

      _syncUser(response.user ?? _client.auth.currentSession?.user);
      return response;
    } catch (_) {
      _syncUser(_client.auth.currentSession?.user);
      rethrow;
    }
  }

  Future<void> resetPassword(String email) {
    return _client.auth.resetPasswordForEmail(email);
  }

  Future<void> signOut() async {
    _status = AuthStatus.loading;
    notifyListeners();

    try {
      await _client.auth.signOut();
    } finally {
      _syncUser(_client.auth.currentSession?.user);
    }
  }

  UserRole _parseRole(supabase.User user) {
    final Map<String, dynamic>? metadata =
        user.userMetadata ?? user.appMetadata;
    final String roleValue = (metadata?['role'] ?? 'cashier')
        .toString()
        .toLowerCase();

    switch (roleValue) {
      case 'owner':
        return UserRole.owner;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.cashier;
    }
  }

  String _parseDisplayName(supabase.User user) {
    final Map<String, dynamic>? metadata =
        user.userMetadata ?? user.appMetadata;
    final String? fullName = metadata?['full_name']?.toString();
    if (fullName != null && fullName.trim().isNotEmpty) {
      return fullName.trim();
    }

    if (user.email != null && user.email!.contains('@')) {
      return user.email!.split('@').first;
    }

    return 'User';
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

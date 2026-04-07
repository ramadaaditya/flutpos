import 'package:flutpos/constant/routes.dart';
import 'package:flutpos/features/auth/application/app_auth_controller.dart';
import 'package:flutpos/features/auth/presentation/login.dart';
import 'package:flutpos/features/auth/presentation/register.dart';
import 'package:flutpos/features/auth/presentation/reset_password.dart';
import 'package:flutpos/features/dashboard/presentation/home.dart';
import 'package:flutpos/features/products/presentation/pages/product_page.dart';
import 'package:flutpos/features/products/domain/entities/user_entity.dart';
import 'package:flutpos/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

GoRouter buildAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: appAuthController,
    initialLocation: ConstantRoutes.splashScreen,
    redirect: (_, state) {
      final AuthStatus authStatus = appAuthController.status;
      final UserRole currentRole = appAuthController.role;
      final String location = state.matchedLocation;

      final bool isOnSplash = location == ConstantRoutes.splashScreen;
      final bool isOnDashboard = location == ConstantRoutes.dashboardScreen;
      final bool isOnProducts = location == ConstantRoutes.productsScreen;
      final bool isOnAuthRoute =
          location == ConstantRoutes.signinScreen ||
          location == ConstantRoutes.signupScreen ||
          location == ConstantRoutes.resetPasswordScreen;

      if (authStatus == AuthStatus.loading) {
        return isOnSplash ? null : ConstantRoutes.splashScreen;
      }

      if (authStatus == AuthStatus.unauthenticated) {
        if (isOnSplash || isOnDashboard || isOnProducts) {
          return ConstantRoutes.signinScreen;
        }
        return null;
      }

      if (isOnProducts && currentRole == UserRole.cashier) {
        return ConstantRoutes.dashboardScreen;
      }

      if (isOnSplash || isOnAuthRoute) {
        return ConstantRoutes.dashboardScreen;
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: ConstantRoutes.dashboardScreen,
        builder: (_, _) => const HomeScreen(),
      ),
      GoRoute(
        path: ConstantRoutes.productsScreen,
        builder: (_, _) => const ProductPage(),
      ),
      GoRoute(
        path: ConstantRoutes.splashScreen,
        builder: (_, _) => const SplashScreen(),
      ),
      GoRoute(
        path: ConstantRoutes.signinScreen,
        builder: (_, _) => const LoginScreen(),
      ),
      GoRoute(
        path: ConstantRoutes.signupScreen,
        builder: (_, _) => const RegisterScreen(),
      ),
      GoRoute(
        path: ConstantRoutes.resetPasswordScreen,
        builder: (_, _) => const ResetPasswordScreen(),
      ),
    ],
  );
}

import 'package:flutpos/config/routes/go_routes.dart';
import 'package:flutpos/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GoRouter appRouter = buildAppRouter();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await Supabase.initialize(
    url: 'https://txtiyobmlwmfjrxdgliu.supabase.co',
    anonKey: 'sb_publishable_bhxq-QxPzozSqEowleyx_g_QKlBGV7C',
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.light,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF12100F),
      ),
      routerConfig: appRouter,
    );
  }
}

import 'package:flutpos/features/auth/application/app_auth_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Center(
        child: AnimatedBuilder(
          animation: appAuthController,
          builder: (_, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'BrewPOS',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(height: 12),
                Text(
                  appAuthController.status == AuthStatus.loading
                      ? 'Checking session...'
                      : 'Preparing app...',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

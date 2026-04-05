import 'package:flutpos/config/routes/go_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('User authenticated (dummy)'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => dummyAuthController.signOut(),
                child: const Text('Simulate Logout (1s delay)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

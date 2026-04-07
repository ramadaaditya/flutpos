import 'package:flutpos/constant/routes.dart';
import 'package:flutpos/core/utils/validator.dart';
import 'package:flutpos/features/auth/application/app_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final captionStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.72),
      fontSize: 13,
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20 + keyboardInset),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 40,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.coffee_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Title
                    const Text(
                      'BrewPOS',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Login Card
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1C1B),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Please enter your credentials to access the terminal.',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.5),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // Email Field
                                _buildLabel('EMAIL ADDRESS'),
                                TextFormField(
                                  controller: _emailController,
                                  validator: AppValidator.email,
                                  decoration: InputDecoration(
                                    hintText: 'barista@brewpos.com',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.2,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.alternate_email,
                                      size: 20,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // Password Field
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildLabel('PASSWORD'),
                                    Text(
                                      'FORGOT PASSWORD?',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  validator: AppValidator.password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: '••••••••',
                                    hintStyle: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.2,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.lock_outline,
                                      size: 20,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white12,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                    onPressed: _isSubmitting ? null : _submit,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum punya akun?', style: captionStyle),
                            TextButton(
                              onPressed: _isSubmitting
                                  ? null
                                  : () =>
                                        context.go(ConstantRoutes.signupScreen),
                              child: const Text('Buat Akun'),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: _isSubmitting
                              ? null
                              : () => context.go(
                                  ConstantRoutes.resetPasswordScreen,
                                ),
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.74),
                          ),
                          child: const Text('Lupa Password?'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await appAuthController.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login gagal: $error')));
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }
}

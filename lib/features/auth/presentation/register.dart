import 'package:flutpos/constant/routes.dart';
import 'package:flutpos/features/auth/application/app_auth_controller.dart';
import 'package:flutpos/features/products/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utils_validators/utils_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserRole _selectedRole = UserRole.cashier;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.primary;
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.coffee_rounded,
                          color: accentColor,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'BrewPOS',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1C1B),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildLabel('NAMA LENGKAP'),
                            TextFormField(
                              controller: _nameController,
                              decoration: _inputDecoration('Nama Lengkap'),
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Nama wajib diisi';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            _buildLabel('EMAIL ADDRESS'),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: _inputDecoration('Email'),
                              validator: (String? value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email wajib diisi';
                                }
                                if (value.isValidEmail() != true) {
                                  return 'Email tidak valid';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            _buildLabel('PASSWORD'),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: _inputDecoration('Password'),
                              validator: (String? value) {
                                if (value == null || value.length < 6) {
                                  return 'Minimal 6 karakter';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            _buildLabel('ROLE'),
                            DropdownButtonFormField<UserRole>(
                              initialValue: _selectedRole,
                              decoration: _inputDecoration('Role'),
                              dropdownColor: const Color(0xFF1E1C1B),
                              style: const TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.white70,
                              items: UserRole.values
                                  .map(
                                    (UserRole role) =>
                                        DropdownMenuItem<UserRole>(
                                          value: role,
                                          child: Text(role.label),
                                        ),
                                  )
                                  .toList(growable: false),
                              onChanged: (UserRole? value) {
                                if (value != null) {
                                  setState(() => _selectedRole = value);
                                }
                              },
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: _isSubmitting ? null : _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 0,
                                ),
                                child: _isSubmitting
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.black,
                                        ),
                                      )
                                    : const Text(
                                        'BUAT AKUN',
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sudah punya akun?', style: captionStyle),
                          TextButton(
                            onPressed: _isSubmitting
                                ? null
                                : () => context.go(ConstantRoutes.signinScreen),
                            child: const Text('Masuk'),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final response = await appAuthController.signUp(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        role: _selectedRole,
      );

      if (!mounted) return;

      if (response.session != null) {
        await appAuthController.signOut();
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Akun dibuat. Silakan login setelah akun aktif/terverifikasi.',
          ),
        ),
      );
      context.go(ConstantRoutes.signinScreen);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Register gagal: $error')));
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.2)),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white12),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      errorStyle: const TextStyle(fontSize: 10, color: Colors.redAccent),
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
}

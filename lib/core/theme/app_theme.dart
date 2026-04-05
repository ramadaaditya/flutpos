import 'package:flutpos/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.background,
      onSurface: AppColors.primary,
      surfaceBright: AppColors.background,
    ),
  );
}

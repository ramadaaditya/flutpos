import 'package:flutpos/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
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

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorsDark.primary,
      brightness: Brightness.dark,
      primary: AppColorsDark.primary,
      onPrimary: AppColorsDark.onPrimary,
      secondary: AppColorsDark.secondary,
      onSecondary: AppColorsDark.onSecondary,
      error: Colors.red,
      onError: Colors.white,
      surface: const Color(0xFF12100F),
      onSurface: Colors.white,
      surfaceBright: const Color(0xFF1E1B1A),
    ),
  );
}

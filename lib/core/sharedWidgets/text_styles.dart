import 'package:flutter/material.dart';
import 'package:user_app_iraq/core/utils/app_colors.dart';

class AppTextStyles {
  static const Color textPrimary = AppColors.textPrimary;
  static const Color textSecondary = AppColors.textSecondary;

  static TextStyle displayLarge() =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.5, color: textPrimary, height: 1.2);

  static TextStyle displayMedium() =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.25, color: textPrimary, height: 1.3);

  static TextStyle displaySmall() =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimary, height: 1.3);

  static TextStyle headlineLarge() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary, height: 1.4);

  static TextStyle headlineMedium() =>
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: textPrimary, height: 1.4);

  static TextStyle headlineSmall() =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textPrimary, height: 1.4);

  static TextStyle titleLarge() =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textPrimary, letterSpacing: 0.15, height: 1.5);

  static TextStyle titleMedium() =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textPrimary, letterSpacing: 0.1, height: 1.5);

  static TextStyle bodyLarge() =>
      const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: textPrimary, letterSpacing: 0.5, height: 1.5);

  static TextStyle bodyMedium() =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: textPrimary, letterSpacing: 0.25, height: 1.5);

  static TextStyle bodySmall() =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: textSecondary, letterSpacing: 0.4, height: 1.5);

  static TextStyle labelLarge() =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textPrimary, letterSpacing: 0.1, height: 1.4);

  static TextStyle labelMedium() =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: textPrimary, letterSpacing: 0.5, height: 1.4);
}

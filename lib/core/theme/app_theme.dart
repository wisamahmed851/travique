import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textLight,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        textStyle: AppTextStyles.button,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: AppTextStyles.body,
      bodyLarge: AppTextStyles.heading,
      labelLarge: AppTextStyles.link,
    ),
  );
}

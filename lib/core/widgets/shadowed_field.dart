import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';

Widget buildShadowedField({
  required String hint,
  required TextEditingController controller,
  required double scale,
  bool obscure = false,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18 * scale,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.textLightGrey,
          fontSize: 20 * scale,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14 * scale,
          horizontal: 16 * scale,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.background, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.secondary, width: 2),
        ),
      ),
    ),
  );
}

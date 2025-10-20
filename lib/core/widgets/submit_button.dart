import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double scale;
  final Color? backgroundColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.scale = 1.0,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.buttonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          padding: EdgeInsets.symmetric(vertical: 16 * scale),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.button.copyWith(
            fontSize: 20 * scale,
          ),
        ),
      ),
    );
  }
}

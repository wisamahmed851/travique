import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double scale;

  /// If true → Outlined style
  final bool isOutlined;

  /// Customize background color
  final Color? backgroundColor;

  /// Customize text color
  final Color? textColor;

  /// Customize border color (if outlined)
  final Color? borderColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.scale = 1.0,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = isOutlined
        ? AppColors.background
        : (backgroundColor ?? AppColors.primary);

    final txtColor = textColor ??
        (isOutlined ? (borderColor ?? AppColors.primary) : AppColors.buttonText);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: txtColor,
          elevation: isOutlined ? 0 : 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isOutlined
                ? BorderSide(
                    color: borderColor ?? AppColors.primary,
                    width: 2,
                  )
                : BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(vertical: 16 * scale),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.button.copyWith(
            fontSize: 20 * scale,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}

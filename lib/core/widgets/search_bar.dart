import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  final String searchtext;
  const SearchBarWidget({super.key, required this.searchtext});
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.body.copyWith(
        color: AppColors.textDark
      ),
      decoration: InputDecoration(
        hintText: searchtext,
        hintStyle: AppTextStyles.body.copyWith(
          color: AppColors.textGrey,
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
        // contentPadding: const EdgeInsets.symmetric(vertical: 10),
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

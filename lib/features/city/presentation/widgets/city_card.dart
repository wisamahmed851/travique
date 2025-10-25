import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String country;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const CityCard({
    Key? key,
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.85, 1.1);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14 * scale),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16 * scale),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withOpacity(0.08),
              blurRadius: 6 * scale,
              offset: Offset(0, 4 * scale),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16 * scale),
                bottomLeft: Radius.circular(16 * scale),
              ),
              child: Image.asset(
                imageUrl,
                height: 80 * scale,
                width: 100 * scale,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12 * scale),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12 * scale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.heading.copyWith(
                        fontSize: 16 * scale,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 4 * scale),
                    Text(
                      country,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textGrey,
                        fontSize: 14 * scale,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

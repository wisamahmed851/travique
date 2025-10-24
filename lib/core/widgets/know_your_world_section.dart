import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

class KnowYourWorldSection extends StatelessWidget {
  KnowYourWorldSection({super.key});

  final List<Map<String, String>> places = [
    {
      "name": "Dubai",
      "subtitle": "City in the UAE",
      "image": "assets/images/dubai.png"
    },
    {
      "name": "Bangkok",
      "subtitle": "Capital of Thailand",
      "image": "assets/images/bangkok.png"
    },
    {
      "name": "Sikkim",
      "subtitle": "State of India",
      "image": "assets/images/sikkim.png"
    },
    {
      "name": "Singapore",
      "subtitle": "Country in Asia",
      "image": "assets/images/singapore.png"
    },
    {
      "name": "Paris",
      "subtitle": "City in France",
      "image": "assets/images/sikkim.png"
    },
    {
      "name": "Tokyo",
      "subtitle": "Capital of Japan",
      "image": "assets/images/bangkok.png"
    },
    {
      "name": "New York",
      "subtitle": "City in USA",
      "image": "assets/images/singapore.png"
    },
    {
      "name": "Sydney",
      "subtitle": "City in Australia",
      "image": "assets/images/dubai.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Know Your World",
            style: AppTextStyles.heading.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Grow your world knowledge",
            style: AppTextStyles.body.copyWith(color: AppColors.textGrey),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 190, // Adjusted for 2 stacked cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (places.length / 2).ceil(),
              itemBuilder: (context, index) {
                final first = places[index * 2];
                final second =
                    (index * 2 + 1 < places.length) ? places[index * 2 + 1] : null;

                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      _PlaceCard(
                        name: first["name"]!,
                        subtitle: first["subtitle"]!,
                        imagePath: first["image"]!,
                      ),
                      const SizedBox(height: 12),
                      if (second != null)
                        _PlaceCard(
                          name: second["name"]!,
                          subtitle: second["subtitle"]!,
                          imagePath: second["image"]!,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imagePath;

  const _PlaceCard({
    required this.name,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12,
                      color: AppColors.textGrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

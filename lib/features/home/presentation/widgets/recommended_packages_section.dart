import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/widgets/trip_card.dart';
import 'package:travique/routes/app_routes.dart';

class RecommendedPackagesSection extends StatefulWidget {
  final String country;
  const RecommendedPackagesSection({super.key, required this.country});

  @override
  State<RecommendedPackagesSection> createState() =>
      _RecommendedPackagesSectionState();
}

class _RecommendedPackagesSectionState
    extends State<RecommendedPackagesSection> {
  int selectedIndex = 0;

  // 📦 Updated data (assets)
  final List<Map<String, dynamic>> soloTrips = [
    {
      "image": "assets/images/rooftopDinner.jpeg",
      "title": "Rooftop Dinner",
      "rating": 4.6,
    },
    {
      "image": "assets/images/broadwayShow.jpg",
      "title": "Broadway Show",
      "rating": 4.8,
    },
  ];

  final List<Map<String, dynamic>> familyTrips = [
    {
      "image": "assets/images/beachResort.jpeg",
      "title": "Beach Resort",
      "rating": 4.9,
    },
    {
      "image": "assets/images/mountainCamp.jpeg",
      "title": "Mountain Camp",
      "rating": 4.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String country = widget.country;
    final screenWidth = MediaQuery.of(context).size.width;
    final trips = selectedIndex == 0 ? soloTrips : familyTrips;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🏷️ Section Heading
        Text(
          "Recommended Packages in $country",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),

        // 🔘 Toggle Buttons
        Row(
          children: [
            Container(
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  _buildToggleButton("Solo Trips", 0),
                  _buildToggleButton("Family Trips", 1),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // 🖼️ Horizontal Card List
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final item = trips[index];
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.PLACE_DETAILS),
                child: TripCard(
                  image: item["image"],
                  title: item["title"],
                  rating: item["rating"],
                  width: screenWidth * 0.7,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 🔘 Rounded Toggle Buttons
  Widget _buildToggleButton(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? AppColors.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selectedIndex == index
                    ? AppColors.buttonText
                    : AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

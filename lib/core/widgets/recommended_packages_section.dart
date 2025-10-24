import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';

class RecommendedPackagesSection extends StatefulWidget {
  const RecommendedPackagesSection({super.key});

  @override
  State<RecommendedPackagesSection> createState() =>
      _RecommendedPackagesSectionState();
}

class _RecommendedPackagesSectionState
    extends State<RecommendedPackagesSection> {
  int selectedIndex = 0;

  // Sample data
  final List<Map<String, dynamic>> soloTrips = [
    {
      "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
      "title": "Saintmartin",
      "rating": 5.0,
    },
    {
      "image": "https://images.unsplash.com/photo-1542038784456-1ea8e935640e",
      "title": "Bandarban",
      "rating": 4.8,
    },
  ];

  final List<Map<String, dynamic>> familyTrips = [
    {
      "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
      "title": "Cox’s Bazar",
      "rating": 4.9,
    },
    {
      "image": "https://images.unsplash.com/photo-1542038784456-1ea8e935640e",
      "title": "Rangamati",
      "rating": 4.7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final trips = selectedIndex == 0 ? soloTrips : familyTrips;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🏷️ Heading
        const Text(
          "Recommended Package",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),

        // 🔘 Toggle Buttons (Solo / Family)
        // Replace the Row(...) in build() with this segmented control:
        Row(
          children: [
            // Parent track (light blue rounded background)
            Container(
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  // Solo Trips (left)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = 0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? AppColors.primary
                              : Colors.transparent,
                          borderRadius: selectedIndex == 0
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                        ),
                        child: Center(
                          child: Text(
                            "Solo Trips",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == 0
                                  ? AppColors.buttonText
                                  : AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Family Trips (right)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = 1),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? AppColors.primary
                              : Colors.transparent,
                          borderRadius: selectedIndex == 1
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                        ),
                        child: Center(
                          child: Text(
                            "Family Trips",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == 1
                                  ? AppColors.buttonText
                                  : AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // You can remove the old _buildTripButton method if you want —
        // this inline approach keeps both segments inside a single track.
        const SizedBox(height: 20),

        // 🖼️ Horizontal List of Cards
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final item = trips[index];
              return _buildTripCard(
                image: item["image"],
                title: item["title"],
                rating: item["rating"],
                width: screenWidth * 0.65,
              );
            },
          ),
        ),
      ],
    );
  }

  // 🖼️ Trip Card Widget
  Widget _buildTripCard({
    required String image,
    required String title,
    required double rating,
    required double width,
  }) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 🖼️ Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              image,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // 🔖 Bookmark Icon
          const Positioned(
            top: 12,
            right: 12,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 13,
              child: Icon(
                Icons.bookmark_border_rounded,
                size: 18,
                color: Colors.black87,
              ),
            ),
          ),

          // 📍 Location & Rating
          Positioned(
            left: 12,
            bottom: 10,
            right: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

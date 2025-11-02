import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/home/presentation/widgets/exclusive_package_card.dart';
import 'package:travique/features/home/presentation/widgets/recommended_packages_section.dart';
import 'package:travique/core/widgets/search_bar.dart';
import 'package:travique/routes/app_routes.dart';

class CityHomeScreen extends StatelessWidget {
  final String cityName = "New York";
  final String cityImage = "assets/images/newyork.jpeg";

  CityHomeScreen({Key? key}) : super(key: key);

  // ✅ Example sample data — replace later with API data
  final List<Map<String, dynamic>> attractions = [
    {
      "title": "Central Park",
      "subtitle": "Famous urban park",
      "rating": 4.8,
      "image": "assets/images/centralPark.jpg",
    },
    {
      "title": "Times Square",
      "subtitle": "Entertainment hub",
      "rating": 4.7,
      "image": "assets/images/timesSquare.jpg",
    },
    {
      "title": "Statue of Liberty",
      "subtitle": "Historic landmark",
      "rating": 4.9,
      "image": "assets/images/statueOfLiberty.jpg",
    },
  ];

  final List<Map<String, dynamic>> categories = [
    {"name": "Attractions", "icon": "assets/images/mountain.png"},
    {"name": "Food", "icon": "assets/images/Beach.png"},
    {"name": "Events", "icon": "assets/images/History.png"},
  ];

  final List<Map<String, dynamic>> recommendations = [
    {
      "title": "Rooftop Dinner",
      "subtitle": "Skyline view restaurant",
      "rating": 4.6,
      "image": "assets/images/rooftopDinner.jpeg",
    },
    {
      "title": "Broadway Show",
      "subtitle": "Musical performance",
      "rating": 4.8,
      "image": "assets/images/broadwayShow.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = (screenHeight / 800).clamp(0.85, 1.1);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // 🏙️ City Banner
            _buildCityHeader(context, scale),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SearchBarWidget(searchtext: "Search in $cityName"),
                  const SizedBox(height: 25),
                  _buildSectionTitle("Top Attractions in $cityName"),
                  const SizedBox(height: 10),
                  _buildAttractionSection(context),
                  const SizedBox(height: 25),
                  _buildSectionTitle("Explore $cityName"),
                  const SizedBox(height: 10),
                  _buildCategorySection(context),
                  const SizedBox(height: 25),
                  RecommendedPackagesSection(country: 'New York'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🏙️ City Header with background image
  Widget _buildCityHeader(BuildContext context, double scale) {
    return Stack(
      children: [
        Container(
          height: 180 * scale,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cityImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(height: 180 * scale, color: Colors.black.withOpacity(0.3)),
        Positioned(
          left: 20,
          bottom: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore $cityName",
                style: AppTextStyles.heading.copyWith(
                  fontSize: 26 * scale,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Discover top attractions & experiences",
                style: AppTextStyles.body.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🌆 Attractions List
  Widget _buildAttractionSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: /* screenHeight * 0.33 */ 270,
      child: attractions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: attractions.length,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                final item = attractions[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.PLACE_DETAILS),
                  child: ExclusivePackageCard(
                    city: item['subtitle'],
                    image: item['image'],
                    country: item['title'],
                    rating: item['rating'],
                  ),
                );
              },
            ),
    );
  }

  // 🗺️ Category Section
  Widget _buildCategorySection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Container(
            width: screenWidth * 0.27,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderLightGrey, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item['icon'], height: 40, width: 40),
                const SizedBox(height: 6),
                Text(
                  item['name'],
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.heading.copyWith(
        fontSize: 16,
        color: AppColors.black,
      ),
    );
  }
}

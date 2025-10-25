import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/core/widgets/bottom_nevigation.dart';
import 'package:travique/core/widgets/exclusive_package_card.dart';
import 'package:travique/core/widgets/know_your_world_section.dart';
import 'package:travique/core/widgets/recommended_packages_section.dart';
import 'package:travique/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "All", "isSelected": true},
    {"name": "Asia", "isSelected": false},
    {"name": "Europe", "isSelected": false},
    {"name": "America", "isSelected": false},
    {"name": "Oceania", "isSelected": false},
  ];

  final List<Map<String, dynamic>> destinations = [
    {
      "country": "Maldives",
      "city": "South Asia",
      "rating": 4.6,
      "image":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800",
    },
    {
      "country": "Kashmir",
      "city": "India",
      "rating": 4.8,
      "image":
          "https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800",
    },
    {
      "country": "Bali",
      "city": "Indonesia",
      "rating": 4.7,
      "image":
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800",
    },
    {
      "country": "Switzerland",
      "city": "Europe",
      "rating": 4.9,
      "image":
          "https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=800",
    },
  ];
  final List<Map<String, dynamic>> explore = [
    {"category": "Mountains", "image": "assets/images/mountain.png"},
    {"category": "History", "image": "assets/images/History.png"},
    {"category": "Beach", "image": "assets/images/Beach.png"},
  ];

  final List<Map<String, dynamic>> popular = [
    {
      "country": "Thailand",
      "city": "Phuket",
      "rating": 4.9,
      "image":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800",
    },
    {
      "country": "Thailand",
      "city": "Bangkok",
      "rating": 4.7,
      "image":
          "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?w=800",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 25),
              _buildExclusivePackageSection(context),
              const SizedBox(height: 25),
              _buildSectionTitle("Explore Category"),
              const SizedBox(height: 10),
              _buildExploreSection(context),
              const SizedBox(height: 25),
              RecommendedPackagesSection(),
              const SizedBox(height: 25),
              KnowYourWorldSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Evening",
              style: AppTextStyles.body.copyWith(
                fontSize: 16,
                color: AppColors.textGrey,
              ),
            ),
            Text(
              "Fatemeh Hamedi",
              style: AppTextStyles.heading.copyWith(
                fontSize: 20,
                color: AppColors.black,
              ),
            ),
            Text(
              "Explore the world",
              style: AppTextStyles.heading.copyWith(
                fontSize: 24,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Where you Want to go",
        hintStyle: AppTextStyles.body.copyWith(
          color: AppColors.textGrey,
          fontSize: 16,
        ),
        prefixIcon: const Icon(
          Icons.search_outlined,
          color: AppColors.textGrey,
          size: 24,
          weight: 700,
        ),
        filled: true,
        fillColor: AppColors.inputBackground,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildExclusivePackageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exclusive Package",
          style: AppTextStyles.heading.copyWith(
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),

        // 🌍 Category Chips
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = categories[index]["isSelected"];
              return Container(
                margin: const EdgeInsets.only(right: 12),
                color: null,
                child: FilterChip(
                  label: Text(
                    categories[index]["name"],
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.buttonText
                          : AppColors.textGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  showCheckmark: false,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  backgroundColor: Colors.white,
                  onSelected: (_) {},
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // 🧳 Package Cards
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              final item = destinations[index];
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.PLACE_DETAILS),
                child: ExclusivePackageCard(
                  city: item['city'],
                  image: item['image'],
                  country: item['country'],
                  rating: item['rating'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildExploreSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: explore.length,
        itemBuilder: (context, index) {
          final item = explore[index];
          return Container(
            width: screenWidth * 0.32,

            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.borderLightGrey, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset(item['image'], height: 80, width: 80),
                  const SizedBox(height: 8),
                  Text(
                    item['category'],
                    style: AppTextStyles.body.copyWith(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

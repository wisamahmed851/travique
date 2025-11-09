import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/core/widgets/search_bar.dart';
import 'package:travique/features/city/presentation/widgets/city_card.dart';
import 'package:travique/routes/app_routes.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {

  final List<Map<String, String>> cities = [
    {
      'name': 'New York',
      'country': 'USA',
      'image': 'assets/images/newyork.jpeg',
    },
    {'name': 'Paris', 'country': 'France', 'image': 'assets/images/paris.jpeg'},
    {'name': 'Tokyo', 'country': 'Japan', 'image': 'assets/images/tokyo.jpeg'},
    {
      'name': 'Sydney',
      'country': 'Australia',
      'image': 'assets/images/sydney.jpeg',
    },
  ];

  String searchQuery = '';
  int? selectedCityIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.85, 1.1);

    final filteredCities = cities
        .where(
          (city) =>
              city['name']!.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        title: Text(
          'Choose City',
          style: AppTextStyles.heading.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20 * scale,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * scale,
          vertical: 10 * scale,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            SearchBarWidget(searchtext: "Search Cities"),

            SizedBox(height: 20 * scale),

            // 🏙 Title
            Text(
              "Available Cities",
              style: AppTextStyles.body.copyWith(
                fontSize: 18 * scale,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 12 * scale),

            // 🪧 City List
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  final city = filteredCities[index];
                  final isSelected = selectedCityIndex == index;
                  return CityCard(
                    name: city['name']!,
                    country: city['country']!,
                    imageUrl: city['image']!,
                    isSelected: isSelected,
                    onTap: () => setState(() => selectedCityIndex = index),
                  );
                },
              ),
            ),

            // 🚀 Continue Button
            Padding(
              padding: EdgeInsets.only(top: 8 * scale, bottom: 12 * scale),
              child: SizedBox(
                width: double.infinity,
                height: 52 * scale,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15 * scale),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    if (selectedCityIndex != null) {
                      Get.toNamed(Routes.CITY_DETAIL);
                    } else {
                      Get.snackbar(
                        "Select a City",
                        "Please select a city before continuing.",
                        backgroundColor: Colors.white,
                        colorText: AppColors.textDark,
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                    style: AppTextStyles.button.copyWith(
                      color: Colors.white,
                      fontSize: 18 * scale,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

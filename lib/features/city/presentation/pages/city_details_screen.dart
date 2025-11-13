import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/constants/api_constants.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/city/presentation/controllers/city_controller.dart';
import 'package:travique/features/home/presentation/widgets/exclusive_package_card.dart';
import 'package:travique/features/home/presentation/widgets/recommended_packages_section.dart';
import 'package:travique/core/widgets/search_bar.dart';
import 'package:travique/routes/app_routes.dart';

class CityDetailsScreen extends StatefulWidget {
  final int id;
  const CityDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final controller = Get.find<CityController>();

  @override
  void initState() {
    super.initState();
    // ✅ Call your API when the screen loads
    debugPrint("screen is fine");
    controller.fetchCityDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = (screenHeight / 800).clamp(0.85, 1.1);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          // 🌀 Show loader while fetching
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // ✅ Once data is fetched, show UI
          final city = controller.cityDetail.value;
          final attractions = controller.topAttractions;
          final categories = controller.category;

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _buildCityHeader(city?.name ?? "City", city?.image ?? "", scale),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SearchBarWidget(searchtext: "Search in ${city?.name}"),
                    const SizedBox(height: 25),
                    _buildSectionTitle("Top Attractions in ${city?.name}"),
                    const SizedBox(height: 10),
                    _buildAttractionSection(context),
                    const SizedBox(height: 25),
                    _buildSectionTitle("Explore ${city?.name}"),
                    const SizedBox(height: 10),
                    _buildCategorySection(categories),
                    const SizedBox(height: 25),
                    RecommendedPackagesSection(country: city?.name ?? ''),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // 🏙️ City Header
  Widget _buildCityHeader(String name, String image, double scale) {
    return Stack(
      children: [
        Container(
          height: 180 * scale,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image.isNotEmpty
                  ? NetworkImage('${ApiConstants.imageUrl}/$image')
                  : const AssetImage('assets/images/placeholder.jpg')
                        as ImageProvider,
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
                "Explore $name",
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

  Widget _buildAttractionSection(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.topAttractions.isEmpty) {
        return const Center(child: Text("No attractions found"));
      }

      return SizedBox(
        height: 270,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.topAttractions.length,
          itemBuilder: (context, index) {
            final item = controller.topAttractions[index];
            return GestureDetector(
              onTap: () =>
                  Get.toNamed(Routes.PLACE_DETAILS, arguments: {'id': item.id}),
              child: ExclusivePackageCard(
                city: item.name, // or item.cityName if you have one
                image: "${ApiConstants.imageUrl}/${item.mainImage}",
                country: item.category,
                rating: double.tryParse(item.averageRating ?? '0') ?? 0.0,
              ), 
            );
          },
        ),
      );
    });
  }

  // 🗺️ Categories Section
  Widget _buildCategorySection(List<dynamic> categories) {
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
                Image.network(
                  '${ApiConstants.imageUrl}/${item.image}',
                  height: 40,
                  width: 40,
                ),
                const SizedBox(height: 6),
                Text(
                  item.name ?? "",
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

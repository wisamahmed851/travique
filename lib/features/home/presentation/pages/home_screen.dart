import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/constants/api_constants.dart';
import 'package:travique/core/service/storage_service.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/core/widgets/search_bar.dart';
import 'package:travique/features/home/presentation/controllers/home_controller.dart';
import 'package:travique/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();

  final List<Map<String, String>> featured = const [
    {
      "title": "Hidden Gems of Europe",
      "subtitle": "Discover charming towns off the beaten path",
      "image": "assets/images/centralPark.jpg",
    },
    {
      "title": "Top Beach Escapes",
      "subtitle": "Sandy shores and blue horizons await",
      "image": "assets/images/bali.jpeg",
    },
  ];

  // Promotion banners for the carousel
  final List<Map<String, String>> promotions = const [
    {
      "title": "Spring Sale - 30% Off",
      "subtitle": "Limited time offers for selected cities",
      "image": "assets/images/rooftopDinner.jpeg",
    },
    {
      "title": "Summer Beaches",
      "subtitle": "Best beaches handpicked for you",
      "image": "assets/images/bali.jpeg",
    },
    {
      "title": "Weekend Getaways",
      "subtitle": "Escape the city for a quick recharge",
      "image": "assets/images/centralPark.jpg",
    },
  ];

  late final PageController _promoController;
  int _promoIndex = 0;
  Timer? _promoTimer;

  @override
  void initState() {
    super.initState();
    _promoController = PageController(initialPage: 0, viewportFraction: 0.94);
    // auto-advance every 4 seconds
    _promoTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_promoController.hasClients && promotions.isNotEmpty) {
        final next = (_promoIndex + 1) % promotions.length;
        _promoController.animateToPage(
          next,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _promoTimer?.cancel();
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Replace the placeholder here with real username from your storage/service:
    final String username = StorageService.getUserName() ?? 'Jhon';

    return Scaffold(
      backgroundColor: AppColors.background,
      // No built-in AppBar: we create appbar-like header inside body for a custom look
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Header + Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                children: [
                  _buildHeader(username),
                  const SizedBox(height: 12),
                  SearchBarWidget(searchtext: "Search destinations..."),
                ],
              ),
            ),

            // Promotion carousel
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Promotions"),
                  const SizedBox(height: 12),
                  _buildPromotionCarousel(),
                ],
              ),
            ),

            // Rest of page content
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Popular Cities"),
                  const SizedBox(height: 10),
                  _buildCityCards(),
                  const SizedBox(height: 25),
                  _buildSectionTitle("Top Experiences"),
                  const SizedBox(height: 10),
                  _buildExperienceGrid(),
                  const SizedBox(height: 25),
                  _buildSectionTitle("Featured Destinations"),
                  const SizedBox(height: 10),
                  _buildFeaturedSlider(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      // Optional: add your bottom navigation in Scaffold.bottomNavigationBar if you want
    );
  }

  Widget _buildHeader(String username) {
    final String? userimage = StorageService.getUserImage();
    final String? imageUrl = (userimage != null && userimage.isNotEmpty)
        ? '${ApiConstants.imageUrl}/$userimage'
        : null;
    return Row(
      children: [
        // greet + subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                  color: AppColors.textDark.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                username,
                style: AppTextStyles.heading.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),

        // small avatar / action icons
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary.withOpacity(0.12),
                backgroundImage: (imageUrl != null)
                    ? NetworkImage(imageUrl)
                    : null,
                child: (imageUrl == null)
                    ? Text(
                        (username.isNotEmpty ? username[0].toUpperCase() : "U"),
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.primary,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPromotionCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _promoController,
            itemCount: promotions.length,
            onPageChanged: (index) {
              setState(() => _promoIndex = index);
            },
            itemBuilder: (context, index) {
              final item = promotions[index];
              return GestureDetector(
                onTap: () {
                  // handle promotion tap
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: AssetImage(item['image']!),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: AppTextStyles.heading.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['subtitle']!,
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // dots indicators
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(promotions.length, (i) {
            final active = i == _promoIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: active ? AppColors.primary : AppColors.borderLightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCityCards() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final cityList = controller.cities;
      if (cityList.isEmpty) {
        return const Center(child: Text("No Popular cities found"));
      }
      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cityList.length,
          itemBuilder: (context, index) {
            final city = cityList[index];
            return GestureDetector(
              onTap: () =>
                  Get.toNamed(Routes.CITY_DETAIL, arguments: city.name),
              child: Container(
                width: 160,
                margin: EdgeInsets.only(
                  right: index == cityList.length - 1 ? 0 : 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${ApiConstants.imageUrl}/${city.image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    city.name,
                    style: AppTextStyles.heading.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildExperienceGrid() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.experiences.isEmpty) {
        return const Center(child: Text('Now Experince found'));
      }
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 12,
        ),
        itemCount: controller.experiences.length,
        itemBuilder: (context, index) {
          final exp = controller.experiences[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderLightGrey, width: 1.5),
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  '${ApiConstants.imageUrl}/${exp.image}',
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  exp.name,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildFeaturedSlider() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featured.length,
        itemBuilder: (context, index) {
          final item = featured[index];
          return Container(
            width: 280,
            margin: EdgeInsets.only(
              right: index == featured.length - 1 ? 0 : 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(item["image"]!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: AppTextStyles.heading.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['subtitle']!,
                    style: AppTextStyles.body.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.heading.copyWith(
        fontSize: 18,
        color: AppColors.black,
      ),
    );
  }
}

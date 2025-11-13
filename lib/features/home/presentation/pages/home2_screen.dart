import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/routes/app_routes.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  final TextEditingController _searchController = TextEditingController();
  String query = "";

  final List<Map<String, String>> destinations = [
    {"title": "Santorini", "subtitle": "Greece", "image": "assets/images/maldives.jpeg"},
    {"title": "Kyoto", "subtitle": "Japan", "image": "assets/images/bali.jpeg"},
    {"title": "Cape Town", "subtitle": "South Africa", "image": "assets/images/bandarban.webp"},
    {"title": "Venice", "subtitle": "Italy", "image": "assets/images/beachResort.jpeg"},
    {"title": "New York", "subtitle": "USA", "image": "assets/images/newyork.jpeg"},
    {"title": "Dubai", "subtitle": "UAE", "image": "assets/images/dubai.png"},
    {"title": "Paris", "subtitle": "France", "image": "assets/images/paris.jpeg"},
    {"title": "Istanbul", "subtitle": "Turkey", "image": "assets/images/paris.jpeg"},
    {"title": "Maldives", "subtitle": "Asia", "image": "assets/images/maldives.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final scale = (screenHeight / 800).clamp(0.85, 1.1);

    final filtered = destinations
        .where((d) =>
            d["title"]!.toLowerCase().contains(query.toLowerCase()) ||
            d["subtitle"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(scale),
              const SizedBox(height: 18),
              _buildSearchBar(),
              const SizedBox(height: 25),
              if (query.isEmpty)
                _buildMainContent(context)
              else
                _buildSearchResults(filtered),
            ],
          ),
        ),
      ),
    );
  }

  // 🏖 Banner Section
  Widget _buildBanner(double scale) {
    return Stack(
      children: [
        Container(
          height: 200 * scale,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/maldives.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 200 * scale,
          width: double.infinity,
          color: Colors.black.withOpacity(0.35),
        ),
        Positioned(
          left: 20,
          bottom: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore the World",
                style: AppTextStyles.heading.copyWith(
                  fontSize: 26 * scale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Find your next dream destination",
                style: AppTextStyles.body.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14 * scale,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🔍 Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Search destinations, hotels...",
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => query = value),
              ),
            ),
            if (query.isNotEmpty)
              GestureDetector(
                onTap: () {
                  _searchController.clear();
                  setState(() => query = "");
                },
                child: const Icon(Icons.close, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  // 🌍 Main content when not searching
  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Discover the World's Best Experiences 🌍",
            style: AppTextStyles.heading.copyWith(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            "Hand-picked destinations for your next adventure — explore mountains, beaches, cities, and beyond.",
            style: AppTextStyles.body.copyWith(
              color: Colors.grey[700],
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _buildExploreButton(context),
        ),
        const SizedBox(height: 35),
        _buildSectionTitle("Popular Destinations ✈"),
        _buildDestinationCards(),
        const SizedBox(height: 35),
        _buildSectionTitle("Top Hotels 🏨"),
        _buildHotelCards(),
        const SizedBox(height: 35),
        _buildSectionTitle("Things To Do 🚗"),
        _buildActivityCards(),
        const SizedBox(height: 40),
        _buildFooter(),
        const SizedBox(height: 20),
      ],
    );
  }

  // 🧭 Search Results
  Widget _buildSearchResults(List<Map<String, String>> results) {
    if (results.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Text(
            "No destinations found 😔",
            style: AppTextStyles.body.copyWith(color: Colors.grey),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: results.map((place) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: AssetImage(place['image']!),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          height: 180,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      place['subtitle']!,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // 🟦 Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        title,
        style: AppTextStyles.heading.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔘 Explore Button
  Widget _buildExploreButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
        ),
        onPressed: () {
          Get.toNamed(Routes.HOME);
        },
        child: Text(
          "Start Exploring",
          style: AppTextStyles.heading.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // 🏙 Destination Cards
  Widget _buildDestinationCards() {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final place = destinations[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(left: 18, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(place['image']!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        place['subtitle']!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 🏨 Hotel Cards
  Widget _buildHotelCards() {
    final hotels = [
      {
        "title": "Ocean View Resort",
        "subtitle": "Santorini",
        "image": "assets/images/paris.jpeg"
      },
      {
        "title": "Mountain Lodge",
        "subtitle": "Switzerland",
        "image": "assets/images/paris.jpeg"
      },
      {
        "title": "City Grand Hotel",
        "subtitle": "New York",
        "image": "assets/images/paris.jpeg"
      },
      {
        "title": "Desert Luxury",
        "subtitle": "Dubai",
        "image": "assets/images/paris.jpeg"
      },
    ];

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return Container(
            width: 220,
            margin: const EdgeInsets.only(left: 18, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: AssetImage(hotel['image']!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        hotel['subtitle']!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 🏄 Activity Cards
  Widget _buildActivityCards() {
    final activities = [
      {
        "title": "Snorkeling",
        "subtitle": "Maldives",
        "image": "assets/images/paris.jpeg"
      },
      {
        "title": "Skiing",
        "subtitle": "Switzerland",
        "image": "assets/images/paris.jpeg"
      },
      {
        "title": "Safari",
        "subtitle": "Kenya",
        "image": "assets/images/paris.jpeg"
      },
      {
        "title": "City Tour",
        "subtitle": "Paris",
        "image": "assets/images/paris.jpeg"
      },
    ];

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(left: 18, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(activity['image']!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        activity['subtitle']!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ⚖ Footer Section
  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          const Divider(thickness: 1, color: Colors.grey, indent: 40, endIndent: 40),
          const SizedBox(height: 10),
          Text(
            "© 2025 Travique. All rights reserved.",
            style: AppTextStyles.body.copyWith(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Made with ❤ for Travelers",
            style: AppTextStyles.body.copyWith(
              color: Colors.grey[700],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
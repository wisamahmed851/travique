import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

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
    {
      "category": "Mountains",
      "image": "assets/images/mountain.png",
    },
    {
      "category": "History",
      "image": "assets/images/History.png",
    },
    {
      "category": "Beach",
      "image": "assets/images/Beach.png",
    }
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
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
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
              _buildExploreSection(),
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
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20)
                // ),
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
                  backgroundColor: Colors.transparent,
                  onSelected: (_) {},
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // 🧳 Package Cards
        _buildExclusivePackageCards(context),
      ],
    );
  }

  Widget _buildExclusivePackageCards(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final item = destinations[index];

          return Container(
            width: screenWidth * 0.75,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                // 🌥️ Bottom-only shadow
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 10), // pushes shadow downward
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼️ Image + Bookmark overlay
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        item["image"],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // 🔖 Bookmark icon
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.black87,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),

                // 🏷️ Details section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item["country"]} Package",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["city"],
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 18.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                      // ⭐ Rating
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                            size: 22,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item["rating"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 20,
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
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildExploreSection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: explore.length,
        itemBuilder: (context, index) {
          final item = explore[index];
          return Container(
            width: 160,
            
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppColors.borderLightGrey,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset(item['image'], height: 80, width: 80),
                const SizedBox(height: 8),
                Text(
                  item['category'],
                  style: AppTextStyles.heading.copyWith(
                    fontSize: 20,
                    color: AppColors.black
                  ),

                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      selectedItemColor: Colors.lightBlueAccent,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Fav",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: "Notif",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}

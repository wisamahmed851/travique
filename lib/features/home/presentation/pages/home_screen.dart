import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {"name": "All", "isSelected": true},
    {"name": "Jungle", "isSelected": false},
    {"name": "Mountain", "isSelected": false},
    {"name": "Historical", "isSelected": false},
  ];

  final List<Map<String, dynamic>> destinations = [
    {
      "country": "France",
      "city": "Paris",
      "rating": 4.6,
      "image":
          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800",
    },
    {
      "country": "France",
      "city": "Paris",
      "rating": 4.6,
      "image":
          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800",
    },
    {
      "country": "France",
      "city": "Paris",
      "rating": 4.6,
      "image":
          "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800",
    },
    {
      "country": "Italy",
      "city": "Venice",
      "rating": 4.8,
      "image":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800",
    },
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
              _buildCategorySection(context),
              const SizedBox(height: 25),
              _buildSectionTitle("Popular"),
              const SizedBox(height: 10),
              _buildPopularSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/women/44.jpg',
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text(
              "Fatemeh Hamedi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search destination",
        hintStyle: TextStyle(color: AppColors.borderLightGrey, fontSize: 16),
        prefixIcon: const Icon(Icons.search, color: AppColors.borderLightGrey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.borderLightGrey,
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: AppTextStyles.heading.copyWith(fontSize: 18)),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = categories[index]["isSelected"];
              return Container(
                margin: const EdgeInsets.only(right: 10),
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
                  showCheckmark: false, // 🔹 removes the tick icon
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide.none, // 🔹 removes border outline
                  ),
                  selected: isSelected,
                  selectedColor: Colors.lightBlueAccent,
                  backgroundColor: Colors.grey.shade200,
                  onSelected: (bool selected) {},
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        _buildDestinationCards(context),
      ],
    );
  }

  Widget _buildDestinationCards(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final item = destinations[index];
          return Container(
            width: screenWidth * 0.75,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item["image"]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
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
                        item["country"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.white70,
                          ),
                          Text(
                            item["city"],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.amberAccent,
                          ),
                          Text(
                            item["rating"].toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
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

  Widget _buildPopularSection() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popular.length,
        itemBuilder: (context, index) {
          final item = popular[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(item["image"]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["country"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 12,
                                color: Colors.white70,
                              ),
                              Text(
                                item["city"],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.amberAccent,
                          ),
                          Text(
                            item["rating"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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

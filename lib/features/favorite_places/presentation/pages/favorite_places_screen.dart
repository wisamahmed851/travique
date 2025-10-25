import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travique/core/theme/app_colors.dart';

class FavoritePlacesScreen extends StatelessWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> places = [
      {
        'name': 'Maldives Island',
        'country': 'South Asia',
        'description':
            'Experience the paradise of turquoise waters and white sand beaches in the Maldives. Perfect for a relaxing tropical getaway filled with marine life and serenity.',
        'image': 'assets/images/maldives.jpeg',
        'gallery': [
          'assets/images/gallery1.png',
          'assets/images/gallery2.png',
          'assets/images/gallery3.png',
          'assets/images/gallery4.png',
          'assets/images/gallery5.jpeg',
        ],
        'attractions': [
          'Snorkeling & Diving',
          'Island Hopping',
          'Underwater Restaurants',
          'Resort Spas',
          'Sunset Cruises'
        ],
      },
      {
        'name': 'Paris Getaway',
        'country': 'France',
        'description':
            'Discover the charm of Paris — from the Eiffel Tower to the romantic streets of Montmartre. Explore world-class art, food, and architecture in the City of Lights.',
        'image': 'assets/images/paris.jpeg',
        'gallery': [
          'assets/images/gallery2.png',
          'assets/images/gallery3.png',
          'assets/images/gallery4.png',
        ],
        'attractions': [
          'Eiffel Tower',
          'Louvre Museum',
          'Seine River Cruise',
          'Notre-Dame Cathedral',
          'Champs-Élysées'
        ],
      },
    ];

    final place = places[1]; // static example

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header Image ---
            Stack(
              children: [
                Image.asset(
                  place['image'] as String,
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.4),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // --- Main Content ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.scaffold,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              transform: Matrix4.translationValues(0, -20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Location Info ---
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.primary, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        place['country'] as String,
                        style: const TextStyle(color: AppColors.textGrey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place['name'] as String,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, thickness: 0.3),
                  const SizedBox(height: 12),

                  // --- About the Place ---
                  const Text(
                    "About the City",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    place['description'] as String,
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- Top Attractions ---
                  const Text(
                    "Top Attractions",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: (place['attractions'] as List<String>)
                        .map((a) => _bulletPoint(a))
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  // --- Photo Gallery ---
                  const Text(
                    "Photo Gallery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: (place['gallery'] as List).length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            place['gallery'][index],
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- Map Section ---
                  const Text(
                    "Location Map",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/map_sample.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- Social Share ---
                  const Text(
                    "Share with Friends",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      _SocialIcon(FontAwesomeIcons.facebookF, Colors.blue),
                      SizedBox(width: 14),
                      _SocialIcon(FontAwesomeIcons.twitter, Colors.lightBlue),
                      SizedBox(width: 14),
                      _SocialIcon(FontAwesomeIcons.linkedinIn, Colors.blueAccent),
                      SizedBox(width: 14),
                      _SocialIcon(FontAwesomeIcons.whatsapp, Colors.green),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.place, color: AppColors.primary, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.textGrey),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SocialIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      radius: 20,
      child: Icon(icon, color: color, size: 18),
    );
  }
}


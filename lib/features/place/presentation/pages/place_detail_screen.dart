import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travique/core/theme/app_colors.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header Image ---
            Stack(
              children: [
                Image.asset(
                  'assets/images/maldives.jpeg',
                  height: 300,
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

            // --- Title, Price, Tabs ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: AppColors.scaffold,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              transform: Matrix4.translationValues(0, -20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Country in South Asia",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      const Spacer(),
                      Text(
                        "\$2500",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Estimated",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Maldives Package",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // --- Tabs ---
                  Row(
                    children: [
                      _buildTab("Overview", true),
                      _buildTab("Itinerary", false),
                      _buildTab("Review & Ratings", false),
                    ],
                  ),
                ],
              ),
            ),

            // --- Trip Plan ---
            _sectionTitle("Trip Plan"),
            _sectionBody(
              "There are many variations of passages of Lorem Ipsum available, "
              "but the majority have suffered alteration in some form, by injected humour, "
              "or randomised words which don't look even slightly believable.",
            ),

            // --- Photo Gallery ---
            _sectionTitle("Photo Gallery"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 1; i <= 5; i++)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        i >= 5
                            ? 'assets/images/gallery5.jpeg'
                            : 'assets/images/gallery$i.png',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        '+3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- Inclusion & Exclusion ---
            _sectionTitle("Inclusion & Exclusion"),
            _sectionSubtitle("Inclusion"),
            _sectionList([
              "There are many variations of passages.",
              "Majority have suffered alteration some.",
              "Randomised words which look slightly.",
            ]),
            _sectionSubtitle("Exclusion"),
            _sectionList([
              "There are many variations of passages.",
              "Majority have suffered alteration some.",
              "Randomised words which look slightly.",
            ]),

            // --- FAQ ---
            _sectionTitle("FAQ"),
            _faqItem(
              "01. There are many variations of passages?",
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            _faqItem(
              "02. There are many variations of passages?",
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            _faqItem(
              "03. There are many variations of passages?",
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),

            // --- Map Section ---
            _sectionTitle("Location With Map"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/map_sample.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // --- Social Media ---
            _sectionTitle("Share Social Media"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
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
            ),

            // --- Book Now Button ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  static Widget _buildTab(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.primary.withOpacity(0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? AppColors.primary : AppColors.textGrey,
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  static Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      ),
    ),
  );

  static Widget _sectionSubtitle(String text) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkGrey,
      ),
    ),
  );

  static Widget _sectionBody(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Text(text, style: const TextStyle(color: AppColors.textGrey)),
  );

  static Widget _sectionList(List<String> items) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "${(e.key + 1).toString().padLeft(2, '0')}. ${e.value}",
                style: const TextStyle(color: AppColors.textGrey, height: 1.4),
              ),
            ),
          )
          .toList(),
    ),
  );

  static Widget _faqItem(String question, String answer) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(answer, style: const TextStyle(color: AppColors.textGrey)),
      ],
    ),
  );
}

// --- Social Icon Widget ---
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

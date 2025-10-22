import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/routes/app_routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/intro1.png',
      'title': 'Plan Your Trip',
      'desc': 'Save places and book your perfect trip with Circel App',
      'button': 'Next',
    },
    {
      'image': 'assets/images/intro2.png',
      'title': 'Begin The Adventure',
      'desc': 'Begin The Circel App with Alone or your family & friends',
      'button': 'Next',
    },
    {
      'image': 'assets/images/intro3.png',
      'title': 'Enjoy Your Trip',
      'desc': 'Enjoy your Circle Travel Package and stay relax',
      'button': 'Get Started',
    },
  ];

  // Called when user taps the bottom button
  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      // Immediately update texts/buttons (so they don't slide)
      setState(() {
        _currentPage = _currentPage + 1;
      });
      // Animate the image PageView to the next page
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double horizontalPadding = 28.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top row with Skip aligned to right
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.LOGIN),
                  child: Text(
                    'Skip',
                    style: AppTextStyles.body.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Image area: only this PageView will slide
            SizedBox(
              height: size.height * 0.45,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                // when user swipes manually, update current page (so title/desc change)
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Center(
                      child: Image.asset(
                        _pages[index]['image']!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        // keep image aspect and allow nice slide
                      ),
                    ),
                  );
                },
              ),
            ),

            // Small spacing between image and content
            const SizedBox(height: 24),

            // Page indicator (fixed, updates based on _currentPage)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (dotIndex) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  height: 8,
                  width: _currentPage == dotIndex ? 22 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == dotIndex
                        ? AppColors.primary
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Title (fixed — changes instantly when _currentPage changes)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                _pages[_currentPage]['title']!,
                textAlign: TextAlign.center,
                style: AppTextStyles.heading.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Description (fixed)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding + 4),
              child: Text(
                _pages[_currentPage]['desc']!,
                textAlign: TextAlign.center,

                style: AppTextStyles.body.copyWith(
                  fontSize: 15,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Bottom button (fixed) — text changes based on _currentPage
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _onNextPressed,
                  child: Text(
                    _pages[_currentPage]['button']!,
                    style: AppTextStyles.button.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/routes/app_routes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.8, 1.0);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // ✅ Background image (top layer)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.8,
            child: Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          Positioned(
            top: size.height * 0.1,
            left: 0,
            right: 0,
            height: size.height * 1,
            child: Image.asset(
              'assets/images/login_bg_front.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // ✅ Main content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // ✅ Logo
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: size.height * 0.15,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 12 * scale),

                // ✅ App title (Travique)
                Text(
                  'Travique',
                  style: AppTextStyles.heading.copyWith(
                    fontSize: 22 * scale,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textGrey,
                  ),
                ),

                SizedBox(height: 10 * scale),

                const Spacer(flex: 3),

                // ✅ Buttons Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24 * scale),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ✅ Heading (subtitle)
                      Text(
                        'Discover best\nplace to vacation',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 22 * scale,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGrey,
                          height: 1.3,
                        ),
                      ),

                      SizedBox(height: 22 * scale),

                      // ✅ "Log in" Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 18 * scale),
                          ),
                          onPressed: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            'Log in',
                            style: AppTextStyles.button.copyWith(
                              fontSize: 20 * scale,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10 * scale),

                      // ✅ "Sign up" Button (outlined)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Get.offAllNamed(Routes.SIGNUP),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.secondary,
                              width: 1.4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 19 * scale),
                          ),
                          child: Text(
                            'Sign up',
                            style: AppTextStyles.link.copyWith(
                              fontSize: 20 * scale,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

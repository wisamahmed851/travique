import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate loading or intro delay
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.INTRO); // navigate to your intro screen
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Logo
            Image.asset(
              'assets/images/logo.png',
              height: size.height * 0.2,
            ),
            const SizedBox(height: 20),

            // ✅ App name
            Text(
              'Travique',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

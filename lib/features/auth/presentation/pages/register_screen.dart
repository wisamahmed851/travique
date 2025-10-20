import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/widgets/shadowed_field.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';
import 'package:travique/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final double scale = (size.height / 800).clamp(0.8, 1.0);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.scaffold,
      body: Stack(
        children: [
          // ✅ Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.7,
            child: Image.asset(
              'assets/images/login_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // ✅ Overlay image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * 0.8,
            child: Image.asset(
              'assets/images/login_bg_front.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // ✅ Form Section
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.001,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: keyboardOpen ? 20 : 0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8 * scale),
                padding: EdgeInsets.all(8 * scale),
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name Field
                    buildShadowedField(
                      hint: 'Name',
                      controller: controller.emailController,
                      scale: scale,
                    ),
                    SizedBox(height: 12 * scale),

                    // Email Field
                    buildShadowedField(
                      hint: 'Email',
                      controller: controller.emailController,
                      scale: scale,
                    ),
                    SizedBox(height: 12 * scale),

                    // Password Field
                    buildShadowedField(
                      hint: 'Password',
                      controller: controller.passwordController,
                      obscure: true,
                      scale: scale,
                    ),
                    SizedBox(height: 12 * scale),

                    // Re-enter Password Field
                    buildShadowedField(
                      hint: 'Re-enter Password',
                      controller: controller.emailController,
                      obscure: true,
                      scale: scale,
                    ),
                    SizedBox(height: 18 * scale),

                    // ✅ Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          padding: EdgeInsets.symmetric(vertical: 16 * scale),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Submit',
                          style: AppTextStyles.button.copyWith(
                            fontSize: 20 * scale,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18 * scale),

                    // ✅ Already have an account
                    TextButton(
                      onPressed: () => Get.offAllNamed(Routes.LOGIN),
                      child: Text(
                        'Already have an account?',
                        style: AppTextStyles.link.copyWith(
                          fontSize: 18 * scale,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ✅ App Bar (Back + Title)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.offAllNamed(Routes.LOGIN),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.textGrey,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Sign up',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

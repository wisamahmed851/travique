import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/core/widgets/shadowed_field.dart';
import 'package:travique/core/widgets/submit_button.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';
import 'package:travique/routes/app_routes.dart';

class ForgetPassword extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.8, 1.0);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
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
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                height: size.height * 0.35,
                padding: EdgeInsets.all(8 * scale),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Enter Your Email to Reset Password',
                      style: AppTextStyles.body.copyWith(
                        fontSize: 16 * scale,
                        color: AppColors.textGrey,
                      ),
                    ),
                    ),
                    SizedBox(height: 12 * scale),
                    // ✅ Reusable Email Field
                    buildShadowedField(
                      hint: 'Email',
                      controller: controller.emailController,
                      scale: scale,
                    ),
                    SizedBox(height: 12 * scale),

                    // ✅ Submit Button
                    PrimaryButton(text: 'Submit', onPressed: controller.login, scale: scale)],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(5 * scale),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.offAllNamed(Routes.SIGNUP),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.textGrey,
                      size: 20 * scale,
                    ),
                  ),
                  SizedBox(width: 4 * scale),
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

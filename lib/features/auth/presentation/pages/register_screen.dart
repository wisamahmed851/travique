import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';
import 'package:travique/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.85, 1.1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28 * scale),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🖼️ Top Image
                SizedBox(
                  height: size.height * 0.28,
                  child: Image.asset(
                    'assets/images/register.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 36 * scale),

                // 🏷️ Title
                Text(
                  'Create Account',
                  style: AppTextStyles.heading.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 26 * scale,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 28 * scale),

                // ✉️ Name Field
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: AppTextStyles.body.copyWith(
                      color: Colors.grey[500],
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16 * scale,
                      horizontal: 16 * scale,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: AppTextStyles.body.copyWith(fontSize: 16 * scale),
                ),
                SizedBox(height: 16 * scale),
                // ✉️ Email Field
                TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Your email',
                    hintStyle: AppTextStyles.body.copyWith(
                      color: Colors.grey[500],
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16 * scale,
                      horizontal: 16 * scale,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: AppTextStyles.body.copyWith(fontSize: 16 * scale),
                ),
                SizedBox(height: 16 * scale),

                // 🔒 Password Field
                Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      hintText: 'Your password',
                      hintStyle: AppTextStyles.body.copyWith(
                        color: Colors.grey[500],
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16 * scale,
                        horizontal: 16 * scale,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[500],
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    style: AppTextStyles.body.copyWith(fontSize: 16 * scale),
                  ),
                ),
                SizedBox(height: 20 * scale),
                Obx(
                  () => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      hintText: 'Re-Password',
                      hintStyle: AppTextStyles.body.copyWith(
                        color: Colors.grey[500],
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16 * scale,
                        horizontal: 16 * scale,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[500],
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    style: AppTextStyles.body.copyWith(fontSize: 16 * scale),
                  ),
                ),
                SizedBox(height: 20 * scale),

                // 🔵 Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 52 * scale,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: controller.login,
                    child: Text(
                      'Sign in',
                      style: AppTextStyles.button.copyWith(
                        color: Colors.white,
                        fontSize: 18 * scale,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22 * scale),

                // 🆕 Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an acount? ",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 15 * scale,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAllNamed(Routes.LOGIN),
                      child: Text(
                        'Sign in',
                        style: AppTextStyles.link.copyWith(
                          fontSize: 15 * scale,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12 * scale),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

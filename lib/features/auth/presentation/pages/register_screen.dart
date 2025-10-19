import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/widgets/shadowed_field.dart';
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
      backgroundColor: Colors.white,
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
         
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.001,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: keyboardOpen ? 20 : 0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8 * scale),
                padding: EdgeInsets.all(8 * scale),
                decoration: BoxDecoration(
                  color: Colors.transparent, // keep it clean
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ✅ Name Field
                    buildShadowedField(
                      hint: 'Name',
                      controller: controller.emailController,
                      scale: scale,
                    ),

                    SizedBox(height: 12 * scale),

                    // ✅ Email Field
                    buildShadowedField(
                      hint: 'Email',
                      controller: controller.emailController,
                      scale: scale,
                    ),

                    SizedBox(height: 12 * scale),

                    // ✅ Password Field
                    buildShadowedField(
                      hint: 'Password',
                      controller: controller.passwordController,
                      obscure: true,
                      scale: scale,
                    ),

                    SizedBox(height: 12 * scale),

                    // ✅ Re-enter Password Field
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
                          backgroundColor: const Color(0xFF9ECBE5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          padding: EdgeInsets.symmetric(vertical: 16 * scale),
                        ),
                        onPressed: () => {},
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20 * scale,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 18 * scale),

                    // ✅ Already have account
                    TextButton(
                      onPressed: () => Get.offAllNamed(Routes.LOGIN),
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 18 * scale,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

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
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ), // Small space between icon and text
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF676666),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Fixed bottom form container (always 10% from bottom)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';
import 'package:travique/routes/app_routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _resetPasswordScreenState();
}

class _resetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double scale = (size.height / 800).clamp(0.85, 1.1);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 28 * scale,
              vertical: 20 * scale,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    // padding: EdgeInsets.all(6 * scale),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.textDark,
                      size: 26 * scale,
                    ),
                  ),
                ),

                SizedBox(height: 45 * scale),
                // 🏷️ Title
                Center(
                  child: Text(
                    'New Password',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26 * scale,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 28 * scale),
                // ✉️ Email Field
                TextField(
                  controller: controller.resetPasswordNewPasswordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'New password',
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
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Confirm new password',
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
                    onPressed: () {
                      controller.resetPassword(widget.email);
                    },
                    child: Text(
                      'Sent Code',
                      style: AppTextStyles.button.copyWith(
                        color: Colors.white,
                        fontSize: 18 * scale,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

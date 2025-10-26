import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/core/widgets/submit_button.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  Widget _inputField({
    required IconData icon,
    required String hint,
  }) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textGrey),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: AppTextStyles.body.copyWith(
                fontSize: 15,
                color: AppColors.textDark,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.inputfields.copyWith(
                  fontSize: 15,
                  color: AppColors.textGrey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.black,
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Edit Profile",
          style: AppTextStyles.heading,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Profile Icon with Edit Button
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/profile.jpeg"),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: const Icon(Icons.edit, size: 18, color: AppColors.primary),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Input Fields
              _inputField(icon: Icons.person, hint: "Jit Banik"),
              const SizedBox(height: 16),

              _inputField(icon: Icons.email_outlined, hint: "jit.banik@email.com"),
              const SizedBox(height: 16),

              _inputField(icon: Icons.phone, hint: "+88010000000000"),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _inputField(icon: Icons.person_outline, hint: "Male"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _inputField(icon: Icons.calendar_today, hint: "01-01-1990"),
                  ),
                ],
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: PrimaryButton(
          text: "Save Profile",
          onPressed: () {},
        ),
      ),
    );
  }
}

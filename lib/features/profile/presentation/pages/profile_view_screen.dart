import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/core/widgets/submit_button.dart';
import 'package:travique/routes/app_routes.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  Widget _label(String text) {
    return Text(
      text,
      style: AppTextStyles.inputfields.copyWith(
        fontSize: 14,
        color: AppColors.textGrey,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _value(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 12),
      child: Text(
        text,
        style: AppTextStyles.body.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textDark,
        ),
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
        title: const Text("Profile", style: AppTextStyles.heading),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.black,
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Jit Banik!",
                        style: AppTextStyles.heading.copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Joined  –  Mar 2021",
                        style: AppTextStyles.inputfields.copyWith(
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Email
              _label("Email"),
              _value("jit.banik@email.com"),
              Divider(height: 1, color: AppColors.borderLightGrey),

              const SizedBox(height: 12),

              // Phone Number
              _label("Phone Number"),
              _value("+8801700000000"),
              Divider(height: 1, color: AppColors.borderLightGrey),

              const SizedBox(height: 12),

              // Gender
              _label("Gender"),
              _value("Male"),
              Divider(height: 1, color: AppColors.borderLightGrey),

              const SizedBox(height: 12),

              // DOB
              _label("Date of Birth"),
              _value("01/01/1990"),
              Divider(height: 1, color: AppColors.borderLightGrey),

              const SizedBox(height: 30),

              // Connect Facebook Button Tile
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.borderLightGrey),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.facebook,
                        size: 32,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Connect Facebook",
                        style: AppTextStyles.link.copyWith(
                          fontSize: 18,
                          color: AppColors.black,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: "Edit",
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE_EDIT);
                  },
                  backgroundColor: AppColors.background,
                  textColor: AppColors.primary,
                  isOutlined: true,
                  borderColor: AppColors.primary,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

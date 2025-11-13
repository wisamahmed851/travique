import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/core/theme/app_colors.dart';
import 'package:travique/core/theme/app_text_styles.dart';
import 'package:travique/features/auth/presentation/controllers/auth_controller.dart';
import 'package:travique/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Section ---
              Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jit Banik',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'jit.banik@mail.com',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Divider(color: AppColors.borderLightGrey, thickness: 0.8),

              // --- Account Section ---
              sectionTitle('Account'),
              profileItem(
                Icons.person,
                'Your Profile',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),
              profileItem(
                Icons.flag,
                'All Country',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),

              const SizedBox(height: 12),
              Divider(color: AppColors.borderLightGrey, thickness: 0.8),

              // --- Settings Section ---
              sectionTitle('Settings'),
              profileItem(
                Icons.language_rounded,
                'Language',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),
              profileItem(
                Icons.bolt,
                'Dark Mode',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),

              const SizedBox(height: 12),
              Divider(color: AppColors.borderLightGrey, thickness: 0.8),

              // --- Help & Legal Section ---
              sectionTitle('Help & Legal'),
              profileItem(
                Icons.support_agent_rounded,
                'Emergency Support',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),
              profileItem(
                Icons.help,
                'Help',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),
              profileItem(
                Icons.warning_amber_rounded,
                'Terms & Conditions',
                () => Get.toNamed(Routes.PROFILE_VIEW),
              ),

              const SizedBox(height: 12),
              Divider(color: AppColors.borderLightGrey, thickness: 0.8),

              // --- Logout ---
              profileItem(
                Icons.logout_rounded,
                'Logout',
                () => controller.logut(),
                iconColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Section Title Widget ---
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.textGrey,
          fontSize: 14,
        ),
      ),
    );
  }

  // --- Profile Item Widget ---
  Widget profileItem(
    IconData icon,
    String label,
    VoidCallback? route, {
    Color? iconColor,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 12,
      leading: Icon(icon, color: iconColor ?? AppColors.primary, size: 25),
      title: Text(
        label,
        style: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
          fontSize: 15,
        ),
      ),
      onTap: route,
    );
  }
}

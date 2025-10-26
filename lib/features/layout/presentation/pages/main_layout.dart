import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travique/features/favorite_places/presentation/pages/favorite_places_screen.dart';
import 'package:travique/features/home/presentation/pages/home_screen.dart';
import 'package:travique/features/layout/presentation/controllers/layout_controller.dart';
import 'package:travique/features/layout/presentation/widgets/bottom_navigation.dart';
import 'package:travique/features/profile/presentation/pages/profile_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LayoutController());

    final List<Widget> pages = [
      CityHomeScreen(),
      FavoritePlacesScreen(),
      Placeholder(),
      ProfileScreen(),
    ];
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigation(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onChangeTab,
        ),
      );
    });
  }
}

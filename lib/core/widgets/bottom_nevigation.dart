import 'package:flutter/material.dart';
import 'package:travique/core/theme/app_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.bookmark_border_rounded,
    Icons.mail_outline_rounded,
    Icons.settings_outlined,
  ];

  final List<String> _labels = [
    "Home",
    "Favorite",
    "Inbox",
    "More",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: List.generate(_icons.length, (index) {
          final bool isSelected = _selectedIndex == index;
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelected)
                  Container(
                    height: 2,
                    width: 24,
                    margin: const EdgeInsets.only(bottom: 4),
                    color: AppColors.primary,
                  )
                else
                  const SizedBox(height: 6), // spacing align
                Icon(
                  _icons[index],
                  color: isSelected ? AppColors.primary : Colors.grey,
                ),
              ],
            ),
            label: _labels[index],
          );
        }),
      ),
    );
  }
}

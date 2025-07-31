import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/pages/activity_page.dart';
import 'package:job_tracker/presentation/pages/companies_page.dart';
import 'package:job_tracker/presentation/pages/profile_page.dart';
import '../../core/config/design_config.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const BottomNavigation({super.key, required this.currentIndex});

  void _navigateTo(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget destination;
    switch (index) {
      case 0:
        destination = const HomePage();
        break;
      case 1:
        destination = const SearchPage();
        break;
      case 2:
        destination = const CompaniesPage();
        break;
      case 3:
        destination = const ActivityPage();
        break;
      case 4:
        destination = const ProfilePage();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    final items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.search, 'label': 'Search'},
      {'icon': Icons.business, 'label': 'Companies'},
      {'icon': Icons.assignment, 'label': 'Activity'},
      {'icon': Icons.person, 'label': 'Profile'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: design.primaryBackgroundColor,
        boxShadow: [
          if (design.primaryBackgroundColor.computeLuminance() > 0.5)
            const BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => _navigateTo(context, index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: isActive
                  ? BoxDecoration(
                color: design.primaryColor.withOpacity(0.1),
                borderRadius: design.buttonBorderRadius,
              )
                  : null,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index]['icon'] as IconData,
                    color: isActive
                        ? design.primaryColor
                        : design.buttonDarkGrayColor,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[index]['label'] as String,
                    style: TextStyle(
                      fontFamily: design.fontFamily,
                      fontSize: design.tinyFontSize,
                      fontWeight:
                      isActive ? design.semiBold : design.light,
                      color: isActive
                          ? design.primaryColor
                          : design.buttonDarkGrayColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

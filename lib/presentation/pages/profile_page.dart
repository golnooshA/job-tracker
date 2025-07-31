import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/pages/about_page.dart';
import 'package:job_tracker/presentation/pages/notification_page.dart';
import 'package:job_tracker/presentation/pages/preferences_page.dart';
import 'package:job_tracker/presentation/widgets/menu_item.dart';
import 'package:job_tracker/presentation/widgets/outline_button_text.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bottom_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Scaffold(
      backgroundColor: design.backgroundColor,
      appBar: AppBarBuilder(title: 'Profile'),
      bottomNavigationBar: const BottomNavigation(currentIndex: 4),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Column(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: design.primaryColor,
                  child: Icon(
                    Icons.person,
                    size: 36,
                    color: design.buttonTextColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Jack Fisher",
                  style: TextStyle(
                    fontSize: design.subtitleFontSize,
                    fontWeight: design.semiBold,
                    fontFamily: design.fontFamily,
                    color: design.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "jack@email.co",
                  style: TextStyle(
                    fontSize: design.textFontSize,
                    fontWeight: design.light,
                    fontFamily: design.fontFamily,
                    color: design.subTextColor,
                  ),
                ),
                const SizedBox(height: 12),
                OutlineButtonText(title: 'Edit Profile', onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(height: 1),
            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                children: [
                  MenuItem(
                    icon: Icons.settings,
                    title: 'Preferences',
                    subtitle: 'Theme, Settings',
                    iconColor: design.textColor,
                    titleColor: design.textColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PreferencesPage()),
                      );
                    },
                  ),
                  MenuItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subtitle: 'Notification',
                    iconColor: design.textColor,
                    titleColor: design.textColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NotificationPage()),
                      );
                    },
                  ),
                  MenuItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    subtitle: 'About the application',
                    iconColor: design.textColor,
                    titleColor: design.textColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AboutPage()),
                      );
                    },
                  ),
                  const Divider(height: 16),
                  MenuItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                    subtitle: 'Exit from your account',
                    iconColor: design.buttonRedColor,
                    titleColor: design.buttonRedColor,
                    onTap: () {
                      // Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

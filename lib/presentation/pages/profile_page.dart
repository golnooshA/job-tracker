import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/menu_item.dart';
import 'package:job_tracker/presentation/widgets/outline_button_text.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'Profile'),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Column(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, size: 36, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Jack Fisher",
                  style: TextStyle(
                    fontSize: DesignConfig.subTitleSize,
                    fontWeight: DesignConfig.semiBold,
                    fontFamily: DesignConfig.fontFamily,
                    color: DesignConfig.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "jack@email.co",
                  style: TextStyle(
                    fontSize: DesignConfig.textSize,
                    color: DesignConfig.subTextColor,
                    fontFamily: DesignConfig.fontFamily,
                    fontWeight: DesignConfig.light,
                  ),
                ),
                const SizedBox(height: 12),
                OutlineButtonText(title: 'Edit Profile', onTap: () {}),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(height: 1),

            // Menu items
            Expanded(
              child: ListView(
                children: [
                  MenuItem(
                    icon: Icons.settings,
                    title: 'Preferences',
                    subtitle: 'Theme, Settings',
                    onTap: () {},
                  ),

                  MenuItem(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subtitle: 'Ringtone, Message, Notification',
                  ),

                  // MenuItem(
                  //   icon: Icons.help_outline,
                  //   title: 'Help',
                  //   subtitle: 'Contact Us',
                  //   onTap: () {},
                  // ),

                  MenuItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    subtitle: 'About the application',
                    onTap: () {},
                  ),

                  const Divider(height: 16),

                  MenuItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                    subtitle: 'Exit from your account',
                    iconColor: Colors.red,
                    titleColor: Colors.red,
                    onTap: () {},
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

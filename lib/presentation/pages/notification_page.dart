import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/config/design_config.dart';
import '../../services/notification_service.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/switch_tile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool pushNotification = true;
  bool newJobNotification = true;
  bool appliedStatusNotification = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pushNotification = prefs.getBool('pushNotification') ?? true;
      newJobNotification = prefs.getBool('newJobNotification') ?? true;
      appliedStatusNotification = prefs.getBool('appliedStatusNotification') ?? true;
    });
  }

  Future<void> _saveSetting(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  void _handleSwitchChange(String key, bool value, String title, String message) {
    setState(() {
      switch (key) {
        case 'pushNotification':
          pushNotification = value;
          break;
        case 'newJobNotification':
          newJobNotification = value;
          break;
        case 'appliedStatusNotification':
          appliedStatusNotification = value;
          break;
      }
    });

    _saveSetting(key, value);

    if (value) {
      NotificationService.showTestNotification(title, message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Scaffold(
      backgroundColor: design.backgroundColor,
      appBar: AppBarBuilder(title: 'Notification'),
      bottomNavigationBar: const BottomNavigation(currentIndex: 4),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // SwitchTile(
            //   title: "Push Notification",
            //   value: pushNotification,
            //   onChanged: (val) {
            //     _handleSwitchChange(
            //       'pushNotification',
            //       val,
            //       "Push Enabled",
            //       "You’ll now receive push notifications.",
            //     );
            //   },
            // ),

            SwitchTile(
              title: "New Job Notification",
              value: newJobNotification,
              onChanged: (val) {
                _handleSwitchChange(
                  'newJobNotification',
                  val,
                  "New Jobs Enabled",
                  "You'll now be notified when new jobs are posted.",
                );
              },
            ),

            SwitchTile(
              title: "Applied Status Notification",
              value: appliedStatusNotification,
              onChanged: (val) {
                _handleSwitchChange(
                  'appliedStatusNotification',
                  val,
                  "Status Updates Enabled",
                  "You’ll now receive updates on your job applications.",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

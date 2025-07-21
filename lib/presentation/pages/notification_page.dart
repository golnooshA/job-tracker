import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/switch_tile.dart';
import '../widgets/text_list_tile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool pushNotification = true;
  bool newJobNotification = true;
  bool appliedStatusNotification = true;

  bool messageNotification = true;
  bool reminders = true;

  bool sound = true;
  bool vibrate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'Notification'),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'General Notification',
                style: TextStyle(
                  fontSize: DesignConfig.subTextSize,
                  color: DesignConfig.subTextColor,
                  fontFamily: DesignConfig.fontFamily,
                  fontWeight: DesignConfig.light,
                ),
              ),
            ),
            SwitchTile(
              title: "Push Notification",
              value: pushNotification,
              onChanged: (val) => setState(() => pushNotification = val),
            ),
            SwitchTile(
              title: "New Job Notification",
              value: newJobNotification,
              onChanged: (val) => setState(() => newJobNotification = val),
            ),
            SwitchTile(
              title: "Applied Status Notification",
              value: appliedStatusNotification,
              onChanged: (val) => setState(() => appliedStatusNotification = val),
            ),
            const Divider(height: 8, thickness: 6, color: DesignConfig.borderColor),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Message Notification',
                style: TextStyle(
                  fontSize: DesignConfig.subTextSize,
                  color: DesignConfig.subTextColor,
                  fontFamily: DesignConfig.fontFamily,
                  fontWeight: DesignConfig.light,
                ),
              ),
            ),
            SwitchTile(
              title: "Message",
              value: messageNotification,
              onChanged: (val) => setState(() => messageNotification = val),
            ),
            SwitchTile(
              title: "Reminders",
              value: reminders,
              onChanged: (val) => setState(() => reminders = val),
            ),
            const Divider(height: 8, thickness: 6, color: DesignConfig.borderColor),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'App Notification',
                style: TextStyle(
                  fontSize: DesignConfig.subTextSize,
                  color: DesignConfig.subTextColor,
                  fontFamily: DesignConfig.fontFamily,
                  fontWeight: DesignConfig.light,
                ),
              ),
            ),
            SwitchTile(
              title: "Sound",
              value: sound,
              onChanged: (val) => setState(() => sound = val),
            ),
            TextListTile(
              title: "Tone",
              value: "Default",
              onTap: () {}, // Add functionality if needed
            ),

            SwitchTile(
              title: "Vibrate",
              value: vibrate,
              onChanged: (val) => setState(() => vibrate = val),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: DesignConfig.tinyTextSize,
          fontWeight: DesignConfig.light,
          color: DesignConfig.subTextColor,
          fontFamily: DesignConfig.fontFamily,
        ),
      ),
    );
  }
}

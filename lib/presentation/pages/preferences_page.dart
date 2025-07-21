import 'package:flutter/material.dart';
import 'package:job_tracker/presentation/widgets/text_list_tile.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/switch_tile.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool isDataSaving = true;
  bool isReminderOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'Preference'),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Theme and Language',
                style: TextStyle(
                  fontSize: DesignConfig.subTextSize,
                  color: DesignConfig.subTextColor,
                  fontFamily: DesignConfig.fontFamily,
                  fontWeight: DesignConfig.light,
                ),
              ),
            ),
            const SizedBox(height: 12),

            TextListTile(title: 'Mode', value: 'Light', onTap: () {}),
            const Divider(height: 1),

            TextListTile(title: 'Language', value: 'English', onTap: () {}),

            const Divider(height: 8, thickness: 6, color: DesignConfig.borderColor),

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'App Setting',
                style: TextStyle(
                  fontSize: DesignConfig.subTextSize,
                  color: DesignConfig.subTextColor,
                  fontFamily: DesignConfig.fontFamily,
                  fontWeight: DesignConfig.light,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SwitchTile(
              title: 'Data Saving Mode',
              value: isDataSaving,
              onChanged: (val) {
                setState(() => isDataSaving = val);
              },
            ),
            const Divider(height: 1),

            SwitchTile(
              title: 'Reminders',
              value: isReminderOn,
              onChanged: (val) {
                setState(() => isReminderOn = val);
              },
            ),
          ],
        ),
      ),
    );
  }
}

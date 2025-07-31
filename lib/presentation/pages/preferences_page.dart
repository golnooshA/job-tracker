import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/core/config/design_dark_config.dart';
import 'package:job_tracker/core/config/design_light_config.dart';
import 'package:job_tracker/presentation/widgets/app_bar_builder.dart';
import 'package:job_tracker/presentation/widgets/bottom_navigation.dart';
import 'package:job_tracker/presentation/widgets/switch_tile.dart';
import 'package:job_tracker/presentation/widgets/text_list_tile.dart';

class PreferencesPage extends ConsumerStatefulWidget {
  const PreferencesPage({super.key});

  @override
  ConsumerState<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends ConsumerState<PreferencesPage> {
  bool isDataSaving = true;
  bool isReminderOn = true;

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Scaffold(
      appBar: AppBarBuilder(title: 'Preferences'),
      backgroundColor: design.backgroundColor,
      bottomNavigationBar: const BottomNavigation(currentIndex: 4),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _sectionTitle('Theme'),
            const SizedBox(height: 4),

            TextListTile(
              title: 'Mode',
              value: design is DesignDarkConfig ? 'Dark' : 'Light',
              onTap: () async {
                final isCurrentlyDark = design is DesignDarkConfig;
                final newConfig = isCurrentlyDark
                    ? const DesignLightConfig()
                    : const DesignDarkConfig();

                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isDarkMode', !isCurrentlyDark);

                DesignConfig.setDesignConfig(newConfig);
                setState(() {});
              },
            ),

            const Divider(
              height: 8,
              thickness: 1,
              color: Colors.black26,
            ),
            const SizedBox(height: 20),

            _sectionTitle('App Settings'),
            const SizedBox(height: 4),

            SwitchTile(
              title: 'Data Saving Mode',
              value: isDataSaving,
              onChanged: (val) => setState(() => isDataSaving = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    final design = DesignConfig.current;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: design.subTextFontSize,
          color: design.subTextColor,
          fontFamily: design.fontFamily,
          fontWeight: design.light,
        ),
      ),
    );
  }
}

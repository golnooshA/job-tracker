import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_tracker/core/config/design_config.dart';
import 'package:job_tracker/core/config/design_dark_config.dart';
import 'package:job_tracker/core/config/design_light_config.dart';
import 'package:job_tracker/presentation/pages/home_page.dart';
import 'package:job_tracker/presentation/providers/theme_mode_provider.dart';
import 'package:job_tracker/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _loadDesignConfig();
  }

  void _loadDesignConfig() {
    final themeMode = ref.read(themeModeProvider);
    if (themeMode == ThemeMode.dark) {
      DesignConfig.setDesignConfig(const DesignDarkConfig());
    } else {
      DesignConfig.setDesignConfig(const DesignLightConfig());
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    if (themeMode == ThemeMode.dark) {
      DesignConfig.setDesignConfig(const DesignDarkConfig());
    } else {
      DesignConfig.setDesignConfig(const DesignLightConfig());
    }

    return MaterialApp(
      title: 'Job Tracker',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      home: const HomePage(),
    );
  }
}

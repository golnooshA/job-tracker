import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder(title: 'About'),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 12),
                Text(
                  'Joboard',
                  style: TextStyle(
                    fontSize: DesignConfig.titleSize,
                    fontWeight: DesignConfig.semiBold,
                    color: DesignConfig.primaryColor,
                    fontFamily: DesignConfig.fontFamily,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'V 1.2.01.21',
                  style: TextStyle(
                    fontSize: DesignConfig.tinyTextSize,
                    fontWeight: FontWeight.bold,
                    color: DesignConfig.textColor,
                    fontFamily: DesignConfig.fontFamily,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Get job recommendation, search and save job\n'
                      'opportunity in your gadget with this apps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: DesignConfig.textSize,
                    color: DesignConfig.subTextColor,
                    fontFamily: DesignConfig.fontFamily,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

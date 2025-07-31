import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import '../widgets/app_bar_builder.dart';
import '../widgets/bottom_navigation.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Scaffold(
      appBar: AppBarBuilder(title: 'About'),
      backgroundColor: design.backgroundColor,
      bottomNavigationBar: const BottomNavigation(currentIndex: 4),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 80,
                  height: 80,
                ),

                const SizedBox(height: 12),

                Text(
                  'Joboard',
                  style: TextStyle(
                    fontSize: design.titleFontSize,
                    fontWeight: design.semiBold,
                    color: design.titleColor,
                    fontFamily: design.fontFamily,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'V 1.2.01.21',
                  style: TextStyle(
                    fontSize: design.tinyFontSize,
                    fontWeight: design.semiBold,
                    color: design.textColor,
                    fontFamily: design.fontFamily,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Get job recommendation, search and save job\n'
                      'opportunity in your gadget with this apps',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: design.light,
                    fontSize: design.textFontSize,
                    color: design.darkGrayColor,
                    fontFamily: design.fontFamily,
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

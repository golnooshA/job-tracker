import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: design.textFontSize,
          fontWeight: design.semiBold,
          fontFamily: design.fontFamily,
          color: design.textColor,
        ),
      ),
    );
  }
}

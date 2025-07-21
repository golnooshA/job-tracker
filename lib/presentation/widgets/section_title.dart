import 'package:flutter/material.dart';

import '../../core/config/design_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: DesignConfig.semiBold,
          fontFamily: DesignConfig.fontFamily,
          color: DesignConfig.textColor,
          fontSize: DesignConfig.textSize,
        ),
      ),
    );
  }
}

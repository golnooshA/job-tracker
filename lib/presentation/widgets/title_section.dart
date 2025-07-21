import 'package:flutter/material.dart';

import '../../core/config/design_config.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleSection({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: DesignConfig.fontFamily,
            fontSize: DesignConfig.headerSize,
            fontWeight: DesignConfig.semiBold,
            color: DesignConfig.textColor,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: const Text("View All", style: TextStyle(
              color: DesignConfig.primaryColor,
            fontFamily: DesignConfig.fontFamily,
            fontSize: DesignConfig.subTextSize,
            fontWeight: DesignConfig.light
          )),
        ),
      ],
    );
  }
}

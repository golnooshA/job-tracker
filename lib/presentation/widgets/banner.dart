import 'package:flutter/material.dart';

import '../../core/config/design_config.dart';

class BannerCard extends StatelessWidget {
  final String image;

  const BannerCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      width: 280,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: DesignConfig.border,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}

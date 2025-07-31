import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class BannerCard extends StatelessWidget {
  final String image;

  const BannerCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      width: 280,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: design.cartBorderRadius,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
          colorFilter: Theme.of(context).brightness == Brightness.dark
              ? ColorFilter.mode(
              Colors.black.withOpacity(0.1), BlendMode.srcOver)
              : null,
        ),
      ),
    );
  }
}

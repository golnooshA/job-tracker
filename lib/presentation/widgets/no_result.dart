import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class NoResult extends StatelessWidget {
  final String image;
  final String text;

  const NoResult({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: design.textFontSize,
              fontWeight: design.semiBold,
              color: design.darkGrayColor,
              fontFamily: design.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

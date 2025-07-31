import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitleSection({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: design.fontFamily,
              fontSize: design.mediumFontSize,
              fontWeight: design.semiBold,
              color: design.textColor,
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                "View All",
                style: TextStyle(
                  color: design.primaryColor,
                  fontFamily: design.fontFamily,
                  fontSize: design.subTextFontSize,
                  fontWeight: design.light,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ",
                style: TextStyle(
                  fontWeight: design.semiBold,
                  fontFamily: design.fontFamily,
                  color: design.subTextColor,
                  fontSize: design.mediumFontSize,
                  height: 1.4,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontWeight: design.light,
                    fontFamily: design.fontFamily,
                    color: design.subTextColor,
                    fontSize: design.subTextFontSize,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

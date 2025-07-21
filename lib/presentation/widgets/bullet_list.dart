import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "•  ",
                    style: TextStyle(
                      fontWeight: DesignConfig.semiBold,
                      fontFamily: DesignConfig.fontFamily,
                      color: DesignConfig.lightTextColor,
                      fontSize: DesignConfig.headerSize,
                      height: 1.4,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontWeight: DesignConfig.light,
                        fontFamily: DesignConfig.fontFamily,
                        color: DesignConfig.subTextColor,
                        fontSize: DesignConfig.subTextSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

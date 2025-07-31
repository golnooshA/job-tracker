import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;
    final textColor = Theme.of(context).textTheme.bodyMedium?.color ?? design.textColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          // size: design.iconSize,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: design.textFontSize,
            fontWeight: design.light,
            color: design.textColor,
            fontFamily: design.fontFamily,
          ),
        ),
      ],
    );
  }
}

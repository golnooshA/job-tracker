import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor),
      horizontalTitleGap: 12,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: design.semiBold,
          fontSize: design.textFontSize,
          fontFamily: design.fontFamily,
          color: titleColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: design.light,
          fontSize: design.textFontSize,
          fontFamily: design.fontFamily,
          color: design.subTextColor,
        ),
      ),
    );
  }
}

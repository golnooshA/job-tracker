import 'package:flutter/material.dart';

import '../../core/config/design_config.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color titleColor;

  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = DesignConfig.unSelectedIcon,
    this.titleColor = DesignConfig.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: DesignConfig.semiBold,
          fontFamily: DesignConfig.fontFamily,
          color: titleColor,
          fontSize: DesignConfig.textSize
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontFamily: DesignConfig.fontFamily,
          fontSize: DesignConfig.subTextSize,
          color: DesignConfig.subTextColor,
          fontWeight: DesignConfig.light,

        ),
      ),
      horizontalTitleGap: 12,
    );
  }
}

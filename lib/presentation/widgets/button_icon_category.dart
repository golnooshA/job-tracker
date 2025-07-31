import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class ButtonIconCategory extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ButtonIconCategory({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: design.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: design.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: design.tinyFontSize,
              fontWeight: design.semiBold,
              fontFamily: design.fontFamily,
              color: design.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

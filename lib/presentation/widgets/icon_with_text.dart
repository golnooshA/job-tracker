import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconWithText({super.key, required this.icon, required this.text, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

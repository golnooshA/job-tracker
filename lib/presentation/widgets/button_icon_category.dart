import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(child: Icon(icon)),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

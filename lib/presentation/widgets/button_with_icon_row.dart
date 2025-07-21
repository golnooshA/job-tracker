import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import 'button_text.dart';

class ButtonWithIconRow extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onIcon;
  final bool isBookmarked;
  final String buttonText;

  const ButtonWithIconRow({
    super.key,
    this.isBookmarked = false,
    required this.onTap,
    required this.onIcon,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonText(
            title: buttonText,
            backgroundColor: DesignConfig.primaryColor,
            onTap: onTap,
          ),
        ),

        const SizedBox(width: 12),

        Container(
          decoration: BoxDecoration(
            color: DesignConfig.backgroundColor,
            borderRadius: DesignConfig.border,
            border: Border.all(color: DesignConfig.lightTextColor),
          ),
          child: IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.deepOrange : Colors.grey.shade800,
            ),
            onPressed: onIcon,
          ),
        ),
      ],
    );
  }
}

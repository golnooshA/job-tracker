import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';
import 'button_text.dart';

class ButtonWithIconRow extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback onIcon;
  final bool isBookmarked;
  final String buttonText;
  final Color? buttonColor;
  final IconData bookmarkIcon;

  const ButtonWithIconRow({
    super.key,
    required this.onTap,
    required this.onIcon,
    required this.buttonText,
    required this.bookmarkIcon,
    this.isBookmarked = false,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;


    return Row(
      children: [
        Expanded(
          child: ButtonText(
            title: buttonText,
            backgroundColor: buttonColor ?? design.buttonGreenColor,
            onTap: onTap,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            color: design.backgroundColor,
            borderRadius: design.buttonBorderRadius,
            border: Border.all(color: design.borderColor),
          ),
          child: IconButton(
            icon: Icon(bookmarkIcon, color: design.primaryColor),
            onPressed: onIcon,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const ButtonText({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;
    final bgColor = backgroundColor ?? design.primaryColor;
    final fgColor = textColor ?? design.buttonTextColor;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: design.buttonBorderRadius,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: design.textFontSize,
            fontWeight: design.semiBold,
            fontFamily: design.fontFamily,
            color: design.buttonTextColor
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class OutlineButtonText extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? borderColor;
  final Color? textColor;

  const OutlineButtonText({
    super.key,
    required this.title,
    this.onTap,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: design.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: design.buttonBorderRadius),
        foregroundColor: design.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(
          fontSize: design.subTextFontSize,
          fontWeight: design.semiBold,
          fontFamily: design.fontFamily,
        ),
      ),
      child: Text(title),
    );
  }
}

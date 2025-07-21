import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class OutlineButtonText extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color borderColor;
  final Color textColor;

  const OutlineButtonText({
    super.key,
    required this.title,
    this.onTap,
    this.borderColor = DesignConfig.primaryColor,
    this.textColor = DesignConfig.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: DesignConfig.border,
        ),
        textStyle: const TextStyle(
            fontWeight: DesignConfig.semiBold,
            fontFamily: DesignConfig.fontFamily,
            fontSize: DesignConfig.subTextSize
        ),
      ),
      child: Text(title),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const ButtonText({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor = DesignConfig.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: DesignConfig.border,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: DesignConfig.buttonTextColor,
            fontSize: DesignConfig.textSize,
            fontWeight: DesignConfig.semiBold,
            fontFamily: DesignConfig.fontFamily,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/config/design_config.dart';

class ImageTextButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onTap;

  const ImageTextButton({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: DesignConfig.backgroundColor,
          borderRadius: DesignConfig.border,
          border: Border.all(color: DesignConfig.lightTextColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 16, backgroundImage: AssetImage(image)),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: DesignConfig.textColor,
                fontSize: DesignConfig.textSize,
                fontWeight: DesignConfig.light,
                fontFamily: DesignConfig.fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

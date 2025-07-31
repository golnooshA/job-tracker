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
    final design = DesignConfig.current;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: design.backgroundColor,
          borderRadius: design.buttonBorderRadius,
          border: Border.all(color: design.borderColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(image),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: design.textFontSize,
                fontWeight: design.light,
                fontFamily: design.fontFamily,
                color: design.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

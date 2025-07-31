import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class TextListTile extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const TextListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        title,
        style: TextStyle(
          fontSize: design.subTextFontSize,
          fontWeight: design.semiBold,
          fontFamily: design.fontFamily,
          color: design.textColor,
        ),
      ),
      trailing: Text(
        value,
        style: TextStyle(
          fontSize: design.textFontSize,
          fontWeight: design.light,
          fontFamily: design.fontFamily,
          color: design.textColor,
        ),
      ),
      onTap: onTap,
    );
  }
}

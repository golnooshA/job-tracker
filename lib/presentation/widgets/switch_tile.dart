import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: design.subTextFontSize,
          fontWeight: design.semiBold,
          fontFamily: design.fontFamily,
          color: design.textColor,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: design.primaryColor,
      activeTrackColor: design.primaryColor.withOpacity(0.4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

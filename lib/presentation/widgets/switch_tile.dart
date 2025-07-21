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
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: DesignConfig.semiBold,
          fontSize: DesignConfig.subTextSize,
          fontFamily: DesignConfig.fontFamily,
          color: DesignConfig.textColor,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: DesignConfig.primaryColor,
      activeTrackColor: DesignConfig.primaryColor.withOpacity(0.4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}

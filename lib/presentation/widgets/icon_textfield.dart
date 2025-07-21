import 'package:flutter/material.dart';
import 'package:job_tracker/core/config/design_config.dart';

class IconTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const IconTextField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: DesignConfig.subTextColor),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: DesignConfig.fontFamily,
          fontSize: DesignConfig.textSize,
          color: DesignConfig.subTextColor,
          fontWeight: DesignConfig.light,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DesignConfig.subTextColor, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DesignConfig.subTextColor),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

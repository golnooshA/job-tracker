import 'package:flutter/material.dart';
import 'package:job_tracker/core/config/design_config.dart';

class IconTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const IconTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.controller,
    this.onChanged,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: design.primaryColor, // رنگ خط چشمک‌زن
          selectionColor: design.primaryColor.withOpacity(0.4), // رنگ پس‌زمینه انتخاب‌شده
          selectionHandleColor: design.primaryColor, // رنگ دسته انتخاب متن
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: design.textFontSize,
          fontWeight: design.light,
          fontFamily: design.fontFamily,
          color: design.textColor,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          prefixIcon: Icon(icon, color: design.darkGrayColor),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: design.textFontSize,
            fontWeight: design.light,
            fontFamily: design.fontFamily,
            color: design.textFieldColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: design.textFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: design.primaryColor, width: 1.5),
          ),
        ),
      ),
    );
  }

}

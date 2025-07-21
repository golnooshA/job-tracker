import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class TextListTile extends StatelessWidget{

  final String title;
  final String value;
  final VoidCallback onTap;

  const TextListTile({super.key, required this.title, required this.value, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: DesignConfig.semiBold,
          fontSize: DesignConfig.subTextSize,
          fontFamily: DesignConfig.fontFamily,
          color: DesignConfig.textColor,
        ),
      ),
      trailing: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: DesignConfig.textSize,
          fontFamily: DesignConfig.fontFamily,
          color: DesignConfig.subTextColor,
        ),
      ),
      onTap: onTap,
    );
  }


}
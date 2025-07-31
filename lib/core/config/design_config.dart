import 'package:flutter/material.dart';

abstract class DesignConfig {
  const DesignConfig();

  static DesignConfig? _current;

  static DesignConfig get current {
    if (_current == null) {
      throw Exception('DesignConfig is not set. Call setDesignConfig() first.');
    }
    return _current!;
  }

  static void setDesignConfig(DesignConfig designConfig) {
    _current = designConfig;
  }

  // Colors
  Color get primaryColor;

  Color get backgroundColor;

  Color get buttonTextColor;

  Color get buttonBlueColor;

  Color get buttonRedColor;

  Color get buttonGreenColor;

  Color get buttonLightGrayColor;

  Color get buttonDarkGrayColor;

  Color get textFieldColor;

  Color get borderColor;

  Color get textColor;

  Color get subTextColor;

  Color get darkGrayColor;

  Color get lightGrayColor;

  Color get titleColor;

  Color get progressColor;

  Color get levelColor;

  Color get falseColor;

  Color get trueColor;

  Color get secondaryAppBarColor;

  Color get splashColor;

  Color get highlightColor;

  Color get appBarOptionsColor;

  Color get primaryBackgroundColor;

  Color get appColor;

  Color get appBarColor;

  Color get lineColor;

  Color get orangeColor;

  Color get errorColor;

  Color get menuTextColor;

  Color get pinkColor;

  Color get dialogColor;

  // Font Sizes
  final double tinyFontSize = 12;
  final double buttonFontSize = 16;
  final double textFontSize = 16;
  final double subtitleFontSize = 24;
  final double subTextFontSize = 14;
  final double titleFontSize = 28;
  final double mediumFontSize = 18;
  final double bigFontSize = 28;
  final double bigNumber = 40;
  final double veryBigFontSize = 80;
  final double appBarTextFontSize = 24;

  // Font Family
  final String fontFamily = 'Roboto';

  // Font Weight
  final FontWeight light = FontWeight.w400;
  final FontWeight semiBold = FontWeight.w600;

  // Border Radius
  final BorderRadius cartBorderRadius = const BorderRadius.all(
    Radius.circular(10),
  );
  final BorderRadius buttonBorderRadius = const BorderRadius.all(
    Radius.circular(10),
  );
  final BorderRadius circleButtonBorderRadius = const BorderRadius.all(
    Radius.circular(500),
  );
}

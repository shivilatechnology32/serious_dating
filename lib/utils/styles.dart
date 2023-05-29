import 'package:flutter/material.dart';

class Styles {
  static Heading2({
    bool? fontbold = false,
    Color? textColor,
  }) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return TextStyle(
      fontSize: 24,
      color: textColor,
      fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Heading3({
    bool? fontbold = false,
    Color? textColor,
  }) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return TextStyle(
      fontSize: 18,
      color: textColor,
      fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Heading4({
    bool? fontbold = false,
    Color? textColor,
  }) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return TextStyle(
      fontSize: 14,
      color: textColor,
      fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Heading5({
    bool? fontbold = false,
    Color? textColor,
  }) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return TextStyle(
      fontSize: 12,
      color: textColor,
      fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
    );
  }
}

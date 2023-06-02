import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Heading2({FontWeight? fontWeight, Color? textColor, String? font}) {
    textColor ?? Colors.black;
    return font == 'nunito'
        ? GoogleFonts.nunito(
            fontSize: 24,
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w400,
          )
        : font == 'sans'
            ? GoogleFonts.openSans(
                fontSize: 24,
                color: textColor,
                fontWeight: fontWeight ?? FontWeight.w400,
              )
            : TextStyle(
                fontSize: 24,
                color: textColor,
                fontWeight: fontWeight ?? FontWeight.w400,
              );
  }

  static Heading3(
      {bool? fontbold = false,
      Color? textColor,
      String? font,
      FontWeight? fontWeight}) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return font == 'nunito'
        ? GoogleFonts.nunito(
            fontSize: 18,
            color: textColor,
            fontWeight:
                fontbold! ? FontWeight.bold : (fontWeight ?? FontWeight.normal),
          )
        : font == 'sans'
            ? GoogleFonts.openSans(
                fontSize: 18,
                color: textColor,
                fontWeight: fontbold!
                    ? FontWeight.bold
                    : (fontWeight ?? FontWeight.normal),
              )
            : TextStyle(
                fontSize: 18,
                color: textColor,
                fontWeight: fontbold!
                    ? FontWeight.bold
                    : (fontWeight ?? FontWeight.normal),
              );
  }

  static Heading4({bool? fontbold = false, Color? textColor, String? font}) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return TextStyle(
      fontSize: 14,
      color: textColor,
      fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
    );
  }

  static Heading5({bool? fontbold = false, Color? textColor, String? font}) {
    fontbold ?? true;
    textColor ?? Colors.black;
    return font == 'nunito'
        ? GoogleFonts.nunito(
            fontSize: 12,
            color: textColor,
            fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
          )
        : font == 'sans'
            ? GoogleFonts.openSans(
                fontSize: 12,
                color: textColor,
                fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
              )
            : TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: fontbold! ? FontWeight.bold : FontWeight.normal,
              );
  }
}

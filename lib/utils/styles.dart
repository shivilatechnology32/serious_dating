import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {

  static TextStyle h1() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  }

  static friendsBox() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)));
  }
  static messagesCardStyle(check) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: check ? Colors.indigo.shade300: Colors.grey.shade300,
    );
  }

  static messageFieldCardStyle() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.indigo),
        borderRadius: BorderRadius.circular(10));
  }

  static messageTextFieldStyle({required Function() onSubmit}) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Message',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: onSubmit, icon: const Icon(Icons.send)),
    );
  }
  static searchTextFieldStyle() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: 'Enter Name',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
    );
  }
  static searchField({Function(String)? onChange}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChange,
        decoration: Styles.searchTextFieldStyle(),
      ),
      decoration: Styles.messageFieldCardStyle(),
    );
  }
  //// ------ END for chat --------- ////

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

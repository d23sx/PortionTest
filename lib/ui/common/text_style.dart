import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  FontStyles._();
  static Color textColor1 = const Color(0xFF056780);
  static Color textColor2 = const Color(0xFFFEEDCB);
  static Color textColor3 = const Color(0xFF000000);

  static TextStyle header1 = TextStyle(
      fontSize: 40,
      color: textColor1,
      letterSpacing: 1,
      fontFamily: 'Roboto-Bold');
  static TextStyle header2 = TextStyle(
      fontSize: 28,
      color: textColor1,
      letterSpacing: 1,
      fontFamily: 'Roboto-Bold');
  static TextStyle header3 = TextStyle(
      fontSize: 25,
      color: textColor3,
      letterSpacing: 1,
      fontFamily: 'Roboto-Regular');
  static TextStyle title1 = TextStyle(
      fontSize: 19,
      color: textColor1,
      letterSpacing: 1,
      fontFamily: 'Roboto-Regular');
  static TextStyle title2 = TextStyle(
      fontSize: 16,
      color: textColor3,
      letterSpacing: 1,
      fontFamily: 'Roboto-Regular');

  static TextStyle body = TextStyle(
      fontSize: 13,
      color: textColor3,
      letterSpacing: 1,
      fontFamily: 'Roboto-Regular');

  static TextStyle caption = TextStyle(
      fontSize: 11,
      color: textColor3,
      letterSpacing: 1,
      fontFamily: 'Roboto-Light');
}

import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle poppinsRegular({
    double fontSize = 14.0,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.left,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle poppinsMedium({
    double fontSize = 14.0,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.left,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle poppinsSemiBold({
    double fontSize = 14.0,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.left,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle poppinsBold({
    double fontSize = 14.0,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.left,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700
    );
  }

  static TextStyle poppinsLight({
    double fontSize = 14.0,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.left,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w300
    );
  }
}
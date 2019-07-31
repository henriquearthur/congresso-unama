import 'package:flutter/material.dart';

abstract class Styles {
  // Fonts
  static String primaryFontFamily = "Montserrat";
  static String secondaryFontFamily = "Roboto";

  // Colors
  static Color primaryColor = Colors.green;
  static Color primaryColorDark = Colors.green[900];

  static Color mainScreenColor = Colors.cyan;
  static Color scheduleScreenColor = Colors.green;
  static Color undergradsScreenColor = Colors.orange;
  static Color locationScreenColor = Colors.red;

  static Color architectureColor = Color(0xff417952);
  static Color computingColor = Color(0xffF2A94B);
  static Color engineeringColor = Color(0xff2B80C0);

  // Text styles
  static TextStyle appBarTitleText = TextStyle(
    color: Colors.green,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w500,
  );
}

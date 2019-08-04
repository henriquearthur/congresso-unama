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

  static Color appBarBackgroundColor = Colors.white;
  static Color appBarIconColor = Colors.green;
  static Color appBarLabelColor = Colors.black;

  static Color appBarPageBackgroundColor = Colors.transparent;
  static Color appBarPageIconColor = Colors.grey[600];

  static Color bottomSheetTitleColor = Colors.grey[600];

  // Text styles
  static TextStyle appBarTitleText = TextStyle(
    color: Colors.green,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appBarPageTitleText = TextStyle(
    color: Colors.grey[600],
    letterSpacing: -0.5,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bottomSheetTitleText = TextStyle(
    color: bottomSheetTitleColor,
    fontSize: 22.0,
    letterSpacing: -1.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bottomSheetDescriptionText = TextStyle(
    color: bottomSheetTitleColor,
    fontSize: 16.0,
    letterSpacing: -1.0,
    fontWeight: FontWeight.w500,
  );
}

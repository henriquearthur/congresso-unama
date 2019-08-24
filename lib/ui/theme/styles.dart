import 'package:flutter/material.dart';

abstract class Styles {
  // Fonts
  static String primaryFontFamily = "Montserrat";
  static String secondaryFontFamily = "Roboto";

  // Colors
  static Color primaryColor = Colors.green;
  static Color primaryColorDark = Colors.green[900];

  static Color architectureColor = Color(0xff417952);
  static Color computingColor = Color(0xffF2A94B);
  static Color engineeringColor = Color(0xff2B80C0);

  static Color appBarBackgroundColor = Colors.white;
  static Color appBarIconColor = Colors.white;
  static Color appBarLabelColor = Colors.white;

  static Color appBarPageBackgroundColor = Colors.transparent;
  static Color appBarPageIconColor = Colors.white;

  static Color bottomNavigationBarIconColor = Colors.grey[700];

  static Color bottomSheetTitleColor = Colors.grey[600];

  static Color dialogTitleColor = Colors.grey[600];

  // Text styles
  static TextStyle appBarTitleText = TextStyle(
    color: Colors.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appBarPageTitleText = TextStyle(
    color: Colors.white,
    letterSpacing: -1.0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bottomNavigationBarTitleText = TextStyle(
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

  static TextStyle dialogContentText = TextStyle(
    fontFamily: Styles.primaryFontFamily,
    fontSize: 14.0,
    color: Colors.grey[700],
  );
}

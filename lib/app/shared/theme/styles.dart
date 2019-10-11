import 'package:flutter/material.dart';

abstract class Styles {
  // Fonts
  static String primaryFontFamily = "Montserrat";
  static String secondaryFontFamily = "Roboto";

  static FontWeight primaryFontRegularWeight = FontWeight.normal;
  static FontWeight primaryFontMediumWeight = FontWeight.w500;
  static FontWeight primaryFontSemiboldWeight = FontWeight.w600;
  static FontWeight primaryFontBoldWeight = FontWeight.w700;

  // Colors
  static Color primaryColor = Colors.green;
  static Color primaryColorDark = Colors.green[900];

  static Color textColor = Colors.grey[800];

  static Color bottomNavigationBarIconColor = Colors.grey[700];
  static Color bottomSheetTitleColor = Colors.grey[700];
  static Color dialogTitleColor = Colors.grey[600];

  // Text styles
  static TextStyle appBarTitleText = TextStyle(
    color: Colors.white,
    letterSpacing: -0.5,
    fontWeight: primaryFontMediumWeight,
  );

  static TextStyle appBarPageTitleText = TextStyle(
    color: Colors.white,
    letterSpacing: -1.0,
    fontWeight: primaryFontMediumWeight,
  );

  static TextStyle bottomNavigationBarTitleText = TextStyle(
    letterSpacing: -0.5,
    fontWeight: primaryFontMediumWeight,
  );

  static TextStyle bottomSheetTitleText = TextStyle(
    color: bottomSheetTitleColor,
    fontSize: 22.0,
    letterSpacing: -1.0,
    fontWeight: primaryFontSemiboldWeight,
  );

  static TextStyle bottomSheetDescriptionText = TextStyle(
    color: bottomSheetTitleColor,
    fontSize: 16.0,
    letterSpacing: -1.0,
    fontWeight: primaryFontMediumWeight,
  );

  static TextStyle dialogContentText = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14.0,
    color: Colors.grey[700],
  );

  static TextStyle mainScreenTitleText = TextStyle(
    color: primaryColorDark,
    fontSize: 22.0,
    fontWeight: primaryFontMediumWeight,
    letterSpacing: -1.0,
  );

  static TextStyle mainScreenDescriptionText = TextStyle(
    color: primaryColorDark,
    fontSize: 16.0,
  );
}

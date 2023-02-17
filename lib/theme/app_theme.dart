import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF005BCA);
  static const String logoIcon = 'assets/xtream.png';
  static const List<Color> linearGradient = [
    Color.fromRGBO(32, 125, 240, 1),
    Color.fromRGBO(68, 145, 241, 1),
    Color.fromRGBO(104, 164, 238, 1),
  ];

  // klap style
  // static const Color primaryColor = Color(0xFF26d07c);
  // static const String logoIcon = 'assets/logo-klap.png';
  // static const List<Color> linearGradient = [
  //   Color.fromRGBO(38, 208, 124, 1),
  //   Color.fromRGBO(0, 194, 135, 1),
  //   Color.fromRGBO(0, 179, 143, 1),
  // ];

  static const Color secondaryColor = Color(0xFF0E2C4B);
  static const double radius = 15;

  static ThemeData lightTheme = ThemeData.light().copyWith(
      // AppBar
      appBarTheme: const AppBarTheme(color: primaryColor, elevation: 0),

      // Inputs
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
      ));
      // AppBar
}

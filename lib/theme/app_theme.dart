import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF26d07c);
  static const Color secondaryColor = Color(0xFF0E2C4B);

  static const double radius = 15;

  static ThemeData lightTheme = ThemeData.light().copyWith(
    // Inputs
    inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: primaryColor),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(radius))),
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
  ));
}
import "package:flutter/material.dart";

class TTextTheme {
  TTextTheme._();

  static TextTheme myTextTheme = const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Poppins'),
    headlineMedium: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black,
        fontFamily: 'Poppins'),
    headlineSmall: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black,
        fontFamily: 'Poppins'),
    titleLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black,
        fontFamily: 'Poppins'),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black,
        fontFamily: 'Poppins'),
    titleSmall: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black,
        fontFamily: 'Poppins'),
    bodyLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black,
        fontFamily: 'Poppins'),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black,
        fontFamily: 'Poppins'),
    labelLarge: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black,
        fontFamily: 'Poppins'),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
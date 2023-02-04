import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightGray = Color(0xFFDFE0DF);
  static const Color darkGray = Color(0xFFACACAC);
  static const Color darkprimary = Color(0xFF000000);
  static const Color redSystem = Color(0xFFEF5350);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightGray,
    fontFamily: 'Cairo',
    //fontFamily: 'Balsamiq_Sans',
    appBarTheme: const AppBarTheme(
      backgroundColor: lightGray,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 22,
        color: Color(0xFF000000),
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFFACACAC),
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: darkprimary,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

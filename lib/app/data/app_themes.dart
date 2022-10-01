import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData mainTheme = ThemeData(
      primarySwatch: Colors.lightGreen,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Color(0xFF8BC34A)),
          titleTextStyle: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}

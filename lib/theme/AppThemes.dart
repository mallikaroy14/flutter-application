import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
      primaryColor: Colors.deepOrange,
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
          error: Colors.red,
          brightness: Brightness.light,
          primary: Colors.deepOrange,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black));

  static final dark = ThemeData(
      primaryColor: Colors.deepOrangeAccent, brightness: Brightness.dark,
      colorScheme: const ColorScheme(
          error: Colors.red,
          brightness: Brightness.dark,
          primary: Colors.deepOrange,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.white,
          onError: Colors.black,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white)
  );
}

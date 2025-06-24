import 'package:flutter/material.dart';

final ThemeData customDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    elevation: 0.5,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardColor: const Color(0xFF2C2C2C),
  iconTheme: IconThemeData(color: Colors.grey[400]),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
);

final ThemeData customLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF5F5F5),
    elevation: 0.5,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardColor: const Color(0xFFE0E0E0),
  iconTheme: const IconThemeData(color: Colors.black54),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black87),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
);

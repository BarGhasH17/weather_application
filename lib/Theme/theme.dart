import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.lightBlue.shade700,
    primary: Colors.lightBlue.shade600,
    secondary: Colors.lightBlue.shade500,
    secondaryContainer: const Color.fromARGB(255, 51, 185, 247),
    onSurface: Colors.white,
    onBackground: Colors.white,
    onSecondary: Colors.white,
    primaryContainer: const Color.fromARGB(255, 3, 155, 229),
    tertiary: const Color.fromARGB(255, 179, 229, 252),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    primaryContainer: Colors.grey.shade900,
  ),
);

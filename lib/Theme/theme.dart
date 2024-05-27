import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.lightBlue.shade600,
    primary: Colors.lightBlue.shade500,
    secondary: Colors.lightBlue.shade400,
    secondaryContainer: const Color.fromARGB(255, 51, 185, 247),
    onSurface: Colors.white,
    onBackground: Colors.white,
    onSecondary: Colors.white,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);

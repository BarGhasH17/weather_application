import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Theme/theme.dart';
import 'package:weather_application/Theme/theme_provider.dart';
import 'package:weather_application/screens/loading_screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const WeatherApp(),
      ),
    );

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: const LoadingScreen(
        modeNumber: 2,
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

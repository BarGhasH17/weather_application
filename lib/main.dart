import 'package:flutter/material.dart';
import 'package:weather_application/screens/loading_screen.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
        home: LoadingScreen(
      modeNumber: 2,
    ));
  }
}

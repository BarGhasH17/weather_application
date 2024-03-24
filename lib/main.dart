import 'package:flutter/material.dart';
import 'package:weather_application/drawer.dart';
import 'app_bar.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: myAppBar(),
        drawer: myDrawer(),
      ),
    ),
  );
}

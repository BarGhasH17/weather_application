import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
          icon: const Icon(
            Icons.location_city,
            color: Colors.white,
            ),
            tooltip: "View cities",
            onPressed: () {},
          ),
        centerTitle: true,
        title: const Text(
          style: TextStyle(color: Colors.white,), 
          "Weather",
          ),
          actions: <Widget> [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert, 
                color: Colors.white,
                ),
              tooltip: "More",
            ),
          ],
      ),
    ),
  ),);
}


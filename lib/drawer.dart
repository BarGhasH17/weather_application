import 'package:flutter/material.dart';

Widget myDrawer() {
  return Drawer(
    backgroundColor: Colors.lightBlue[400],
    surfaceTintColor: Colors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "No cities",
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Choose a city"),
          ),
        ],
      ),
    ),
  );
}

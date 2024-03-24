import 'package:flutter/material.dart';

Widget myDrawer() {
  return Drawer(
    backgroundColor: Colors.blueGrey[200],
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("No cities"),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Choose a city"),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar() {
  return AppBar(
    backgroundColor: Colors.blueGrey[900],
    leading: Builder(
      builder: (context) => IconButton(
          icon: const Icon(
            Icons.location_city,
            color: Colors.white,
          ),
          tooltip: "View cities",
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }),
    ),
    centerTitle: true,
    title: const Text(
      style: TextStyle(
        color: Colors.white,
      ),
      "Weather",
    ),
    actions: [
      PopupMenuButton(
        iconColor: Colors.white,
        color: Colors.blueGrey[100],
        itemBuilder: (context) => const [
          PopupMenuItem(
            child: Text("setting"),
          ),
        ],
      )
    ],
  );
}

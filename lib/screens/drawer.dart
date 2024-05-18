import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
}

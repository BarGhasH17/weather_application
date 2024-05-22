import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 155, 229),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[500],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          style: TextStyle(
            color: Colors.white,
          ),
          "Weather",
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/Weather1.png'),
              height: 200,
            ),
            Text(
              'Version 0.0.1',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 179, 229, 252)),
            ),
            Text(
              '© 2024',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 179, 229, 252)),
            ),
          ],
        ),
      ),
    );
  }
}

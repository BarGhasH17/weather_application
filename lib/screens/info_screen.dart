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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          style: TextStyle(
            color: Colors.white,
          ),
          "Weather",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/icons/Weather.png'),
              height: 200,
            ),
            Text(
              'Version 0.0.1',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.tertiary),
            ),
            Text(
              '© 2024',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.tertiary),
            ),
          ],
        ),
      ),
    );
  }
}

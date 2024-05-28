import 'package:flutter/material.dart';
import 'package:weather_application/screens/loading_screen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController cityController = TextEditingController();
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Input field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'Enter a city name.',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'City Name...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            // Button
            ElevatedButton(
              onPressed: () {
                selectedCity = cityController.text;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoadingScreen(
                    modeNumber: 2,
                    isLocationMode: false,
                    city: selectedCity,
                  );
                }));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Theme.of(context).colorScheme.primary)),
              child: const Text(
                'Get location',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

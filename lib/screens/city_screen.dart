import 'package:flutter/material.dart';
import 'package:weather_application/screens/loading_screen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_application/services/city_names.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

dynamic goLoading(context, locationMode, {String? selectedCity}) {
  if (locationMode) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoadingScreen(
        modeNumber: 2,
        isLocationMode: locationMode,
      );
    }));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoadingScreen(
        modeNumber: 2,
        isLocationMode: false,
        city: selectedCity,
      );
    }));
  }
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController cityController = TextEditingController();
  String? selectedCity;
  CityNames cityNames1 = CityNames();

  @override
  Widget build(BuildContext context) {
    List<String> cityNames = cityNames1.cityNames;
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
            // Input field with auto-complete
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TypeAheadFormField(
                hideOnEmpty: true,
                textFieldConfiguration: TextFieldConfiguration(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  controller: cityController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      tooltip: 'Current location',
                      onPressed: () {
                        goLoading(context, true);
                      },
                      icon: const Icon(Icons.location_pin),
                    ),
                    labelText: 'Enter a city name.',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'City Name...',
                    hintStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                suggestionsCallback: (pattern) {
                  return cityNames.where(
                    (city) =>
                        city.toLowerCase().contains(pattern.toLowerCase()),
                  );
                },
                itemBuilder: (context, String suggestion) {
                  return ListTile(
                    title: Text(
                      suggestion,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  cityController.text = suggestion;
                  goLoading(context, false, selectedCity: suggestion);
                },
              ),
            ),
            // Button
            ElevatedButton(
              onPressed: () {
                selectedCity = cityController.text;
                goLoading(context, false, selectedCity: selectedCity);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text(
                'Choose city',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

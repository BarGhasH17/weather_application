import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_application/services/location.dart';

class LocationData {
  dynamic getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.latitude;
    double lon = location.longitude;
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m&daily=temperature_2m_max,temperature_2m_min';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }
}

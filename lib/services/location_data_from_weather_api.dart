import 'package:weather_application/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationData {
  dynamic getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    String appId = 'eb9c4f6f4e0f410a87592314242505';
    String url =
        'http://api.weatherapi.com/v1/forecast.json?key=$appId&q=$latitude,$longitude&days=4&aqi=no&alerts=no';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }
}

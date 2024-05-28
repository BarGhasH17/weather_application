import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocoding/geocoding.dart' as location;

class LocationData {
  dynamic getLocationData(lat, lon) async {
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m&daily=temperature_2m_max,temperature_2m_min';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  dynamic getLocationDataByCityName(cityName) async {
    List<location.Location> locations =
        await location.locationFromAddress(cityName);
    double lat = locations.first.latitude;
    double lon = locations.first.longitude;
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m&daily=temperature_2m_max,temperature_2m_min';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }
}

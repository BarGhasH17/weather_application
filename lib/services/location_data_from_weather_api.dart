import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationData {
  String appId = 'eb9c4f6f4e0f410a87592314242505';
  dynamic getLocationData(latitude, longitude) async {
    String url =
        'http://api.weatherapi.com/v1/forecast.json?key=$appId&q=$latitude,$longitude&days=7&aqi=no&alerts=no';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  dynamic getLocationDataByCityName(cityName) async {
    String url =
        'http://api.weatherapi.com/v1/forecast.json?key=$appId&q=$cityName&days=7&aqi=no&alerts=no';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }
}

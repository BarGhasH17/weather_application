import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_application/services/location.dart';

class LocationData {
  String? cityName;
  int? temperature, iconNumber;

  Future getCityIdGeoLocation(lat, lon, appId) async {
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$appId&q=$lat%2C$lon';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    cityName = jsonDecode(res.body)['EnglishName'];
    return jsonDecode(res.body)["Key"];
  }

  Future getCityIdCityName(city, appId) async {
    print(city);
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=$appId&q=$city';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    cityName = jsonDecode(res.body)[0]['EnglishName'];
    return jsonDecode(res.body)[0]['Key'];
  }

  Future getCurrentData(cityId, appId) async {
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$cityId?apikey=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future get3DaysData(cityId, appId) async {
    String url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$cityId?apikey=$appId&metric=true';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    String cityId = await getCityIdGeoLocation(latitude, longitude, appId);
    var currentData = await getCurrentData(cityId, appId);
    temperature = currentData[0]['Temperature']['Metric']['Value'].toInt();
    iconNumber = currentData[0]['WeatherIcon'];
    var data = await get3DaysData(cityId, appId);
    return [currentData, data, cityName];
  }

  Future getLocationDataByCityName(city) async {
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    var cityId = await getCityIdCityName(city, appId);
    var currentData = await getCurrentData(cityId, appId);
    temperature = currentData[0]['Temperature']['Metric']['Value'].toInt();
    iconNumber = currentData[0]['WeatherIcon'];
    var data = await get3DaysData(cityId, appId);
    return [currentData, data, cityName];
  }
}

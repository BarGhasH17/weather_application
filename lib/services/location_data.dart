import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_application/screens/home_screen.dart';
import 'package:weather_application/services/location.dart';

class LocationData {
  late String cityName;

  // Future getLocationDataFromOpenWeatherMap(lat, lon) async {
  //   double latitude = lat;
  //   double longitude = lon;
  //   String appId = '8d481789260fee5c79b2b1d513c85944';
  //   String url =
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appId&units=metric';
  //   Uri uri = Uri.parse(url);
  //   http.Response res = await http.get(uri);
  //   if (res.statusCode == 200) {
  //     return jsonDecode(res.body);
  //   } else {
  //     return res.statusCode.toString();
  //   }
  // }

  Future getCityId(lat, lon, appId) async {
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$appId&q=$lat%2C$lon';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    cityName = jsonDecode(res.body)['EnglishName'];
    return jsonDecode(res.body)["Key"];
  }

  Future getCurrentLocationData(lat, lon) async {
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    String cityId = await getCityId(lat, lon, appId);
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$cityId?apikey=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future get3DaysForecastData(lat, lon) async {
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    String cityId = await getCityId(lat, lon, appId);
    String url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$cityId?apikey=$appId&metric=true';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  void getLocationData(context) async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    // var dataFromOpenWeatherMap =
    //     await getLocationDataFromOpenWeatherMap(latitude, longitude);
    var currentDataFromAccWeather =
        await getCurrentLocationData(latitude, longitude);
    var dataFromAccWeather = await get3DaysForecastData(latitude, longitude);

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        currentLocationWeather: currentDataFromAccWeather,
        locationWeather: dataFromAccWeather,
        cityName: cityName,
      );
    }));
  }
}

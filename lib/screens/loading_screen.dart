import 'package:flutter/material.dart';
import 'package:weather_application/services/location.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationDataFromOpenWeatherMap(lat, lon) async {
    double latitude = lat;
    double longitude = lon;
    String appId = '8d481789260fee5c79b2b1d513c85944';
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      return res.statusCode.toString();
    }
  }

  Future getLocationDataFromAccWeather(lat, lon) async {
    double latitude = lat;
    double longitude = lon;
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    String urlFroCityId =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$appId&q=$latitude%2C$longitude';
    Uri uriForCityId = Uri.parse(urlFroCityId);
    http.Response resForCityId = await http.get(uriForCityId);
    String cityId = jsonDecode(resForCityId.body)["Key"];
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$cityId?apikey=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return res.body;
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    Future dataFromOpenWeatherMap =
        getLocationDataFromOpenWeatherMap(latitude, longitude);
    Future dataFromAccWeather =
        getLocationDataFromAccWeather(latitude, longitude);
    // print(await dataFromOpenWeatherMap);
    print(await dataFromAccWeather);

    // String appId = '8d481789260fee5c79b2b1d513c85944';
    // String url =
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appId';
    // Uri uri = Uri.parse(url);
    // http.Response res = await http.get(uri);
    // if (res.statusCode == 200) {
    //   String data = res.body;
    //   var weatherData = await jsonDecode(data);
    //   print(weatherData);
    // } else {
    //   print(res.statusCode);
    // }
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

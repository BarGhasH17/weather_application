import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_application/services/location.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String cityName;
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
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appId&units=metric';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return res.statusCode.toString();
    }
  }

  Future getCityId(lat, lon, appId) async {
    String urlFroCityId =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$appId&q=$lat%2C$lon';
    Uri uriForCityId = Uri.parse(urlFroCityId);
    http.Response resForCityId = await http.get(uriForCityId);
    cityName = jsonDecode(resForCityId.body)['EnglishName'];
    return jsonDecode(resForCityId.body)["Key"];
  }

  Future getCurrentLocationDataFromAccWeather(lat, lon) async {
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    String cityId = await getCityId(lat, lon, appId);
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$cityId?apikey=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future get3DaysForecastFromAccWeather(lat, lon) async {
    String appId = '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy';
    String cityId = await getCityId(lat, lon, appId);
    String url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$cityId?apikey=$appId&metric=true';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    var dataFromOpenWeatherMap =
        await getLocationDataFromOpenWeatherMap(latitude, longitude);
    var currentDataFromAccWeather =
        await getCurrentLocationDataFromAccWeather(latitude, longitude);
    var dataFromAccWeather =
        await get3DaysForecastFromAccWeather(latitude, longitude);
    // print(await dataFromOpenWeatherMap);

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
      return HomeScreen(
        currentLocationWeather: currentDataFromAccWeather,
        LocationWeather: dataFromAccWeather,
        cityName: cityName,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF039BE5),
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}

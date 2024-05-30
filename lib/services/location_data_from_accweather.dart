import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class LocationData {
  String? cityName;
  int? temperature, iconNumber;
  List<String> appIds = [
    '44Tcy7AhVjpQ8wxKoUAoGFzaG4mcyMyy',
    'TyExDodJNvGGOcnkgx2XJjadEqxKGseu',
    'jzhD3sZTvQRuFK1RwG6UKdmxjeUBymI1',
    'iCou3NxY8DGu48mH75chndFNGaa22QbT',
    'bGfh8vLrLl6b5GJYZWOPAdNLnsudtCx1',
    'uEB91XKHiyW5XLGhUeevAPpHALVgRxhf',
    'vrONuBytoGZOzPrSlmkWF1JnJtWTW2bi',
    'stP2MBDdw4Pi0FI3ehhg7UKjQXshc9u2',
    'ZYjpgNB1G4TCYhaqsVN22AMoGi6LNycB',
    '97oYwQLRJYd9NKODGWhrS3JuNsD3ObGq'
  ];
  Random random = Random();
  String? appId; // = 'jzhD3sZTvQRuFK1RwG6UKdmxjeUBymI1';

  void getAppId() {
    Random random = Random();
    appId = appIds[random.nextInt(10)];
  }

  Future getCityIdGeoLocation(lat, lon) async {
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$appId&q=$lat%2C$lon';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    cityName = jsonDecode(res.body)['EnglishName'];
    return jsonDecode(res.body)["Key"];
  }

  Future getCityIdCityName(city) async {
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=$appId&q=$city';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    cityName = jsonDecode(res.body)[0]['EnglishName'];
    return jsonDecode(res.body)[0]['Key'];
  }

  Future getCurrentData(cityId) async {
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$cityId?apikey=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future get3DaysData(cityId) async {
    String url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$cityId?apikey=$appId&metric=true';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future getLocationData(latitude, longitude) async {
    while (true) {
      getAppId();
      try {
        String cityId = await getCityIdGeoLocation(latitude, longitude);
        var currentData = await getCurrentData(cityId);
        var data = await get3DaysData(cityId);
        temperature = currentData[0]['Temperature']['Metric']['Value'].toInt();
        iconNumber = currentData[0]['WeatherIcon'];
        return [currentData, data, cityName];
        // ignore: empty_catches
      } catch (e) {}
    }
  }

  Future getLocationDataByCityName(city) async {
    while (true) {
      getAppId();
      try {
        var cityId = await getCityIdCityName(city);
        var currentData = await getCurrentData(cityId);
        var data = await get3DaysData(cityId);
        temperature = currentData[0]['Temperature']['Metric']['Value'].toInt();
        iconNumber = currentData[0]['WeatherIcon'];
        return [currentData, data, cityName];
        // ignore: empty_catches
      } catch (e) {}
    }
  }
}

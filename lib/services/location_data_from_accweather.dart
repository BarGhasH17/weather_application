import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_application/services/location.dart';

class LocationData {
  String? cityName;
  int? temperature, iconNumber;

  Future getCityId(lat, lon, appId) async {
    String url =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$appId&q=$lat%2C$lon';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    cityName = jsonDecode(res.body)['EnglishName'];
    return jsonDecode(res.body)["Key"];
  }

  Future getCurrentData(lat, lon) async {
    String appId = 'bGfh8vLrLl6b5GJYZWOPAdNLnsudtCx1';
    String cityId = await getCityId(lat, lon, appId);
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$cityId?apikey=$appId';
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    return jsonDecode(res.body);
  }

  Future get3DaysData(lat, lon) async {
    String appId = 'bGfh8vLrLl6b5GJYZWOPAdNLnsudtCx1';
    String cityId = await getCityId(lat, lon, appId);
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
    var currentData = await getCurrentData(latitude, longitude);
    temperature = currentData[0]['Temperature']['Metric']['Value'].toInt();
    iconNumber = currentData[0]['WeatherIcon'];
    var data = await get3DaysData(latitude, longitude);
    return [currentData, data, cityName];
    // ignore: use_build_context_synchronously
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return HomeScreen(
    //     currentLocationWeather: currentData,
    //     locationWeather: data,
    //     cityName: cityName,
    //   );
    // }));
  }
}

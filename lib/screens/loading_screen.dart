import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/screens/home_screen.dart';
import 'package:weather_application/services/location_data_from_accweather.dart'
    as accweather;
import 'package:weather_application/services/location_data_from_weather_api.dart'
    as weather_api;
import 'package:weather_application/services/location_data_from_open_meteo.dart'
    as open_meteo;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen(
      {super.key, this.modeNumber, this.isLocationMode = true, this.city});
  final dynamic modeNumber;
  final bool isLocationMode;
  final String? city;
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.isLocationMode) {
      getDataByGeoLocation();
    } else {
      getDataByCityName(widget.city);
    }
  }

  Future<void> getDataByGeoLocation() async {
    accweather.LocationData locationData1 = accweather.LocationData();
    weather_api.LocationData locationData2 = weather_api.LocationData();
    open_meteo.LocationData locationData3 = open_meteo.LocationData();
    int? modeNumber = widget.modeNumber;

    Future(() async {
      dynamic locationDataList = await locationData1.getLocationData();
      dynamic locationDataWeatherApi = await locationData2.getLocationData();
      dynamic locationDataOpenMeteo = await locationData3.getLocationData();

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return HomeScreen(
          currentLocationWeatherS1: locationDataList[0],
          locationWeatherS1: locationDataList[1],
          locationWeatherS2: locationDataWeatherApi,
          locationWeatherS3: locationDataOpenMeteo,
          iconData: locationDataList[1],
          cityName: locationDataList[2],
          modeNumber: modeNumber,
        );
      }), ModalRoute.withName("/home_screen"));
    });
  }

  Future<void> getDataByCityName(city) async {
    accweather.LocationData locationData1 = accweather.LocationData();
    weather_api.LocationData locationData2 = weather_api.LocationData();
    open_meteo.LocationData locationData3 = open_meteo.LocationData();
    int? modeNumber = widget.modeNumber;

    Future(() async {
      dynamic locationDataList =
          await locationData1.getLocationDataByCityName(city);
      dynamic locationDataWeatherApi =
          await locationData2.getLocationDataByCityName(city);
      dynamic locationDataOpenMeteo =
          await locationData3.getLocationDataByCityName(city);

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return HomeScreen(
          currentLocationWeatherS1: locationDataList[0],
          locationWeatherS1: locationDataList[1],
          locationWeatherS2: locationDataWeatherApi,
          locationWeatherS3: locationDataOpenMeteo,
          iconData: locationDataList[1],
          cityName: locationDataList[2],
          modeNumber: modeNumber,
        );
      }), ModalRoute.withName("/home_screen"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}

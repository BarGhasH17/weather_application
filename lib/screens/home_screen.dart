import 'package:flutter/material.dart';
import 'package:weather_application/services/final_data.dart';
import 'app_bar.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/services/icon_generator.dart';
import 'package:weather_application/services/accweather_icon_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {this.currentLocationWeatherS1,
      this.locationWeatherS1,
      this.locationWeatherS2,
      this.locationWeatherS3,
      this.iconData,
      this.cityName,
      this.modeNumber,
      this.widget,
      super.key});
  final dynamic currentLocationWeatherS1;
  final dynamic locationWeatherS1;
  final dynamic locationWeatherS2;
  final dynamic locationWeatherS3;
  final dynamic iconData;
  final dynamic cityName;
  final dynamic modeNumber;
  final dynamic widget;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var date = DateTime.now();
  int? temperature;
  late int iconNumber;
  late String cityName;
  late int modeNumber;
  IconCreator iconCreator = IconCreator();
  MyAppBar myAppBar = const MyAppBar();

  @override
  void initState() {
    super.initState();
    modeNumber = widget.modeNumber;
    iconNumber = widget.currentLocationWeatherS1[0]['WeatherIcon'];
    cityName = widget.cityName;
  }

  @override
  Widget build(BuildContext context) {
    AccIconData accIconData = AccIconData.fromJson(widget.iconData);
    FinalData finalData = FinalData.getFinalData(widget, modeNumber);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MyAppBar(
        modeNumber: modeNumber,
        widget: widget.widget,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${finalData.temperature}°',
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        DateFormat('EEEE').format(date),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "${finalData.maxTemperature}°/${finalData.minTemperature}°",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: iconCreator.icon(iconNumber, 200),
            ),
            Card(
              color: Theme.of(context).colorScheme.secondary,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconCreator.icon(accIconData.iconNumber1 ?? 0, 45),
                          Text(
                            DateFormat('EEEE').format(finalData.day1 ?? date),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "${finalData.maxTemperatureDay1}°/${finalData.minTemperatureDay1}°",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconCreator.icon(accIconData.iconNumber2 ?? 0, 45),
                          // : iconLink2 == '',
                          Text(
                            DateFormat('EEEE').format(finalData.day2 ?? date),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "${finalData.maxTemperatureDay2}°/${finalData.minTemperatureDay2}°",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconCreator.icon(accIconData.iconNumber3 ?? 0, 45),
                          Text(
                            DateFormat('EEEE').format(finalData.day3 ?? date),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${finalData.maxTemperatureDay3}°/${finalData.minTemperatureDay3}°",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

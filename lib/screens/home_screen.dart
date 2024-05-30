import 'package:flutter/material.dart';
import 'package:weather_application/services/final_data.dart';
import 'app_bar.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/services/icon_generator.dart';
import 'package:weather_application/services/accweather_icon_data.dart';
import 'package:weather_application/screens/loading_screen.dart';

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
    List<String> modeNames = ['Optimistic', 'Average', 'Pessimistic'];
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cityName.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    PopupMenuButton(
                      offset: const Offset(100, 0),
                      // constraints: const BoxConstraints.tightFor(width: 150),
                      tooltip: 'Setting',
                      iconColor: Colors.white,
                      color: Theme.of(context).colorScheme.secondary,
                      itemBuilder: (context) => [
                        CheckedPopupMenuItem(
                          checked: widget.modeNumber == 1 ? true : false,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return LoadingScreen(
                                  modeNumber: 1,
                                  isLocationMode: widget.widget.isLocationMode,
                                  city: widget.widget.city);
                            }), ModalRoute.withName("/loading_screen"));
                          },
                          child: const Text(
                            'Optimistic',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        CheckedPopupMenuItem(
                          checked: widget.modeNumber == 2 ? true : false,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return LoadingScreen(
                                  modeNumber: 2,
                                  isLocationMode: widget.widget.isLocationMode,
                                  city: widget.widget.city);
                            }), ModalRoute.withName("/loading_screen"));
                          },
                          child: const Text(
                            'Average',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        CheckedPopupMenuItem(
                          checked: widget.modeNumber == 3 ? true : false,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return LoadingScreen(
                                  modeNumber: 3,
                                  isLocationMode: widget.widget.isLocationMode,
                                  city: widget.widget.city);
                            }), ModalRoute.withName("/loading_screen"));
                          },
                          child: const Text(
                            'Pessimistic',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            modeNames[modeNumber - 1],
                            style: const TextStyle(fontSize: 17),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // textBaseline: TextBaseline.alphabetic,
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
                      padding: const EdgeInsets.only(left: 10, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
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
                          Text(
                            finalData.weatherText!,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
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

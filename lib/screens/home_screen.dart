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
      // Getting the AppBar from app_bar.dart.
      appBar: MyAppBar(
        modeNumber: modeNumber,
        widget: widget.widget,
      ),
      // Adding the the functionallity of scrolling using ListView widget.
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          // Adding a padding to the whole page.
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            // Column that holds the whole page.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Start the top part of the page.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row that holds the city name and the Perspective menu.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // City name
                        Text(
                          cityName.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // Perspective menu
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
                                      isLocationMode:
                                          widget.widget.isLocationMode,
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
                                      isLocationMode:
                                          widget.widget.isLocationMode,
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
                                      isLocationMode:
                                          widget.widget.isLocationMode,
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
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Row that holds current temperature, day, maximum and minimum temperature, and weather description.
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Current temperature.
                        Text(
                          '${finalData.temperature}°',
                          style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // Adding padding to seperate the current temperature form other widgets.
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 15),
                          // Column that holds day, maximum and minimum temperature, and weather description.
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Row that holds day, maximum and minimum temperature.
                              Row(
                                children: [
                                  // Adding padding to seperate the day from other widgets.
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    // Day
                                    child: Text(
                                      DateFormat('EEEE').format(date),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // Maximum and minimum temperature.
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
                              // Weather description.
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
                // Adding space using SizedBox.
                const SizedBox(height: 50),
                // Weather Icon
                SizedBox(
                  height: 200,
                  child: iconCreator.icon(iconNumber, 200),
                ),
                // Adding space using SizedBox.
                const SizedBox(height: 50),
                // Row that holds feels like and wind speed.
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Weather Details',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // feels like.
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 135,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/icons/feel-like-1.png'),
                                  color: Colors.white,
                                  height: 40,
                                ),
                                const Text(
                                  'Feels like',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  '${finalData.feelsLike}°',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // wind speed.
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 135,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Image(
                                  image: AssetImage('assets/icons/wind.png'),
                                  color: Colors.white,
                                  height: 40,
                                ),
                                const Text(
                                  'Wind NW',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '${finalData.windSpeed} ',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                    const Text(
                                      'Km/h',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row that holds humidiity and UV index
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // Humidity
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 135,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/icons/humidity.png'),
                                  color: Colors.white,
                                  height: 40,
                                ),
                                const Text(
                                  'Humidity',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  '${finalData.humidity}%',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // UV index
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: 135,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Image(
                                  image: AssetImage('assets/icons/uv.png'),
                                  height: 40,
                                ),
                                const Text(
                                  'UV Index',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '${finalData.uvIndex}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                    const Text(
                                      'm',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Daily forecast
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Daily Forecast',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
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
                              iconCreator.icon(
                                  accIconData.iconNumber1 ?? 0, 40),
                              Text(
                                DateFormat('EEEE')
                                    .format(finalData.day1 ?? date),
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
                              iconCreator.icon(
                                  accIconData.iconNumber2 ?? 0, 40),
                              // : iconLink2 == '',
                              Text(
                                DateFormat('EEEE')
                                    .format(finalData.day2 ?? date),
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
                              iconCreator.icon(
                                  accIconData.iconNumber3 ?? 0, 40),
                              Text(
                                DateFormat('EEEE')
                                    .format(finalData.day3 ?? date),
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
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              iconCreator.icon(
                                  accIconData.iconNumber4 ?? 0, 40),
                              Text(
                                DateFormat('EEEE')
                                    .format(finalData.day4 ?? date),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "${finalData.maxTemperatureDay4}°/${finalData.minTemperatureDay4}°",
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
                // Adding space using SizedBox.
                const SizedBox(height: 15),
                // Application Text.
                const Text(
                  'Weather',
                  style: TextStyle(color: Colors.white60, fontSize: 20),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

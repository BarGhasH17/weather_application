import 'package:flutter/material.dart';
import 'drawer.dart';
import 'app_bar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {this.currentLocationWeather,
      this.LocationWeather,
      this.cityName,
      super.key});
  final currentLocationWeather;
  final LocationWeather;
  final cityName;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int temperature;
  late int maxTemperature,
      maxTemperatureDay1,
      maxTemperatureDay2,
      maxTemperatureDay3;
  late int minTemperature,
      minTemperatureDay1,
      minTemperatureDay2,
      minTemperatureDay3;
  late String city;
  late var day1, day2, day3;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();

    updateUI(
        widget.currentLocationWeather, widget.LocationWeather, widget.cityName);
  }

  void updateUI(
      dynamic currentWeatherData, dynamic weatherData, String cityName) {
    city = cityName;
    temperature =
        currentWeatherData[0]['Temperature']['Metric']['Value'].toInt();
    maxTemperature = weatherData['DailyForecasts'][0]['Temperature']['Maximum']
            ['Value']
        .toInt();
    minTemperature = weatherData['DailyForecasts'][0]['Temperature']['Minimum']
            ['Value']
        .toInt();
    day1 = DateTime.parse(weatherData['DailyForecasts'][1]['Date']);
    day2 = DateTime.parse(weatherData['DailyForecasts'][2]['Date']);
    day3 = DateTime.parse(weatherData['DailyForecasts'][3]['Date']);
    maxTemperatureDay1 = weatherData['DailyForecasts'][1]['Temperature']
            ['Maximum']['Value']
        .toInt();
    minTemperatureDay1 = weatherData['DailyForecasts'][1]['Temperature']
            ['Minimum']['Value']
        .toInt();
    maxTemperatureDay2 = weatherData['DailyForecasts'][2]['Temperature']
            ['Maximum']['Value']
        .toInt();
    minTemperatureDay2 = weatherData['DailyForecasts'][2]['Temperature']
            ['Minimum']['Value']
        .toInt();
    maxTemperatureDay3 = weatherData['DailyForecasts'][3]['Temperature']
            ['Maximum']['Value']
        .toInt();
    minTemperatureDay3 = weatherData['DailyForecasts'][3]['Temperature']
            ['Minimum']['Value']
        .toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[600],
      appBar: myAppBar(),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city.toUpperCase(),
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
                      '$temperature°',
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
                      "$maxTemperature°/$minTemperature°",
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
            const SizedBox(
              height: 200,
              child: Icon(
                Icons.sunny,
                color: Colors.yellow,
                size: 200,
              ),
            ),
            Card(
              color: Color.fromARGB(255, 51, 185, 247),
              surfaceTintColor: Colors.white,
              shadowColor: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          ),
                          Text(
                            DateFormat('EEEE').format(day1),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "$maxTemperatureDay1°/$minTemperatureDay1°",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          ),
                          Text(
                            DateFormat('EEEE').format(day2),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "$maxTemperatureDay2°/$minTemperatureDay2°",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          ),
                          Text(
                            DateFormat('EEEE').format(day3),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "$maxTemperatureDay3°/$minTemperatureDay3°",
                            style: TextStyle(color: Colors.white, fontSize: 20),
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

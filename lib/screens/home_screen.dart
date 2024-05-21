import 'package:flutter/material.dart';
import 'drawer.dart';
import 'app_bar.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/services/icon_generator.dart';
import 'package:weather_application/services/fetching_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {this.currentLocationWeather,
      this.locationWeather,
      this.cityName,
      super.key});
  final dynamic currentLocationWeather;
  final dynamic locationWeather;
  final dynamic cityName;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var date = DateTime.now();
  IconCreator iconCreator = IconCreator();

  @override
  void initState() {
    super.initState();

    updateUI(
        widget.currentLocationWeather, widget.locationWeather, widget.cityName);
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
            SizedBox(
              height: 200,
              child: iconCreator.icon(iconNumber, 200),
            ),
            Card(
              color: const Color.fromARGB(255, 51, 185, 247),
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
                          iconCreator.icon(iconNumber1, 45),
                          Text(
                            DateFormat('EEEE').format(day1),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "$maxTemperatureDay1°/$minTemperatureDay1°",
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
                          iconCreator.icon(iconNumber2, 45),
                          Text(
                            DateFormat('EEEE').format(day2),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "$maxTemperatureDay2°/$minTemperatureDay2°",
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
                          iconCreator.icon(iconNumber3, 45),
                          Text(
                            DateFormat('EEEE').format(day3),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "$maxTemperatureDay3°/$minTemperatureDay3°",
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

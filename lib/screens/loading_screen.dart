import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/services/location_data.dart';

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
    LocationData locationData = LocationData();
    locationData.getLocationData(context);
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

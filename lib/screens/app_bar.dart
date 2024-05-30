import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Theme/theme_provider.dart';
import 'package:weather_application/screens/city_screen.dart';
import 'package:weather_application/screens/info_screen.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({this.modeNumber, this.widget, super.key});
  final dynamic modeNumber;
  final dynamic widget;

  @override
  State<MyAppBar> createState() => MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: Builder(
        builder: (context) => IconButton(
            icon: const Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            tooltip: "Choose a city",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CityScreen();
              }));
            }),
      ),
      centerTitle: true,
      title: const Text(
        style: TextStyle(
          color: Colors.white,
        ),
        "Weather",
      ),
      actions: [
        IconButton(
          tooltip: 'Change mode',
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: const Icon(
            Icons.dark_mode_outlined,
            color: Colors.white,
          ),
        ),
        IconButton(
          tooltip: 'About',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const InfoScreen();
            }));
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

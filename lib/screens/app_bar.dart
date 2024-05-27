import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Theme/theme_provider.dart';
import 'package:weather_application/screens/city_screen.dart';
import 'package:weather_application/screens/info_screen.dart';
import 'package:weather_application/screens/loading_screen.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({this.modeNumber, super.key});
  final dynamic modeNumber;

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
            tooltip: "View cities",
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
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return const InfoScreen();
        //     }));
        //   },
        //   icon: const Icon(
        //     Icons.info_outlined,
        //     color: Colors.white,
        //   ),
        // ),
        IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: const Icon(
            Icons.dark_mode_outlined,
            color: Colors.white,
          ),
        ),
        PopupMenuButton(
          constraints: const BoxConstraints.tightFor(width: 150),
          tooltip: 'Change mode',
          iconColor: Colors.white,
          color: Theme.of(context).colorScheme.secondary,
          itemBuilder: (context) => [
            CheckedPopupMenuItem(
              checked: widget.modeNumber == 1 ? true : false,
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 1);
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
                  return const LoadingScreen(modeNumber: 2);
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
                  return const LoadingScreen(modeNumber: 3);
                }), ModalRoute.withName("/loading_screen"));
              },
              child: const Text(
                'pessimistic',
                style: TextStyle(color: Colors.white),
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.only(left: 50),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const InfoScreen();
                }));
              },
              child: const Text(
                'About  ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_application/screens/info_screen.dart';
import 'package:weather_application/screens/loading_screen.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlue[500],
      leading: Builder(
        builder: (context) => IconButton(
            icon: const Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            tooltip: "View cities",
            onPressed: () {
              Scaffold.of(context).openDrawer();
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const InfoScreen();
            }));
          },
          icon: const Icon(
            Icons.info_outlined,
            color: Colors.white,
          ),
        ),
        PopupMenuButton(
          tooltip: 'Change mode',
          iconColor: Colors.white,
          color: Colors.lightBlue[100],
          itemBuilder: (context) => [
            CheckedPopupMenuItem(
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 1);
                }), ModalRoute.withName("/loading_screen"));
              },
              child: const Text('Optimistic'),
            ),
            CheckedPopupMenuItem(
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 2);
                }), ModalRoute.withName("/loading_screen"));
              },
              child: const Text('Average'),
            ),
            CheckedPopupMenuItem(
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 3);
                }), ModalRoute.withName("/loading_screen"));
              },
              child: const Text('pessimistic'),
            ),
          ],
        ),
      ],
    );
  }
}

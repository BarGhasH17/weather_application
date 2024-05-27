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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 1);
                }));
              },
              child: const Text('Optimistic'),
            ),
            CheckedPopupMenuItem(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 2);
                }));
              },
              child: const Text('Average'),
            ),
            CheckedPopupMenuItem(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoadingScreen(modeNumber: 3);
                }));
              },
              child: const Text('pessimistic'),
            ),
          ],
        ),
      ],
    );
  }
}

// PreferredSizeWidget myAppBar() {
//   return AppBar(
//     backgroundColor: Colors.lightBlue[500],
//     leading: Builder(
//       builder: (context) => IconButton(
//           icon: const Icon(
//             Icons.location_city,
//             color: Colors.white,
//           ),
//           tooltip: "View cities",
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           }),
//     ),
//     centerTitle: true,
//     title: const Text(
//       style: TextStyle(
//         color: Colors.white,
//       ),
//       "Weather",
//     ),
//     actions: [
//       IconButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const InfoScreen();
//           }));
//         },
//         icon: const Icon(
//           Icons.info,
//           color: Colors.white,
//         ),
//       )
//       // PopupMenuButton(
//       //   iconColor: Colors.white,
//       //   color: Colors.lightBlue[100],
//       //   itemBuilder: (context) => [
//       //     PopupMenuItem(
//       //       onTap: () {
//       //         Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //           return const InfoScreen();
//       //         }));
//       //       },
//       //       child: const Center(
//       //         child: Text(
//       //           style: TextStyle(color: Color.fromARGB(255, 3, 155, 229)),
//       //           "About  ",
//       //         ),
//       //       ),
//       //     ),
//       //   ],
//       // )
//     ],
//   );
// }

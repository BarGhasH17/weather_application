import 'package:flutter/material.dart';
import 'drawer.dart';
import 'app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[600],
      appBar: myAppBar(),
      drawer: const MyDrawer(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CHELYABINSK",
                  style: TextStyle(
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
                      "22°",
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Text(
                        "Monday",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "24°/12°",
                      style: TextStyle(
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
                            "Today",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "24°/12°",
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
                            "Today",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "24°/12°",
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
                            "Today",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "24°/12°",
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

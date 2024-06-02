import 'package:flutter/material.dart';

class IconCreator {
  final Map<List<int>, String> _iconMap = {
    [1, 2, 3, 4, 30]: 'assets/icons/sun.png',
    [5, 6, 7, 35, 36, 37, 38]: 'assets/icons/cloud.png',
    [8, 9, 10, 11]: 'assets/icons/foggy.png',
    [12, 13, 14, 39, 40]: 'assets/icons/heavy-rain.png',
    [15, 16, 17, 41, 42]: 'assets/icons/storm.png',
    [18, 26]: 'assets/icons/rain.png',
    [19, 20, 21, 43]: 'assets/icons/flurries.png',
    [22, 23, 24, 25, 26, 27, 28, 29, 44]: 'assets/icons/snowy.png',
    [31, 32]: 'assets/icons/windy.png',
    [33, 34]: 'assets/icons/moon.png',
  };

  dynamic icon(int iconNumber, double height) {
    for (var entry in _iconMap.entries) {
      if (entry.key.contains(iconNumber)) {
        return Image(image: AssetImage(entry.value), height: height);
      }
    }
    return const Image(image: AssetImage('assets/icons/404.png'));
  }
}

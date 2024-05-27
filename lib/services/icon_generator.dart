import 'package:flutter/material.dart';

class IconCreator {
  dynamic iconWithLink(iconLink, {height}) {
    try {
      return Image.network(
        'http:$iconLink',
        height: height,
      );
    } catch (e) {
      return Image.network(iconLink);
    }
  }

  dynamic icon(int iconNumber, double height) {
    if ([1, 2, 3, 4, 30].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/sun.png'), height: height);
    } else if ([5, 6, 7, 35, 36, 37, 38].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/cloud.png'), height: height);
    } else if ([8, 9, 10, 11].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/foggy.png'), height: height);
    } else if ([12, 13, 14, 39, 40].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/heavy-rain.png'),
          height: height);
    } else if ([15, 16, 17, 41, 42].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/storm.png'), height: height);
    } else if ([18, 26].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/rain.png'), height: height);
    } else if ([19, 20, 21, 43].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/flurries.png'), height: height);
    } else if ([22, 23, 24, 25, 26, 27, 28, 29, 44].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/snowy.png'), height: height);
    } else if ([31, 32].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/windy.png'), height: height);
    } else if ([33, 34].contains(iconNumber)) {
      return Image(
          image: const AssetImage('assets/icons/moon.png'), height: height);
    } else {
      return const Image(image: AssetImage('assets/icons/404.png'));
    }
  }
}

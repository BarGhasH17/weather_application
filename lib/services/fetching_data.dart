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
late DateTime day1, day2, day3;
late int iconNumber, iconNumber1, iconNumber2, iconNumber3;

void updateUI(
    dynamic currentWeatherData, dynamic weatherData, String cityName) {
  city = cityName;
  temperature = currentWeatherData[0]['Temperature']['Metric']['Value'].toInt();
  maxTemperature = weatherData['DailyForecasts'][0]['Temperature']['Maximum']
          ['Value']
      .toInt();
  minTemperature = weatherData['DailyForecasts'][0]['Temperature']['Minimum']
          ['Value']
      .toInt();
  iconNumber = currentWeatherData[0]['WeatherIcon'];
  day1 = DateTime.parse(weatherData['DailyForecasts'][1]['Date']);
  day2 = DateTime.parse(weatherData['DailyForecasts'][2]['Date']);
  day3 = DateTime.parse(weatherData['DailyForecasts'][3]['Date']);
  iconNumber1 = weatherData['DailyForecasts'][1]['Day']['Icon'];
  iconNumber2 = weatherData['DailyForecasts'][2]['Day']['Icon'];
  iconNumber3 = weatherData['DailyForecasts'][3]['Day']['Icon'];
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

class AccWeatherData {
  AccWeatherData({
    this.temperature,
    this.maxTemperature,
    this.maxTemperatureDay1,
    this.maxTemperatureDay2,
    this.maxTemperatureDay3,
    this.minTemperature,
    this.minTemperatureDay1,
    this.minTemperatureDay2,
    this.minTemperatureDay3,
    this.day1,
    this.day2,
    this.day3,
  });
  int? temperature;
  int? maxTemperature,
      maxTemperatureDay1,
      maxTemperatureDay2,
      maxTemperatureDay3;
  int? minTemperature,
      minTemperatureDay1,
      minTemperatureDay2,
      minTemperatureDay3;
  DateTime? day1, day2, day3;

  AccWeatherData.fromJson(Map<String, dynamic> json) {
    maxTemperature =
        json['DailyForecasts'][0]['Temperature']['Maximum']['Value'].toInt();
    minTemperature =
        json['DailyForecasts'][0]['Temperature']['Minimum']['Value'].toInt();
    day1 = DateTime.parse(json['DailyForecasts'][1]['Date']);
    day2 = DateTime.parse(json['DailyForecasts'][2]['Date']);
    day3 = DateTime.parse(json['DailyForecasts'][3]['Date']);
    // iconNumber1 = json['DailyForecasts'][1]['Day']['Icon'];
    // iconNumber2 = json['DailyForecasts'][2]['Day']['Icon'];
    // iconNumber3 = json['DailyForecasts'][3]['Day']['Icon'];
    maxTemperatureDay1 =
        json['DailyForecasts'][1]['Temperature']['Maximum']['Value'].toInt();
    minTemperatureDay1 =
        json['DailyForecasts'][1]['Temperature']['Minimum']['Value'].toInt();
    maxTemperatureDay2 =
        json['DailyForecasts'][2]['Temperature']['Maximum']['Value'].toInt();
    minTemperatureDay2 =
        json['DailyForecasts'][2]['Temperature']['Minimum']['Value'].toInt();
    maxTemperatureDay3 =
        json['DailyForecasts'][3]['Temperature']['Maximum']['Value'].toInt();
    minTemperatureDay3 =
        json['DailyForecasts'][3]['Temperature']['Minimum']['Value'].toInt();
  }
}

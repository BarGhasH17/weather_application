class WeatherApiData {
  WeatherApiData({
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

  WeatherApiData.fromJson(Map<String, dynamic> json) {
    temperature = json['current']['temp_c'].toInt();
    maxTemperature =
        json['forecast']['forecastday'][0]['day']['maxtemp_c'].toInt();
    minTemperature =
        json['forecast']['forecastday'][0]['day']['mintemp_c'].toInt();
    day1 = DateTime.parse(json['forecast']['forecastday'][1]['date']);
    day2 = DateTime.parse(json['forecast']['forecastday'][2]['date']);
    day3 = DateTime.parse(json['forecast']['forecastday'][3]['date']);
    maxTemperatureDay1 =
        json['forecast']['forecastday'][1]['day']['maxtemp_c'].toInt();
    minTemperatureDay1 =
        json['forecast']['forecastday'][1]['day']['mintemp_c'].toInt();
    maxTemperatureDay2 =
        json['forecast']['forecastday'][2]['day']['maxtemp_c'].toInt();
    minTemperatureDay2 =
        json['forecast']['forecastday'][2]['day']['mintemp_c'].toInt();
    maxTemperatureDay3 =
        json['forecast']['forecastday'][3]['day']['maxtemp_c'].toInt();
    minTemperatureDay3 =
        json['forecast']['forecastday'][3]['day']['mintemp_c'].toInt();
  }
}

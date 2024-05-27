class OpenMeteoData {
  OpenMeteoData({
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
  String? day1, day2, day3;

  OpenMeteoData.jsonFrom(Map<String, dynamic> json) {
    temperature = json['current']['temperature_2m'].toInt();
    maxTemperature = json['daily']['temperature_2m_max'][0].toInt();
    maxTemperatureDay1 = json['daily']['temperature_2m_max'][1].toInt();
    maxTemperatureDay2 = json['daily']['temperature_2m_max'][2].toInt();
    maxTemperatureDay3 = json['daily']['temperature_2m_max'][3].toInt();
    minTemperature = json['daily']['temperature_2m_min'][0].toInt();
    minTemperatureDay1 = json['daily']['temperature_2m_min'][1].toInt();
    minTemperatureDay2 = json['daily']['temperature_2m_min'][2].toInt();
    minTemperatureDay3 = json['daily']['temperature_2m_min'][3].toInt();
    day1 = json['daily']['time'][1];
    day2 = json['daily']['time'][2];
    day3 = json['daily']['time'][3];
  }
}

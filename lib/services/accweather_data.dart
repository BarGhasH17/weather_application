class AccWeatherData {
  final List<DailyForecast> dailyForecasts;

  AccWeatherData({
    required this.dailyForecasts,
  });

  factory AccWeatherData.fromJson(Map<String, dynamic> json) {
    return AccWeatherData(
      dailyForecasts: (json['DailyForecasts'] as List)
          .map((i) => DailyForecast.fromJson(i))
          .toList(),
    );
  }
}

class DailyForecast {
  final DateTime date;
  final int epochDate;
  final Temperature temperature;
  final Day day;
  final Night night;
  final List<String> sources;
  final String mobileLink;
  final String link;

  DailyForecast({
    required this.date,
    required this.epochDate,
    required this.temperature,
    required this.day,
    required this.night,
    required this.sources,
    required this.mobileLink,
    required this.link,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.parse(json['Date']),
      epochDate: json['EpochDate'],
      temperature: Temperature.fromJson(json['Temperature']),
      day: Day.fromJson(json['Day']),
      night: Night.fromJson(json['Night']),
      sources: List<String>.from(json['Sources']),
      mobileLink: json['MobileLink'],
      link: json['Link'],
    );
  }
}

class Temperature {
  final TempDetail minimum;
  final TempDetail maximum;

  Temperature({
    required this.minimum,
    required this.maximum,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      minimum: TempDetail.fromJson(json['Minimum']),
      maximum: TempDetail.fromJson(json['Maximum']),
    );
  }
}

class TempDetail {
  final int value;
  final String unit;
  final int unitType;

  TempDetail({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  factory TempDetail.fromJson(Map<String, dynamic> json) {
    return TempDetail(
      value: json['Value'].toInt(),
      unit: json['Unit'],
      unitType: json['UnitType'],
    );
  }
}

class Day {
  final int icon;
  final String iconPhrase;
  final bool hasPrecipitation;
  final String? precipitationType;
  final String? precipitationIntensity;

  Day({
    required this.icon,
    required this.iconPhrase,
    required this.hasPrecipitation,
    this.precipitationType,
    this.precipitationIntensity,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      icon: json['Icon'],
      iconPhrase: json['IconPhrase'],
      hasPrecipitation: json['HasPrecipitation'],
      precipitationType: json['PrecipitationType'],
      precipitationIntensity: json['PrecipitationIntensity'],
    );
  }
}

class Night {
  final int icon;
  final String iconPhrase;
  final bool hasPrecipitation;

  Night({
    required this.icon,
    required this.iconPhrase,
    required this.hasPrecipitation,
  });

  factory Night.fromJson(Map<String, dynamic> json) {
    return Night(
      icon: json['Icon'],
      iconPhrase: json['IconPhrase'],
      hasPrecipitation: json['HasPrecipitation'],
    );
  }
}

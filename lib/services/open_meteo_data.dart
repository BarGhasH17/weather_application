class OpenMeteoData {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final DailyUnits dailyUnits;
  final Daily daily;

  OpenMeteoData({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    required this.dailyUnits,
    required this.daily,
  });

  factory OpenMeteoData.fromJson(Map<String, dynamic> json) {
    return OpenMeteoData(
      latitude: json['latitude'],
      longitude: json['longitude'],
      generationtimeMs: json['generationtime_ms'],
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),
      dailyUnits: DailyUnits.fromJson(json['daily_units']),
      daily: Daily.fromJson(json['daily']),
    );
  }
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2m,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
    );
  }
}

class Current {
  final String time;
  final int interval;
  final int temperature2m;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2m,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'],
      interval: json['interval'],
      temperature2m: json['temperature_2m'].toInt(),
    );
  }
}

class DailyUnits {
  final String time;
  final String temperature2mMax;
  final String temperature2mMin;

  DailyUnits({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'],
      temperature2mMax: json['temperature_2m_max'],
      temperature2mMin: json['temperature_2m_min'],
    );
  }
}

class Daily {
  final List<String> time;
  final List<int> temperature2mMax;
  final List<int> temperature2mMin;

  Daily({
    required this.time,
    required this.temperature2mMax,
    required this.temperature2mMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: List<String>.from(json['time']),
      temperature2mMax:
          List<int>.from(json['temperature_2m_max'].map((x) => x.toInt())),
      temperature2mMin:
          List<int>.from(json['temperature_2m_min'].map((x) => x.toInt())),
    );
  }
}

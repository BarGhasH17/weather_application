import 'accweather_data.dart';
import 'weather_api_data.dart';
import 'open_meteo_data.dart';

class FinalData {
  FinalData({
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
    this.weatherText,
    this.feelsLike,
    this.windSpeed,
    this.humidity,
    this.uvIndex,
  });

  int? temperature;
  int? maxTemperature,
      maxTemperatureDay1,
      maxTemperatureDay2,
      maxTemperatureDay3,
      maxTemperatureDay4;
  int? minTemperature,
      minTemperatureDay1,
      minTemperatureDay2,
      minTemperatureDay3,
      minTemperatureDay4;
  DateTime? day1, day2, day3, day4;
  String? weatherText;
  int? feelsLike, windSpeed, humidity, uvIndex;

  int getMax(List<int> l) {
    l.sort();
    return l[2];
  }

  int getMedian(List<int> l) {
    l.sort();
    return l[1];
  }

  int getMin(List<int> l) {
    l.sort();
    return l[0];
  }

  int calculateTemperature(List<int> values, int mode) {
    switch (mode) {
      case 1:
        return getMax(values);
      case 2:
        return getMedian(values);
      case 3:
        return getMin(values);
      default:
        throw ArgumentError('Invalid mode');
    }
  }

  List<int> gatherTemperatures(dynamic widget, WeatherApiData weatherApiData,
      OpenMeteoData openMeteoData) {
    return [
      widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
          .toInt(),
      weatherApiData.current.tempC,
      openMeteoData.current.temperature2m
    ];
  }

  List<int> gatherMaxTemperatures(int dayIndex, AccWeatherData accWeatherData,
      WeatherApiData weatherApiData, OpenMeteoData openMeteoData) {
    return [
      accWeatherData.dailyForecasts[dayIndex].temperature.maximum.value,
      weatherApiData.forecast.forecastday[dayIndex].day.maxtempC,
      openMeteoData.daily.temperature2mMax[dayIndex]
    ];
  }

  List<int> gatherMinTemperatures(int dayIndex, AccWeatherData accWeatherData,
      WeatherApiData weatherApiData, OpenMeteoData openMeteoData) {
    return [
      accWeatherData.dailyForecasts[dayIndex].temperature.minimum.value,
      weatherApiData.forecast.forecastday[dayIndex].day.mintempC,
      openMeteoData.daily.temperature2mMin[dayIndex]
    ];
  }

  FinalData.getFinalData(dynamic widget, int modeNumber) {
    AccWeatherData accWeatherData =
        AccWeatherData.fromJson(widget.locationWeatherS1);
    WeatherApiData weatherApiData =
        WeatherApiData.fromJson(widget.locationWeatherS2);
    OpenMeteoData openMeteoData =
        OpenMeteoData.fromJson(widget.locationWeatherS3);

    day1 = accWeatherData.dailyForecasts[1].date;
    day2 = accWeatherData.dailyForecasts[2].date;
    day3 = accWeatherData.dailyForecasts[3].date;
    day4 = accWeatherData.dailyForecasts[4].date;
    feelsLike = weatherApiData.current.feelslikeC;
    windSpeed = weatherApiData.current.windKph;
    humidity = weatherApiData.current.humidity;
    uvIndex = weatherApiData.current.uv;
    weatherText = widget.currentLocationWeatherS1[0]['WeatherText'];

    try {
      temperature = calculateTemperature(
          gatherTemperatures(widget, weatherApiData, openMeteoData),
          modeNumber);
      maxTemperature = calculateTemperature(
          gatherMaxTemperatures(
              0, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      maxTemperatureDay1 = calculateTemperature(
          gatherMaxTemperatures(
              1, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      maxTemperatureDay2 = calculateTemperature(
          gatherMaxTemperatures(
              2, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      maxTemperatureDay3 = calculateTemperature(
          gatherMaxTemperatures(
              3, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      maxTemperatureDay4 = calculateTemperature(
          gatherMaxTemperatures(
              4, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      minTemperature = calculateTemperature(
          gatherMinTemperatures(
              0, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      minTemperatureDay1 = calculateTemperature(
          gatherMinTemperatures(
              1, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      minTemperatureDay2 = calculateTemperature(
          gatherMinTemperatures(
              2, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      minTemperatureDay3 = calculateTemperature(
          gatherMinTemperatures(
              3, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
      minTemperatureDay4 = calculateTemperature(
          gatherMinTemperatures(
              4, accWeatherData, weatherApiData, openMeteoData),
          modeNumber);
    } catch (e) {
      temperature = widget.currentLocationWeatherS1[0]['Temperature']['Metric']
              ['Value']
          .toInt();
      maxTemperature =
          accWeatherData.dailyForecasts[0].temperature.maximum.value;
      maxTemperatureDay1 =
          accWeatherData.dailyForecasts[1].temperature.maximum.value;
      maxTemperatureDay2 =
          accWeatherData.dailyForecasts[2].temperature.maximum.value;
      maxTemperatureDay3 =
          accWeatherData.dailyForecasts[3].temperature.maximum.value;
      minTemperature =
          accWeatherData.dailyForecasts[0].temperature.minimum.value;
      minTemperatureDay1 =
          accWeatherData.dailyForecasts[1].temperature.minimum.value;
      minTemperatureDay2 =
          accWeatherData.dailyForecasts[2].temperature.minimum.value;
      minTemperatureDay3 =
          accWeatherData.dailyForecasts[3].temperature.minimum.value;
    }
  }
}

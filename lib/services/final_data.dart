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

  int getMax(l) {
    l.sort();
    return l[2];
  }

  int getMedian(l) {
    l.sort();
    return l[1];
  }

  int getMin(l) {
    l.sort();
    return l[0];
  }

  FinalData.getFinalData(dynamic widget, int modeNumber) {
    AccWeatherData accWeatherData =
        AccWeatherData.fromJson(widget.locationWeatherS1);
    WeatherApiData weatherApiData =
        WeatherApiData.fromJson(widget.locationWeatherS2);
    OpenMeteoData openMeteoData =
        OpenMeteoData.jsonFrom(widget.locationWeatherS3);
    day1 = accWeatherData.day1;
    day2 = accWeatherData.day2;
    day3 = accWeatherData.day3;
    try {
      if (modeNumber == 1) {
        temperature = getMax([
          widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
              .toInt(),
          weatherApiData.temperature,
          openMeteoData.temperature,
        ]);
        maxTemperature = getMax([
          accWeatherData.maxTemperature,
          weatherApiData.maxTemperature,
          openMeteoData.maxTemperature,
        ]);
        maxTemperatureDay1 = getMax([
          accWeatherData.maxTemperatureDay1,
          weatherApiData.maxTemperatureDay1,
          openMeteoData.maxTemperatureDay1,
        ]);
        maxTemperatureDay2 = getMax([
          accWeatherData.maxTemperatureDay2,
          weatherApiData.maxTemperatureDay2,
          openMeteoData.maxTemperatureDay2,
        ]);
        maxTemperatureDay3 = getMax([
          accWeatherData.maxTemperatureDay3,
          weatherApiData.maxTemperatureDay3,
          openMeteoData.maxTemperatureDay3,
        ]);
        minTemperature = getMax([
          accWeatherData.minTemperature,
          weatherApiData.minTemperature,
          openMeteoData.minTemperature,
        ]);
        minTemperatureDay1 = getMax([
          accWeatherData.minTemperatureDay1,
          weatherApiData.minTemperatureDay1,
          openMeteoData.minTemperatureDay1,
        ]);
        minTemperatureDay2 = getMax([
          accWeatherData.minTemperatureDay2,
          weatherApiData.minTemperatureDay2,
          openMeteoData.minTemperatureDay2,
        ]);
        minTemperatureDay3 = getMax([
          accWeatherData.minTemperatureDay3,
          weatherApiData.minTemperatureDay3,
          openMeteoData.minTemperatureDay3,
        ]);
      } else if (modeNumber == 2) {
        temperature = getMedian([
          widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
              .toInt(),
          weatherApiData.temperature,
          openMeteoData.temperature,
        ]);
        // maxTemperature
        maxTemperature = getMedian([
          accWeatherData.maxTemperature,
          weatherApiData.maxTemperature,
          openMeteoData.maxTemperature,
        ]);
        // maxTemperatureDay1
        maxTemperatureDay1 = getMedian([
          accWeatherData.maxTemperatureDay1,
          weatherApiData.maxTemperatureDay1,
          openMeteoData.maxTemperatureDay1,
        ]);
        // maxTemperatureDay2
        maxTemperatureDay2 = getMedian([
          accWeatherData.maxTemperatureDay2,
          weatherApiData.maxTemperatureDay2,
          openMeteoData.maxTemperatureDay2,
        ]);
        // maxTemperatureDay3
        maxTemperatureDay3 = getMedian([
          accWeatherData.maxTemperatureDay3,
          weatherApiData.maxTemperatureDay3,
          openMeteoData.maxTemperatureDay3,
        ]);
        // minTemperature
        minTemperature = getMedian([
          accWeatherData.minTemperature,
          weatherApiData.minTemperature,
          openMeteoData.minTemperature,
        ]);
        // minTemperatureDay1
        minTemperatureDay1 = getMedian([
          accWeatherData.minTemperatureDay1,
          weatherApiData.minTemperatureDay1,
          openMeteoData.minTemperatureDay1,
        ]);
        // minTemperatureDay2
        minTemperatureDay2 = getMedian([
          accWeatherData.minTemperatureDay2,
          weatherApiData.minTemperatureDay2,
          openMeteoData.minTemperatureDay2,
        ]);
        // minTemperatureDay3
        minTemperatureDay3 = getMedian([
          accWeatherData.minTemperatureDay3,
          weatherApiData.minTemperatureDay3,
          openMeteoData.minTemperatureDay3,
        ]);
      } else if (modeNumber == 3) {
        temperature = getMin([
          widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
              .toInt(),
          weatherApiData.temperature,
          openMeteoData.temperature,
        ]);
        maxTemperature = getMin([
          accWeatherData.maxTemperature,
          weatherApiData.maxTemperature,
          openMeteoData.maxTemperature,
        ]);
        maxTemperatureDay1 = getMin([
          accWeatherData.maxTemperatureDay1,
          weatherApiData.maxTemperatureDay1,
          openMeteoData.maxTemperatureDay1,
        ]);
        maxTemperatureDay2 = getMin([
          accWeatherData.maxTemperatureDay2,
          weatherApiData.maxTemperatureDay2,
          openMeteoData.maxTemperatureDay2,
        ]);
        maxTemperatureDay3 = getMin([
          accWeatherData.maxTemperatureDay3,
          weatherApiData.maxTemperatureDay3,
          openMeteoData.maxTemperatureDay3,
        ]);
        minTemperature = getMin([
          accWeatherData.minTemperature,
          weatherApiData.minTemperature,
          openMeteoData.minTemperature,
        ]);
        minTemperatureDay1 = getMin([
          accWeatherData.minTemperatureDay1,
          weatherApiData.minTemperatureDay1,
          openMeteoData.minTemperatureDay1,
        ]);
        minTemperatureDay2 = getMin([
          accWeatherData.minTemperatureDay2,
          weatherApiData.minTemperatureDay2,
          openMeteoData.minTemperatureDay2,
        ]);
        minTemperatureDay3 = getMin([
          accWeatherData.minTemperatureDay3,
          weatherApiData.minTemperatureDay3,
          openMeteoData.minTemperatureDay3,
        ]);
      }
    } catch (e) {
      temperature = widget.currentLocationWeatherS1[0]['Temperature']['Metric']
              ['Value']
          .toInt();
      maxTemperature = accWeatherData.maxTemperature;
      maxTemperatureDay1 = accWeatherData.maxTemperatureDay1;
      maxTemperatureDay2 = accWeatherData.maxTemperatureDay2;
      maxTemperatureDay3 = accWeatherData.maxTemperatureDay3;
      minTemperature = accWeatherData.minTemperature;
      minTemperatureDay1 = accWeatherData.minTemperatureDay1;
      minTemperatureDay2 = accWeatherData.minTemperatureDay2;
      minTemperatureDay3 = accWeatherData.minTemperatureDay3;
    }
  }
}

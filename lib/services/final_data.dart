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
  String? weatherText;

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
        OpenMeteoData.fromJson(widget.locationWeatherS3);
    day1 = accWeatherData.dailyForecasts[1].date;
    day2 = accWeatherData.dailyForecasts[2].date;
    day3 = accWeatherData.dailyForecasts[3].date;
    weatherText = widget.currentLocationWeatherS1[0]['WeatherText'];

    try {
      if (modeNumber == 1) {
        temperature = getMax([
          widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
              .toInt(),
          weatherApiData.current.tempC,
          openMeteoData.current.temperature2m,
        ]);
        maxTemperature = getMax([
          accWeatherData.dailyForecasts[0].temperature.maximum.value,
          weatherApiData.forecast.forecastday[0].day.maxtempC,
          openMeteoData.daily.temperature2mMax[0],
        ]);
        maxTemperatureDay1 = getMax([
          accWeatherData.dailyForecasts[1].temperature.maximum.value,
          weatherApiData.forecast.forecastday[1].day.maxtempC,
          openMeteoData.daily.temperature2mMax[1],
        ]);
        maxTemperatureDay2 = getMax([
          accWeatherData.dailyForecasts[2].temperature.maximum.value,
          weatherApiData.forecast.forecastday[2].day.maxtempC,
          openMeteoData.daily.temperature2mMax[2],
        ]);
        maxTemperatureDay3 = getMax([
          accWeatherData.dailyForecasts[3].temperature.maximum.value,
          weatherApiData.forecast.forecastday[3].day.maxtempC,
          openMeteoData.daily.temperature2mMax[3],
        ]);
        minTemperature = getMax([
          accWeatherData.dailyForecasts[0].temperature.minimum.value,
          weatherApiData.forecast.forecastday[0].day.mintempC,
          openMeteoData.daily.temperature2mMin[0],
        ]);
        minTemperatureDay1 = getMax([
          accWeatherData.dailyForecasts[1].temperature.minimum.value,
          weatherApiData.forecast.forecastday[1].day.mintempC,
          openMeteoData.daily.temperature2mMin[1],
        ]);
        minTemperatureDay2 = getMax([
          accWeatherData.dailyForecasts[2].temperature.minimum.value,
          weatherApiData.forecast.forecastday[2].day.mintempC,
          openMeteoData.daily.temperature2mMin[2],
        ]);
        minTemperatureDay3 = getMax([
          accWeatherData.dailyForecasts[3].temperature.minimum.value,
          weatherApiData.forecast.forecastday[3].day.mintempC,
          openMeteoData.daily.temperature2mMin[3],
        ]);
      } else if (modeNumber == 2) {
        temperature = getMedian([
          widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
              .toInt(),
          weatherApiData.current.tempC,
          openMeteoData.current.temperature2m,
        ]);
        // maxTemperature
        maxTemperature = getMedian([
          accWeatherData.dailyForecasts[0].temperature.maximum.value,
          weatherApiData.forecast.forecastday[0].day.maxtempC,
          openMeteoData.daily.temperature2mMax[0],
        ]);
        // maxTemperatureDay1
        maxTemperatureDay1 = getMedian([
          accWeatherData.dailyForecasts[1].temperature.maximum.value,
          weatherApiData.forecast.forecastday[1].day.maxtempC,
          openMeteoData.daily.temperature2mMax[1],
        ]);
        // maxTemperatureDay2
        maxTemperatureDay2 = getMedian([
          accWeatherData.dailyForecasts[2].temperature.maximum.value,
          weatherApiData.forecast.forecastday[2].day.maxtempC,
          openMeteoData.daily.temperature2mMax[2],
        ]);
        // maxTemperatureDay3
        maxTemperatureDay3 = getMedian([
          accWeatherData.dailyForecasts[3].temperature.maximum.value,
          weatherApiData.forecast.forecastday[3].day.maxtempC,
          openMeteoData.daily.temperature2mMax[3],
        ]);
        // minTemperature
        minTemperature = getMedian([
          accWeatherData.dailyForecasts[0].temperature.minimum.value,
          weatherApiData.forecast.forecastday[0].day.mintempC,
          openMeteoData.daily.temperature2mMin[0],
        ]);
        // minTemperatureDay1
        minTemperatureDay1 = getMedian([
          accWeatherData.dailyForecasts[1].temperature.minimum.value,
          weatherApiData.forecast.forecastday[1].day.mintempC,
          openMeteoData.daily.temperature2mMin[1],
        ]);
        // minTemperatureDay2
        minTemperatureDay2 = getMedian([
          accWeatherData.dailyForecasts[2].temperature.minimum.value,
          weatherApiData.forecast.forecastday[2].day.mintempC,
          openMeteoData.daily.temperature2mMin[2],
        ]);
        // minTemperatureDay3
        minTemperatureDay3 = getMedian([
          accWeatherData.dailyForecasts[3].temperature.minimum.value,
          weatherApiData.forecast.forecastday[3].day.mintempC,
          openMeteoData.daily.temperature2mMin[3],
        ]);
      } else if (modeNumber == 3) {
        temperature = getMin([
          widget.currentLocationWeatherS1[0]['Temperature']['Metric']['Value']
              .toInt(),
          weatherApiData.current.tempC,
          openMeteoData.current.temperature2m,
        ]);
        maxTemperature = getMin([
          accWeatherData.dailyForecasts[0].temperature.maximum.value,
          weatherApiData.forecast.forecastday[0].day.maxtempC,
          openMeteoData.daily.temperature2mMin[0],
        ]);
        maxTemperatureDay1 = getMin([
          accWeatherData.dailyForecasts[1].temperature.maximum.value,
          weatherApiData.forecast.forecastday[1].day.maxtempC,
          openMeteoData.daily.temperature2mMin[1],
        ]);
        maxTemperatureDay2 = getMin([
          accWeatherData.dailyForecasts[2].temperature.maximum.value,
          weatherApiData.forecast.forecastday[2].day.maxtempC,
          openMeteoData.daily.temperature2mMin[2],
        ]);
        maxTemperatureDay3 = getMin([
          accWeatherData.dailyForecasts[3].temperature.maximum.value,
          weatherApiData.forecast.forecastday[3].day.maxtempC,
          openMeteoData.daily.temperature2mMin[3],
        ]);
        minTemperature = getMin([
          accWeatherData.dailyForecasts[0].temperature.minimum.value,
          weatherApiData.forecast.forecastday[0].day.mintempC,
          openMeteoData.daily.temperature2mMin[0],
        ]);
        minTemperatureDay1 = getMin([
          accWeatherData.dailyForecasts[1].temperature.minimum.value,
          weatherApiData.forecast.forecastday[1].day.mintempC,
          openMeteoData.daily.temperature2mMin[1],
        ]);
        minTemperatureDay2 = getMin([
          accWeatherData.dailyForecasts[2].temperature.minimum.value,
          weatherApiData.forecast.forecastday[2].day.mintempC,
          openMeteoData.daily.temperature2mMin[2],
        ]);
        minTemperatureDay3 = getMin([
          accWeatherData.dailyForecasts[3].temperature.minimum.value,
          weatherApiData.forecast.forecastday[3].day.mintempC,
          openMeteoData.daily.temperature2mMin[3],
        ]);
      }
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

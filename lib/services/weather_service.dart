import 'package:dio/dio.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/models/weather_prediction.dart';

class WeatherService {
  static final WeatherService _instance = WeatherService._internal();

  Dio _dio;

  WeatherService._internal() {
    _dio = Dio(BaseOptions()..baseUrl = "https://www.metaweather.com");
  }

  factory WeatherService.get() {
    return _instance;
  }

  Future<List<Location>> getLocation(String locationName) async {
    var result = await _dio.get(("/api/location/search"),
        queryParameters: {"query": locationName});

    return (result.data as List)
        .map((data) => Location.fromJson(data))
        .toList();
  }

  Future<WeatherDetails> getWeather(int locationId) async {
    var result = await _dio.get(("/api/location/$locationId"));
    var weatherPrediction = WeatherPrediction.fromJson(result.data);

    return WeatherDetails.fromPrediction(weatherPrediction);
  }
}

class WeatherDetails {
  final double temperature;
  final double pressure;
  final double windSpeed;
  final String windDirection;
  final double humidity;
  final String weatherState;
  final String weatherIconUrl;
  final List<WeatherDetails> nextThreeDays;


  WeatherDetails(
      this.temperature,
      this.pressure,
      this.windSpeed,
      this.windDirection,
      this.humidity,
      this.weatherState,
      this.weatherIconUrl,
      this.nextThreeDays);

  factory WeatherDetails.fromPrediction(WeatherPrediction prediction) {
    var weatherForecast = prediction.weatherPrediction;

    var nextDays = weatherForecast.sublist(1, 4).map((element) =>
        WeatherDetails(
            element.theTemp,
            element.airPressure,
            element.windSpeed,
            element.windDirectionCompass,
            element.humidity,
            element.weatherStateName,
            "https://www.metaweather.com/static/img/weather/png/${element.weatherStateAbbr}.png",
            List<WeatherDetails>())).toList();


    return WeatherDetails(
        weatherForecast.first.theTemp,
        weatherForecast.first.airPressure,
        weatherForecast.first.windSpeed,
        weatherForecast.first.windDirectionCompass,
        weatherForecast.first.humidity,
        weatherForecast.first.weatherStateName,
        "https://www.metaweather.com/static/img/weather/png/${weatherForecast.first.weatherStateAbbr}.png",
        nextDays);

        }
}

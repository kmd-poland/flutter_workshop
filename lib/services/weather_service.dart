import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutterworkshops/models/location.dart';

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
    var result = await _dio.get(("/api/location/search"), queryParameters: {"query": locationName});

   return (result.data as List)
        .map((data) => Location.fromJson(data))
        .toList();
  }

  //TODO change it to use API and return WeatherPrediction
  WeatherDetails getWeather(String locationName) {
    Random rand = Random();
    return WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 360, rand.nextDouble() * 100, WeatherType.values[rand.nextInt(WeatherType.values.length)]);
  }
}

enum WeatherType {
  Snow,
  Sleet,
  Hail,
  Thunderstorm,
  HeavyRain,
  LightRain,
  Showers,
  HeavyCloud,
  LightCloud,
  Clear
}

class WeatherDetails {
  final double temperature;
  final double pressure;
  final double windSpeed;
  final double windDirection;
  final double humidity;

  final WeatherType type;

  WeatherDetails(this.temperature, this.pressure, this.windSpeed,
      this.windDirection, this.humidity, this.type);
}



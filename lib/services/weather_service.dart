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
    return WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 360, WeatherType.values[rand.nextInt(WeatherType.values.length)]);
  }
}

enum WeatherType {
  Cloudy,
  Rainy,
  Foggy,
  Sunny,
}

class WeatherDetails {
  final double Temperature;
  final double Preassure;
  final double WindSpeed;
  final double WindDirection;
  final WeatherType Type;

  WeatherDetails(this.Temperature, this.Preassure, this.WindSpeed,
      this.WindDirection, this.Type);
}



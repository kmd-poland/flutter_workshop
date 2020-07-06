import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class WeatherIcon extends StatelessWidget {
  final WeatherDetails details;
  final bool isTodaysWeather;

  WeatherIcon(this.details, this.isTodaysWeather);

  @override
  Widget build(BuildContext context) {
    return Image.network(details.weatherIconUrl, width:  isTodaysWeather ? 150 : 70);

  }
}
import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class WeatherIcon extends StatelessWidget {
  final WeatherDetails details;

  WeatherIcon(this.details);

  @override
  Widget build(BuildContext context) {
    return Image.network(details.weatherIconUrl, width: 150,);
  }
}
import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class WeatherIcon extends StatelessWidget {
  final WeatherDetails details;

  WeatherIcon(this.details);

  @override
  Widget build(BuildContext context) {
    return Text(_getUnicode(), style: Theme.of(context).textTheme.headline1,);
  }

  String _getUnicode() {
    switch(details.type) {
      case WeatherType.HeavyCloud:
      case WeatherType.LightCloud:
        return "⛅";
      case WeatherType.Snow:
      case WeatherType.Sleet:
      case WeatherType.Hail:
        return "🌨";
      case WeatherType.Thunderstorm:
      case WeatherType.Showers:
        return "🌩";
      case WeatherType.HeavyRain:
      case WeatherType.LightRain:
        return "🌧";
      case WeatherType.Clear:
        return "🌤";
    }
  }
}
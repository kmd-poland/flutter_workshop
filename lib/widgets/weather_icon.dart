import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class WeatherIcon extends StatelessWidget {
  final WeatherDetails details;
  final bool isTodaysWeather;

  WeatherIcon(this.details, this.isTodaysWeather);

  @override
  Widget build(BuildContext context) {
    return Text(_getUnicode(), style: isTodaysWeather ?
    Theme.of(context).textTheme.headline1 : Theme.of(context).textTheme.headline2
    );
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
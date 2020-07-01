import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  static const String routeName = "/weather";

  WeatherPage(this.cityName, {Key key}) : super(key: key);

  final String cityName;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather in ${widget.cityName}"),
        ),
        //TODO extend with more weather info
        body: Center(child: WeatherIcon(WeatherService.get().getWeather(widget.cityName).type))
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final WeatherType type;

  WeatherIcon(this.type);

  @override
  Widget build(BuildContext context) {
    return Text(_getUnicode(), style: Theme.of(context).textTheme.headline1,);
  }

  String _getUnicode() {
    switch(type) {
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

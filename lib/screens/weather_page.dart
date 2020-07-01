import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:flutterworkshops/widgets/wather_icon.dart';

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
        body: Center(child: WeatherIcon(WeatherService.get().getWeather(widget.cityName)))
    );
  }
}

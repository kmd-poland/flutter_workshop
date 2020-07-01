import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:flutterworkshops/widgets/wather_card.dart';
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
    return Stack(children: <Widget>[
      Positioned.fill(child: WeatherCard(WeatherService.get().getWeather(widget.cityName))),
      Container(
        height: 80,
        child: AppBar(
          elevation: 0,
          title: Text(widget.cityName),
          backgroundColor: Colors.transparent,
        ),
      ),
    ]);
  }
}

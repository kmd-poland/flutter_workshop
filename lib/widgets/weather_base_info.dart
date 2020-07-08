import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:flutterworkshops/widgets/weather_icon.dart';

class WeatherBaseInfo extends StatelessWidget {

  final WeatherDetails details;
  final bool isTodaysWeather;


  WeatherBaseInfo(this.details,  this.isTodaysWeather);

  @override
  Widget build(BuildContext context) {

    final TextStyle temperatureStyle = isTodaysWeather ?
    Theme.of(context)
        .textTheme
        .headline2
        .apply(color: Colors.white) :
    Theme.of(context)
        .textTheme
        .bodyText1
        .apply(color: Colors.blueAccent);


    final TextStyle weatherStateStyle = isTodaysWeather ?
    Theme.of(context)
        .textTheme
        .headline6
        .apply(color: Colors.white) :
    Theme.of(context)
        .textTheme
        .bodyText2
        .apply(color: Colors.blueAccent);


    return
      Container(
          child:
          Column(
              children : <Widget>[
                WeatherIcon(this.details, this.isTodaysWeather),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "${this.details.temperature.floor()}℃",
                  style: temperatureStyle,
                ),
                Text(
                  "${this.details.weatherState}",
                  style: weatherStateStyle,
                ),
              ]
          )
      );
  }

}

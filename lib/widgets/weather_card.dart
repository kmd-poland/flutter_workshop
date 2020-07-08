import 'package:flutter/material.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:flutterworkshops/widgets/weather_base_info.dart';
import 'package:flutterworkshops/widgets/weather_icon.dart';
import 'package:flutterworkshops/widgets/weather_row.dart';

class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WeatherCard extends StatefulWidget {
  final WeatherDetails details;

  WeatherCard(this.details);

  @override
  _WeatherCardState createState() => _WeatherCardState(details);
}

class _WeatherCardState extends State<WeatherCard>
{
  WeatherDetails details;

  bool _showFurtherForecast = false;

  _WeatherCardState(WeatherDetails details) {
    this.details = details;
  }

  void _handleTap(){
    setState(() {
      _showFurtherForecast = !_showFurtherForecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      InkWell(
      onTap: _handleTap,
      child :
        Stack(children: <Widget>[
          Positioned.fill(
            bottom: 200,
            child: ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [Colors.lightBlue, Colors.blue])),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                WeatherBaseInfo(details, true),
                Spacer(),
                _showFurtherForecast ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    WeatherBaseInfo(details.nextThreeDays.first, false),
                    Spacer(),
                    WeatherBaseInfo(details.nextThreeDays.elementAt(1), false),
                    Spacer(),
                    WeatherBaseInfo(details.nextThreeDays.last, false),
                  ],
                )
                    :
                Column(
                    children: <Widget>[
                      WeatherRow("Pressure", "${details.pressure.toStringAsFixed(2)} hPa"),
                      SizedBox(height: 5),
                      WeatherRow("Humidity", "${details.humidity.floor()}%"),
                      SizedBox(height: 5),
                      WeatherRow("Wind speed", "${details.windSpeed.floor()} km/h"),
                      SizedBox(height: 5),
                      WeatherRow("Wind direction", "${details.windDirectionDescription}"),
                    ])
              ]),

          )],
          ),
        )
      );
  }
}

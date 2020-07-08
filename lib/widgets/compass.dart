import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Compass extends StatelessWidget {
  final double windAzimuth;
  final double userAzimuth;

  Compass(this.windAzimuth, this.userAzimuth);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("assets/compass.png"),
        Transform.scale(scale: 0.6, child: Transform.rotate(angle: windAzimuth * (pi/180.0), child: Center(child: Image.asset("assets/wind_arrow.png",)))),
        Transform.rotate(angle: userAzimuth * (pi/180.0), child: Center(child: Image.asset("assets/arrow.png",))),
      ],
    );
  }
}
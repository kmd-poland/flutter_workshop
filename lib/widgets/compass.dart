
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Compass extends StatelessWidget {
  final double windAzimuth;
  final double userAzimuth;

  Compass(this.windAzimuth, this.userAzimuth);

  @override
  Widget build(BuildContext context) {
    return Container(child: CustomPaint(painter: CompassPainter(windAzimuth, userAzimuth), ));
  }
}
class CompassPainter extends CustomPainter {

  final double windAzimuth;
  final double userAzimuth;

  CompassPainter(this.windAzimuth, this.userAzimuth);

  @override
  void paint(Canvas canvas, Size size) {
    
    var fillPaint = Paint()
      ..color = Colors.black12.withAlpha(200)
      ..style = PaintingStyle.fill;

    var strokePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;


    var windPaint = Paint()
    ..color = Colors.purple
    ..strokeWidth = 5.0;

    var userPaint = Paint()
      ..color = Colors.amberAccent
      ..strokeWidth = 5.0;

    var center = Offset(0,0);
    canvas.drawCircle(Offset(0.0, 0.0), size.width,fillPaint);
    canvas.drawCircle(Offset(0.0, 0.0), size.width, strokePaint);


    canvas.drawLine(center, Offset.fromDirection((windAzimuth-90)*(pi/180.0), size.width - 10), windPaint);
    canvas.drawLine(center, Offset.fromDirection((userAzimuth-90)*(pi/180.0), size.width - 10), userPaint);
   // canvas.drawLine(center, Offset(-size.width, size.height), strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

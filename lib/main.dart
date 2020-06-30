import 'package:flutter/material.dart';
import 'package:flutterworkshops/screens/choose_location_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatWeather app',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChooseLocationPage(title: 'Choose your city'),
    );
  }
}

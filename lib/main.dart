import 'package:flutter/material.dart';

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

class ChooseLocationPage extends StatefulWidget {
  ChooseLocationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text("IT'S ALIVE!!!", style: Theme.of(context).textTheme.headline3,))
    );
  }
}

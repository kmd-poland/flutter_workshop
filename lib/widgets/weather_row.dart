import 'package:flutter/material.dart';

class WeatherRow extends StatelessWidget {
  const WeatherRow(
    this.name,
    this.value, {
    Key key,
  }) : super(key: key);

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Expanded(
            child: Text(
          value,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.end,
        ))
      ],
    );
  }
}

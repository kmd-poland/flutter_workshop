import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/blocs/weather_page_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/widgets/weather_card.dart';

class WeatherPage extends StatefulWidget {
  static const String routeName = "/weather";

  WeatherPage(this.location, {Key key}) : super(key: key);

  final Location location;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WeatherPageBloc();
    _bloc.add(InitWeatherEvent(widget.location.woeid));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is WeatherDataLoadedState) {
              return Positioned.fill(child: WeatherCard(state.weatherDetails));
            } else if (state is WeatherDataErrorState) {
              return Positioned.fill(
                  child: Container(
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                        "We couldn't fetch weather details. Please check your network connection",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ))));
            } else
              return Positioned.fill(
                  child: Container(
                      color: Colors.white,
                      child: Center(child: CircularProgressIndicator())));
          },
        ),
        Container(
          height: 80,
          child: AppBar(
            elevation: 0,
            title: Text(widget.location.title),
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/blocs/weather_page_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:flutterworkshops/widgets/wather_card.dart';
import 'package:flutterworkshops/widgets/wather_icon.dart';

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
    return Stack(children: <Widget>[
          BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if(state is WeatherDataLoadedState) {
                return Positioned.fill(child: WeatherCard(state.weatherDetails));
              }
              else
                return Center(child: CircularProgressIndicator());
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

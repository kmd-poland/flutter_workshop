import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/blocs/compass_bloc.dart';
import 'package:flutterworkshops/blocs/weather_page_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/widgets/compass.dart';
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
  CompassBloc _compassBloc;

  @override
  void initState() {
    super.initState();
    _bloc = WeatherPageBloc();
    _compassBloc = CompassBloc();
    _compassBloc.add(InitCompass());
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
              return Stack(children: [
                Positioned.fill(child: WeatherCard(state.weatherDetails)),

                BlocBuilder(
                  bloc: _compassBloc,
                  builder: (context, compassState){
                    if (compassState is CompassDataState){
                      return  Positioned(width: 150, height: 150, right: 20, bottom: 180,  child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              border: Border.all(width: 5, color: Colors.blue, style: BorderStyle.solid)
                          ),
                          child: Compass(state.weatherDetails.windDirection, compassState.azimuth)),);
                    } else {
                      return Container();
                    }
                  }
                )

              ]);
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

  @override
  void dispose() {
    super.dispose();
    _compassBloc.dispose();
  }
}

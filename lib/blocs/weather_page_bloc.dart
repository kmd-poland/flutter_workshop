import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class WeatherPageEvent {}
abstract class WeatherPageState {}


class WeatherPageBloc extends Bloc<WeatherPageEvent, WeatherPageState> {
  @override
  // TODO: implement initialState
  WeatherPageState get initialState => throw UnimplementedError();

  @override
  Stream<WeatherPageState> mapEventToState(WeatherPageEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class WeatherPageEvent {}

abstract class WeatherPageState {}

class InitWeatherEvent extends WeatherPageEvent {
  final int locationId;

  InitWeatherEvent(this.locationId);
}

class LoadingWeatherDataState extends WeatherPageState {}

class WeatherDataLoadedState extends WeatherPageState {
  final WeatherDetails weatherDetails;

  WeatherDataLoadedState(this.weatherDetails);
}

class WeatherDataErrorState extends WeatherPageState {}

class WeatherPageBloc extends Bloc<WeatherPageEvent, WeatherPageState> {
  @override
  WeatherPageState get initialState => LoadingWeatherDataState();

  @override
  Stream<WeatherPageState> mapEventToState(WeatherPageEvent event) async* {
    if (event is InitWeatherEvent) {
      try {
        var details = await WeatherService.get().getWeather(event.locationId);
        yield WeatherDataLoadedState(details);
      } catch (e) {
        yield WeatherDataErrorState();
      }
    }
  }
}

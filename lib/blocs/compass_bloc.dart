import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class CompassEvent {}

abstract class CompassState {}

class InitCompass extends CompassEvent {}

class CompassReading extends CompassEvent{
  final double azimuth;
  CompassReading(this.azimuth);
}

class NoCompassDataState extends CompassState{}

class CompassDataState extends CompassState {
  final double azimuth;

  CompassDataState(this.azimuth);
}


class WeatherPageBloc extends Bloc<CompassEvent, CompassState> {
  @override
  CompassState get initialState => NoCompassDataState();

  WeatherPageBloc(){
    //TODO: you should register a handler for native events here and push CompassReading event here
  }


  @override
  Stream<CompassState> mapEventToState(CompassEvent event) async* {
    if (event is InitCompass) {
      //TODO: you should call native here to start compass readings
    }
  }

  void dispose(){
    //TODO: you should call native here to stop compass readings
  }
}

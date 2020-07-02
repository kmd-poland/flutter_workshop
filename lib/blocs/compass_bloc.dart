import 'package:flutter/services.dart';
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


class CompassBloc extends Bloc<CompassEvent, CompassState> {
  static const platform = const MethodChannel('com.example.flutterworkshops/compass');

  @override
  CompassState get initialState => NoCompassDataState();

  CompassBloc(){
    platform.setMethodCallHandler((call) async {
      if (call.method == "gotCompassData"){
        this.add(CompassReading(call.arguments));
      }
    });
  }


  @override
  Stream<CompassState> mapEventToState(CompassEvent event) async* {
    if (event is InitCompass) {
      platform.invokeMethod("startCompass");
    } else if (event is CompassReading){
      yield CompassDataState(event.azimuth);
    }
  }

  void dispose(){
    platform.invokeMethod("stopCompass");
  }
}

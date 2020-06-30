import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/models/location.dart';
import 'package:flutterworkshops/services/weather_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class ChooseLocationEvent {}
abstract class ChooseLocationState {}

class ChooseLocationListLoadedState extends ChooseLocationState{
  final List<Location> locations;

  ChooseLocationListLoadedState(this.locations);
}

class LocationSearchEvent extends ChooseLocationEvent {
  final String text;

  LocationSearchEvent(this.text);
}

class ChooseLocationBloc extends Bloc<ChooseLocationEvent, ChooseLocationState> {
  @override
  ChooseLocationState get initialState => ChooseLocationListLoadedState([]);

  //TODO uncomment and check what changes
//  @override
//  Stream<Transition<ChooseLocationEvent, ChooseLocationState>> transformEvents(Stream<ChooseLocationEvent> events, transitionFn) {
//    return events
//        .debounceTime(const Duration(milliseconds: 300))
//        .switchMap(transitionFn);
//  }

  @override
  Stream<ChooseLocationState> mapEventToState(ChooseLocationEvent event) async* {
    if(event is LocationSearchEvent) {
      var locations = await WeatherService.get().getLocation(event.text);
      yield ChooseLocationListLoadedState(locations);
    }
  }
}
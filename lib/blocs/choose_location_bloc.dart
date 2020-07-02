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

class ChooseLocationErrorState extends ChooseLocationState{}


class LocationSearchEvent extends ChooseLocationEvent {
  final String text;

  LocationSearchEvent(this.text);
}

class ChooseLocationBloc extends Bloc<ChooseLocationEvent, ChooseLocationState> {
  @override
  ChooseLocationState get initialState => ChooseLocationListLoadedState([]);

  @override
  Stream<Transition<ChooseLocationEvent, ChooseLocationState>> transformEvents(Stream<ChooseLocationEvent> events, transitionFn) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<ChooseLocationState> mapEventToState(ChooseLocationEvent event) async* {
    if(event is LocationSearchEvent) {
      if (event.text.length < 2){
        yield ChooseLocationListLoadedState([]);
        return;
      }

      try {
        var locations = await WeatherService.get().getLocation(event.text);
        yield ChooseLocationListLoadedState(locations);
      } catch (e){
        yield ChooseLocationErrorState();
      }
    }
  }
}
import 'package:flutterworkshops/models/consolidated_weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_prediction.g.dart';

@JsonSerializable()
class WeatherPrediction {
  @JsonKey(name: "consolidated_weather")
  final List<ConsolidatedWeather> weatherPrediction;

  WeatherPrediction(this.weatherPrediction);

  factory WeatherPrediction.fromJson(Map<String, dynamic> json) => _$WeatherPredictionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherPredictionToJson(this);
}
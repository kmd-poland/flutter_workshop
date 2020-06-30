import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';

@JsonSerializable()
class ConsolidatedWeather {
  @JsonKey(name: "weather_state_name")
  final String weatherStateName;

  @JsonKey(name: "min_temp")
  final double minTemp;

  @JsonKey(name: "max_temp")
  final double maxTemp;

  @JsonKey(name: "the_temp")
  final double theTemp;

  @JsonKey(name: "wind_speed")
  final double windSpeed;

  @JsonKey(name: "air_pressure")
  final String airPressure;

  @JsonKey(name: "humidity")
  final String humidity;

  ConsolidatedWeather(this.weatherStateName, this.minTemp, this.maxTemp,
      this.theTemp, this.windSpeed, this.airPressure, this.humidity);

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => _$ConsolidatedWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}
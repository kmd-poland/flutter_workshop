import 'package:json_annotation/json_annotation.dart';

part 'consolidated_weather.g.dart';

@JsonSerializable()
class ConsolidatedWeather {
  @JsonKey(name: "weather_state_name")
  final String weatherStateName;

  @JsonKey(name: "weather_state_abbr")
  final String weatherStateAbbr;

  @JsonKey(name: "min_temp")
  final double minTemp;

  @JsonKey(name: "max_temp")
  final double maxTemp;

  @JsonKey(name: "the_temp")
  final double theTemp;

  @JsonKey(name: "wind_speed")
  final double windSpeed;

  @JsonKey(name: "wind_direction")
  final double windDirection;

  @JsonKey(name: "wind_direction_compass")
  final String windDirectionCompass;

  @JsonKey(name: "air_pressure")
  final double airPressure;

  @JsonKey(name: "humidity")
  final double humidity;

  ConsolidatedWeather(this.weatherStateName, this.weatherStateAbbr, this.minTemp, this.maxTemp,
      this.theTemp, this.windSpeed, this.windDirection, this.windDirectionCompass, this.airPressure, this.humidity);

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) => _$ConsolidatedWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$ConsolidatedWeatherToJson(this);
}
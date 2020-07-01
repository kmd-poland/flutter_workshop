// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidated_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    json['weather_state_name'] as String,
    json['weather_state_abbr'] as String,
    (json['min_temp'] as num)?.toDouble(),
    (json['max_temp'] as num)?.toDouble(),
    (json['the_temp'] as num)?.toDouble(),
    (json['wind_speed'] as num)?.toDouble(),
    (json['wind_direction'] as num)?.toDouble(),
    json['wind_direction_compass'] as String,
    (json['air_pressure'] as num)?.toDouble(),
    (json['humidity'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'wind_direction_compass': instance.windDirectionCompass,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
    };

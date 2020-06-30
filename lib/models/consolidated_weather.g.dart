// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consolidated_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsolidatedWeather _$ConsolidatedWeatherFromJson(Map<String, dynamic> json) {
  return ConsolidatedWeather(
    json['weather_state_name'] as String,
    (json['min_temp'] as num)?.toDouble(),
    (json['max_temp'] as num)?.toDouble(),
    (json['the_temp'] as num)?.toDouble(),
    (json['wind_speed'] as num)?.toDouble(),
    json['air_pressure'] as String,
    json['humidity'] as String,
  );
}

Map<String, dynamic> _$ConsolidatedWeatherToJson(
        ConsolidatedWeather instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weatherStateName,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
    };

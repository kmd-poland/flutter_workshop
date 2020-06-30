// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherPrediction _$WeatherPredictionFromJson(Map<String, dynamic> json) {
  return WeatherPrediction(
    (json['consolidated_weather'] as List)
        ?.map((e) => e == null
            ? null
            : ConsolidatedWeather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherPredictionToJson(WeatherPrediction instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.weatherPrediction,
    };

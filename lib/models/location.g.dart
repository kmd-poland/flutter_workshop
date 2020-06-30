// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    json['title'] as String,
    json['woeid'] as int,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'title': instance.title,
      'woeid': instance.woeid,
    };

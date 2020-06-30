import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

//This uses json generator from https://pub.dev/packages/json_serializable
@JsonSerializable()
class Location {
  final String title;
  final int woeid;

  Location(this.title, this.woeid);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
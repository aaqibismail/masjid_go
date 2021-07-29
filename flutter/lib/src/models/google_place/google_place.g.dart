// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GooglePlace _$_$_GooglePlaceFromJson(Map<String, dynamic> json) {
  return _$_GooglePlace(
    fullText: json['fullText'] as String,
    primaryText: json['primaryText'] as String,
    secondaryText: json['secondaryText'] as String,
    placeId: json['placeId'] as String,
    distance: json['distance'] as int?,
  );
}

Map<String, dynamic> _$_$_GooglePlaceToJson(_$_GooglePlace instance) =>
    <String, dynamic>{
      'fullText': instance.fullText,
      'primaryText': instance.primaryText,
      'secondaryText': instance.secondaryText,
      'placeId': instance.placeId,
      'distance': instance.distance,
    };

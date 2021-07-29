import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_place.freezed.dart';
part 'google_place.g.dart';

/// Model for data retrieved from client-side Places API 
@freezed
class GooglePlace with _$GooglePlace {
  const factory GooglePlace({
    @_Converter() required String fullText,
    required String primaryText,
    required String secondaryText,
    required String placeId,
    int? distance,
  }) = _GooglePlace;

  factory GooglePlace.fromJson(Map<String, dynamic> json) =>
      _$GooglePlaceFromJson(json);
}

class _Converter implements JsonConverter<GooglePlace, Map<String, dynamic>> {
  const _Converter();

  @override
  GooglePlace fromJson(Map<String, dynamic> json) {
    return GooglePlace(
      fullText: json["description"] as String,
      primaryText: json["structured_formatting"]["main_text"] as String,
      secondaryText: json["structured_formatting"]["secondary_text"] as String,
      placeId: json["place_id"] as String,
      distance: json["distance_meters"] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson(GooglePlace data) => data.toJson();
}

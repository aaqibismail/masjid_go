import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_place.freezed.dart';

@freezed
class GooglePlace with _$GooglePlace {
  const factory GooglePlace({
    required String fullText,
    required String primaryText,
    required String secondaryText,
    required String placeId,
    int? distance,
  }) = _GooglePlace;
}

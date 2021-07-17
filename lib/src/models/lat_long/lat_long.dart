import 'package:flutter/foundation.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as google_places;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

part 'lat_long.freezed.dart';
part 'lat_long.g.dart';

@freezed
class LatLong with _$LatLong {
  @HiveType(typeId: 0, adapterName: 'LatLongAdapter')
  const factory LatLong({
    @HiveField(0) required double lat,
    @HiveField(1) required double lng,
  }) = _LatLong;

  @override
  String toString() => '$lat,$lng';
}

extension LatLngX on LatLong {
  LatLng toLatLng() => LatLng(lat, lng);
  google_places.LatLng toPlacesLatLng() =>
      google_places.LatLng(lat: lat, lng: lng);
  PointLatLng toPointLatLng() => PointLatLng(lat, lng);
}

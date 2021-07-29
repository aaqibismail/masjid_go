import 'package:flutter/widgets.dart' show debugPrint;
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

  const LatLong._();

  @override
  String toString() => '$lat,$lng';

  bool _isValid() => lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;

  static LatLong? fromString(String? latlng) {
    if (latlng == null) return null;

    try {
      final split = latlng.split(',');
      final lat = double.parse(split[0]);
      final lng = double.parse(split[1]);

      final latlong = LatLong(lat: lat, lng: lng);
      if (latlong._isValid()) return latlong;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

extension LatLngX on LatLong {
  LatLng toLatLng() => LatLng(lat, lng);
  google_places.LatLng toPlacesLatLng() =>
      google_places.LatLng(lat: lat, lng: lng);
  PointLatLng toPointLatLng() => PointLatLng(lat, lng);
}

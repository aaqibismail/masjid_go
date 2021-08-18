import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as google_places;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';

extension PointLatLngX on PointLatLng {
  LatLng toLatLng() => LatLng(latitude, longitude);
  String toLatLngString() => '$latitude,$longitude';
  LatLong toLatLong() => LatLong(lat: latitude, lng: longitude);
}

extension BoundX on Bounds {
  LatLngBounds toLatLngBounds() {
    return LatLngBounds(
      southwest: southwest.toLatLng(),
      northeast: northeast.toLatLng(),
    );
  }
}

extension StringX on String {
  String get capitalize {
    if (isEmpty) {
      return this;
    } else if (length == 1) {
      return toUpperCase();
    } else {
      return substring(0, 1).toUpperCase() + substring(1);
    }
  }
}

extension LatLngX on google_places.LatLng {
  LatLong toLatLong() {
    return LatLong(lat: lat, lng: lng);
  }
}

extension AutocompletePredictionX on google_places.AutocompletePrediction {
  GooglePlace toGooglePlace() {
    return GooglePlace(
      fullText: fullText,
      primaryText: primaryText,
      secondaryText: secondaryText,
      placeId: placeId,
      distance: distanceMeters,
    );
  }
}

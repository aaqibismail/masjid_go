import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

extension LatLngX on LatLng {
  Location toLocation() => Location(lat: latitude, lng: longitude);
}

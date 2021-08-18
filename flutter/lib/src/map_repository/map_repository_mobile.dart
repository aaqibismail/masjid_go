import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/map_repository/map_repository_common.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/models/masjid/masjid.dart';

MapRepository getMapRepository(MapRepositoryCommon common) =>
    MapRepositoryMobile(common);

class MapRepositoryMobile implements MapRepository {
  final MapRepositoryCommon common;
  MapRepositoryMobile(this.common);

  @override
  Uri buildMapsURL(
    LatLong origin,
    String originPlaceId,
    LatLong destination,
    String destinationPlaceId, {
    List<LatLong> waypoints = const [],
    List<String> waypoint_place_ids = const [],
  }) =>
      common.buildMapsURL(
        origin,
        originPlaceId,
        destination,
        destinationPlaceId,
      );

  @override
  Future<PolylineResult?> findRoutes(
    String destination, {
    LatLong? origin,
    String? originPlaceId,
  }) =>
      common.findRoutes(
        destination,
        origin: origin,
        originPlaceId: originPlaceId,
      );

  @override
  Future<String?> getAddressFromLoc(LatLong loc) async {
    final placemarks = await placemarkFromCoordinates(loc.lat, loc.lng);
    for (final placemark in placemarks) {
      if (placemark.name != null) return placemark.name;
      if (placemark.street != null) return placemark.street;
    }
  }

  @override
  Future<LatLong?> getLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    var permissionStatus = await Geolocator.checkPermission();
    if (permissionStatus == LocationPermission.denied) {
      permissionStatus = await Geolocator.requestPermission();
    }

    if (permissionStatus == LocationPermission.denied ||
        permissionStatus == LocationPermission.deniedForever) return null;

    final loc = await Geolocator.getCurrentPosition();
    return LatLong(lat: loc.latitude, lng: loc.longitude);
  }

  @override
  Future<LatLong?> getLocFromPlaceId(String placeId) =>
      common.getLocFromPlaceId(placeId);

  @override
  Future<List<Masjid>> getMasjids(List<LatLong> points) =>
      common.getMasjids(points);

  @override
  Future<List<GooglePlace>> searchPlaces(String query, {LatLong? loc}) =>
      common.searchPlaces(query, loc: loc);
}

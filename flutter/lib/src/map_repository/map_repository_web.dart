import 'dart:convert' show json;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/map_repository/map_repository_common.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/models/masjid/masjid.dart';

MapRepository getMapRepository(MapRepositoryCommon common) =>
    MapRepositoryWeb(common);

class MapRepositoryWeb implements MapRepository {
  final MapRepositoryCommon common;
  MapRepositoryWeb(this.common);

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
    final params = {
      'lat': loc.lat,
      'lng': loc.lng,
    };

    const endpoint = "/geocode/";
    final uri =
        Uri.parse('${common.url}$endpoint').replace(queryParameters: params);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      return parsedJson["display_name"] as String?;
    }
  }

  @override
  Future<LatLong?> getLocation() async {
    var serviceEnabled = await Location.instance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Location.instance.requestService();
      if (!serviceEnabled) return null;
    }

    var permissionGranted = await Location.instance.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Location.instance.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return null;
    }

    final loc = await Location.instance.getLocation();
    if (loc.latitude != null && loc.longitude != null) {
      return LatLong(lat: loc.latitude!, lng: loc.longitude!);
    }
  }

  @override
  Future<LatLong?> getLocFromPlaceId(String placeId) =>
      common.getLocFromPlaceId(placeId);

  @override
  Future<List<Masjid>> getMasjids(List<LatLong> points) =>
      common.getMasjids(points);

  @override
  Future<List<GooglePlace>> searchPlaces(
    String query, {
    LatLong? loc,
    int? radius,
  }) =>
      common.searchPlaces(query, loc: loc);
}

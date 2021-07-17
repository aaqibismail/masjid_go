import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_geocoding/google_geocoding.dart' hide Location;
import 'package:location/location.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/map_repository/map_repository_common.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/models/masjid/masjid.dart';

MapRepository getMapRepository() => MapRepositoryWeb(
      common: MapRepositoryCommon(PolylinePoints()),
      geocoding: GoogleGeocoding(dotenv.env["GOOGLE_MAPS_WEB"]!),
    );

class MapRepositoryWeb implements MapRepository {
  final MapRepositoryCommon common;
  final GoogleGeocoding geocoding;

  MapRepositoryWeb({
    required this.common,
    required this.geocoding,
  });

  @override
  Future<String?> addressFromLoc(LatLong loc) async {
    final results =
        await geocoding.geocoding.getReverse(LatLon(loc.lat, loc.lng));
    if (results?.results != null) {
      for (final result in results!.results!) {
        if (result.formattedAddress != null) return result.formattedAddress;
      }
    }
  }

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
  Future<PolylineResult?> findRoutes(String origin, String destination) =>
      common.findRoutes(
        origin,
        destination,
      );

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
  Future<LatLong?> getLocFromPlaceId(String placeId) async {}

  @override
  Future<List<Masjid>> getMasjids(Route route) => common.getMasjids(route);

  @override
  Future<String?> getPlaceIdFromLoc(LatLong loc) async {
    final results =
        await geocoding.geocoding.getReverse(LatLon(loc.lat, loc.lng));

    if (results?.results != null) {
      for (final result in results!.results!) {
        if (result.placeId != null) return result.placeId;
      }
    }
  }

  @override
  Future<List<GooglePlace>> searchPlaces(
    String query, {
    LatLong? loc,
  }) async {
    return [];
  }
}

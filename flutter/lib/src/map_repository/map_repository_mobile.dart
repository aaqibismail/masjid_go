import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/map_repository/map_repository_common.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/models/masjid/masjid.dart';
import 'package:masjid_go/src/object_extensions.dart';

MapRepository getMapRepository() => MapRepositoryMobile(
      common: MapRepositoryCommon(PolylinePoints()),
      places: FlutterGooglePlacesSdk(dotenv.env["GOOGLE_MAPS_ANDROID"]!),
    );

class MapRepositoryMobile implements MapRepository {
  final MapRepositoryCommon common;
  final FlutterGooglePlacesSdk places;

  MapRepositoryMobile({
    required this.common,
    required this.places,
  });

  @override
  Future<String?> addressFromLoc(LatLong loc) async {
    final placemarks = await placemarkFromCoordinates(loc.lat, loc.lng);
    for (final placemark in placemarks) {
      if (placemark.name != null) return placemark.name;
      if (placemark.street != null) return placemark.street;
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
  Future<LatLong?> getLocFromPlaceId(String placeId) async {
    final place = await places.fetchPlace(
      placeId,
      fields: [PlaceField.Location],
    );
    return place.place?.latLng?.toLatLong();
  }

  @override
  Future<List<Masjid>> getMasjids(Route route) => common.getMasjids(route);

  @override
  Future<String?> getPlaceIdFromLoc(LatLong loc) async {}

  @override
  Future<List<GooglePlace>> searchPlaces(String query, {LatLong? loc}) async {
    final result = await places.findAutocompletePredictions(
      query,
      origin: loc?.toPlacesLatLng(),
    );

    return result.predictions
        .map((place) => place.toGooglePlace())
        .toList(growable: false);
  }
}

import 'dart:convert' show json;

import 'package:flutter/widgets.dart' show debugPrint;
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/models/masjid/masjid.dart';
import 'package:masjid_go/src/object_extensions.dart';

class MapRepositoryCommon {
  final FlutterGooglePlacesSdk places;
  final PolylinePoints polylinePoints;
  final String url;

  MapRepositoryCommon(
    this.places,
    this.polylinePoints,
    this.url,
  );

  Uri buildMapsURL(
    LatLong origin,
    String originPlaceId,
    LatLong destination,
    String destinationPlaceId, {
    List<LatLong> waypoints = const [],
    List<String> waypoint_place_ids = const [],
  }) {
    final params = {
      'api': '1',
      'origin': origin.toString(),
      'origin_place_id': originPlaceId,
      'destination': destination.toString(),
      'destination_place_id': destinationPlaceId,
    };

    if (waypoints.isNotEmpty && waypoints.length == waypoint_place_ids.length) {
      final points = StringBuffer();
      final ids = StringBuffer();
      for (var i = 0; i < waypoints.length; ++i) {
        points.write(Uri.encodeFull(waypoints[i].toString()));
        ids.write(Uri.encodeFull(waypoint_place_ids[i].toString()));
        if (i != waypoints.length - 1) {
          points.write(Uri.encodeFull('|'));
          ids.write(Uri.encodeFull('|'));
        }
      }

      params.addAll({
        'waypoints': points.toString(),
        'waypoint_place_ids': ids.toString(),
      });
    }

    return Uri.https("www.google.com", "/maps/dir/", params);
  }

  Future<PolylineResult?> findRoutes(
    String destination, {
    LatLong? origin,
    String? originPlaceId,
  }) async {
    assert(origin != null || originPlaceId != null);
    try {
      final params = {
        'origin':
            origin != null ? origin.toString() : 'place_id:$originPlaceId',
        'destination': 'place_id:$destination',
      };

      final uri = Uri.parse(url).replace(queryParameters: params);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        return polylinePoints.parseJson(parsedJson);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<LatLong?> getLocFromPlaceId(String placeId) async {
    final place = await places.fetchPlace(
      placeId,
      fields: [PlaceField.Location],
    );
    return place.place?.latLng?.toLatLong();
  }

  Future<List<Masjid>> getMasjids(Route route) async {
    final uri = Uri.parse(url);
    final locs = route.points.map((e) => e.toLatLngString()).toList();
    final response = await http.post(uri, body: {"locs": locs});
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
    }
    return const [];
  }

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

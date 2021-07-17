import 'dart:convert' show json;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/models/masjid/masjid.dart';

class MapRepositoryCommon {
  final PolylinePoints polylinePoints;
  MapRepositoryCommon(this.polylinePoints);

  Future<List<Masjid>> getMasjids(Route route) async {
    return const [];
  }

  Future<PolylineResult?> findRoutes(String origin, String destination) async {
    const url = "us-central1-masjidenroute.cloudfunctions.net";
    const endpoint = "/directions/";
    final params = {
      'origin': origin,
      'destination': destination,
    };
    final uri = Uri.https(url, endpoint, params);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        return polylinePoints.parseJson(parsedJson);
      }
    } catch (e) {
      print(e);
    }
  }

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

    return Uri.https("https://www.google.com", "/maps/dir/", params);
  }
}

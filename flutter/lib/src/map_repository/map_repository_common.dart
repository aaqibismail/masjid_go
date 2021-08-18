import 'dart:convert' show json;
import 'dart:math';

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
        ids.write(Uri.encodeFull(waypoint_place_ids[i]));
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

      const endpoint = '/directions/';
      final uri = Uri.parse('$url$endpoint').replace(queryParameters: params);

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

  Future<List<Masjid>> getMasjids(List<LatLong> points) async {
    final searchIndices = <int>[];
    searchIndices.add(0);

    int? index;
    do {
      index = _pointInRange(points, index ?? 0, 80, 160);
      if (index != null) searchIndices.add(index);
      // Only search maximum 20 times or around 1000 - 2000 miles
      if (searchIndices.length == 19) {
        searchIndices.add(points.length - 1);
        break;
      }
    } while (index != null);

    final futures = searchIndices.map(
      (index) => places.findAutocompletePredictions(
        'mosques',
        origin: LatLng(lat: points[index].lat, lng: points[index].lng),
      ),
    );
    final predictions = await Future.wait(futures);
    final placeIds = <String>{};

    for (final result in predictions) {
      for (final prediction in result.predictions) {
        placeIds.add('place_id:${prediction.placeId}');
      }
    }

    final body = {
      "origin": points.first.toString(),
      "masjids": placeIds.toList(growable: false),
    };

    const endpoint = '/masjids/';
    final uri = Uri.parse('$url$endpoint');
    final response = await http.post(uri, body: body);
    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
    }
    return const [];
  }

  // Returns index of element in range of min and max km
  int? _pointInRange(List<LatLong> points, int startIndex, int min, int max) {
    // Doing binary search
    int low = startIndex;
    int high = points.length - 1;

    while (low < high) {
      final mid = low + (high - low) ~/ 2;

      final distance =
          _getDistanceFromLatLonInKm(points[startIndex], points[mid]);

      if (distance < min) {
        low = mid + 1;
      } else if (distance > max) {
        high = mid - 1;
      } else {
        return mid;
      }
    }
  }

  double _getDistanceFromLatLonInKm(LatLong loc1, LatLong loc2) {
    const R = 6371; // Radius of the earth in km
    final dLat = _deg2rad(loc2.lat - loc1.lat); // _deg2rad below
    final dLon = _deg2rad(loc2.lng - loc1.lng);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(loc1.lat)) *
            cos(_deg2rad(loc2.lat)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final d = R * c; // Distance in km
    return d;
  }

  double _deg2rad(double deg) {
    return deg * (pi / 180);
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

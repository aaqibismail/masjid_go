import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';

part 'routes_notifier.freezed.dart';
part 'routes_state.dart';

class RoutesNotifier extends StateNotifier<AsyncValue<RoutesState>> {
  final MapRepository mapRepository;
  RoutesNotifier({required this.mapRepository}) : super(const AsyncLoading());

  void newPage(int page) {
    state.whenData((value) {
      state = AsyncData(value.copyWith.call(
        page: page,
        currPolyline: {value.polylines[page]},
      ));
    });
  }

  Future<void> findRoute(String origin, String destination) async {
    final result = await Future.wait([
      mapRepository.findRoutes(origin, destination),
      mapRepository.getLocFromPlaceId(origin),
      mapRepository.getLocFromPlaceId(destination),
    ]);

    final polylineResult = result[0] as PolylineResult?;
    final originLoc = result[1] as LatLong?;
    final destinationLoc = result[2] as LatLong?;

    if (result.any((_) => _ == null) ||
        polylineResult!.errorMessage.isNotEmpty) {
      state = AsyncError("Error Loading");
    } else {
      final converted = polylineResult.routes.map((route) {
        return route.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList(growable: false);
      }).toList(growable: false);

      final polylines = <Polyline>[];

      for (var i = 0; i < converted.length; ++i) {
        polylines.add(Polyline(
          polylineId: PolylineId('$i'),
          color: Colors.blue,
          points: converted[i],
          zIndex: 10,
        ));
      }
      state = AsyncData(RoutesState(
        currPolyline: {polylines[0]},
        markers: {
          Marker(
            markerId: const MarkerId("destination"),
            position: destinationLoc!.toLatLng(),
            infoWindow: const InfoWindow(
              title: 'Destination',
              // snippet: _destinationAddress,
            ),
            // icon: BitmapDescriptor.defaultMarker,
          ),
        },
        origin: originLoc!.toLatLng(),
        polylines: polylines,
        polylineResult: polylineResult,
      ));
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_enroute/core/object_extensions.dart';
import 'package:masjid_enroute/repository/settings_database.dart';

part 'home_state.dart';
part 'home_notifier.freezed.dart';

class HomeNotifier extends StateNotifier<AsyncValue<HomeState>> {
  final SettingsDatabase? settingsDatabase;
  final _googlePlace = GooglePlace(
    FlutterConfig.get('GOOGLE_MAPS_ANDROID') as String,
  );

  HomeNotifier({this.settingsDatabase}) : super(const AsyncLoading());

  Future<void> init() async {
    if (settingsDatabase == null) return;

    final startLoc = settingsDatabase!.getLocation();
    final startName = await _locToString(startLoc);
    final searches = await settingsDatabase!.getSearches();

    state = AsyncData(HomeState(
      startLoc: startLoc,
      startName: startName,
      recentSearches: searches,
    ));
  }

  Future<String?> _locToString(LatLng? loc) async {
    if (loc != null) {
      final placemarks = await placemarkFromCoordinates(
        loc.latitude,
        loc.longitude,
      );
      for (final placemark in placemarks) {
        if (placemark.name != null) return placemark.name;
        if (placemark.street != null) return placemark.street;
      }
    }
  }

  void _searchForPlaces(String? query) {
    if (query == null || query.isEmpty) return;

    state.whenData((value) async {
      final result = await _googlePlace.search.getTextSearch(
        query,
        // location: value.startLoc?.toLocation(),
      );

      state = AsyncData(value.copyWith(searchResults: result?.results ?? []));
      print(result?.results);
      // if (result?.results != null) {
      //   print(result!.results);
      // }
    });
  }

  void update({
    bool? isSearching,
    LatLng? startLoc,
    LatLng? destinationLoc,
    String? startName,
    String? destinationName,
    String? search,
  }) {
    if (settingsDatabase == null) return;

    state.whenData((value) async {
      state = AsyncData(value.copyWith(
        isSearching: isSearching ?? value.isSearching,
        startLoc: startLoc ?? value.startLoc,
        destinationLoc: destinationLoc ?? value.destinationLoc,
        startName: startName ?? value.startName,
        destinationName: destinationName ?? value.destinationName,
        recentSearches: search != null
            ? [...value.recentSearches, search]
            : value.recentSearches,
      ));
      
      _searchForPlaces(startName);
      _searchForPlaces(destinationName);

      if (startLoc != null) {
        settingsDatabase!.newLocation(startLoc);
      } else if (search != null) {
        settingsDatabase!.newSearch(search);
      }
    });
  }
}

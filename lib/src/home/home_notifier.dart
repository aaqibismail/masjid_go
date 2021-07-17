import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/settings/settings_database.dart';

part 'home_notifier.freezed.dart';
part 'home_state.dart';

class HomeNotifier extends StateNotifier<AsyncValue<HomeState>> {
  final MapRepository mapRepository;
  final SettingsDatabase? settingsDatabase;

  HomeNotifier({
    required this.mapRepository,
    this.settingsDatabase,
  }) : super(const AsyncLoading());

  Future<void> init() async {
    if (settingsDatabase == null) return;

    final lastLoc = settingsDatabase!.getLocation();
    final startName = await _locToString(lastLoc);
    final searches = await settingsDatabase!.getSearches();

    state = AsyncData(HomeState(
      currentLoc: lastLoc,
      startName: startName,
      recentSearches: searches,
    ));

    return _initLocation();
  }

  Future<void> _initLocation() async {
    final currLoc = await mapRepository.getLocation();
    final startName = await _locToString(currLoc);
    update(currentLoc: currLoc, startName: startName);
  }

  Future<String?> _locToString(LatLong? loc) async {
    if (loc != null) {
      return mapRepository.addressFromLoc(loc);
    }
  }

  void update({
    bool? isSearching,
    LatLong? currentLoc,
    String? startName,
    String? startPlaceId,
    String? destinationName,
    String? destinationPlaceId,
    String? search,
  }) {
    if (settingsDatabase == null) return;

    state.whenData((value) {
      state = AsyncData(value.copyWith(
        currentLoc: currentLoc ?? value.currentLoc,
        startName: startName ?? value.startName,
        startPlaceId: startPlaceId ?? value.startPlaceId,
        destinationName: destinationName ?? value.destinationName,
        destinationPlaceId: destinationPlaceId ?? value.destinationPlaceId,
        recentSearches: search != null
            ? [...value.recentSearches, search]
            : value.recentSearches,
      ));

      if (currentLoc != null) {
        settingsDatabase!.newLocation(currentLoc);
      } else if (search != null) {
        settingsDatabase!.newSearch(search);
      }
    });
  }
}

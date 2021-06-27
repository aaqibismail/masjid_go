import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:masjid_enroute/core/db_constants.dart';
import 'package:masjid_enroute/state_notifiers/settings/settings_notifier.dart';

class SettingsDatabase {
  final LazyBox<String> searchBox;
  final Box settingsBox;

  SettingsDatabase({
    required this.searchBox,
    required this.settingsBox,
  });

  Future<void> newLocation(LatLng latlng) {
    return settingsBox.put(DbField.location, latlng);
  }

  LatLng? getLocation() {
    return settingsBox.get(DbField.location, defaultValue: null) as LatLng?;
  }

  Future<int> newSearch(String search) {
    return searchBox.add(search);
  }

  Future<List<String>> getSearches() async {
    final futures = <Future<String?>>[];
    for (int i = searchBox.length; i > 0; --i) {
      futures.add(searchBox.getAt(i-1));
    }
    final list = await Future.wait(futures);
    return list.where((element) => element != null).cast<String>().toList();
  }

  Future<void> newSettings(Settings settings) {
    return settingsBox.put(DbField.settings, settings);
  }

  Settings getSettings() {
    return settingsBox.get(
      DbField.settings,
      defaultValue: const Settings(),
    ) as Settings;
  }
}

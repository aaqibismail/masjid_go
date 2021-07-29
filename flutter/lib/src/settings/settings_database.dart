import 'package:hive/hive.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/settings/db_constants.dart';
import 'package:masjid_go/src/settings/settings_notifier.dart';

class SettingsDatabase {
  final LazyBox<String> searchBox;
  final Box settingsBox;

  SettingsDatabase({
    required this.searchBox,
    required this.settingsBox,
  });

  Future<void> newLocation(LatLong latlng) {
    return settingsBox.put(DbField.location, latlng);
  }

  LatLong? getLocation() {
    return settingsBox.get(DbField.location, defaultValue: null) as LatLong?;
  }

  Future<int> newSearch(String search) {
    return searchBox.add(search);
  }

  Future<List<String>> getSearches() async {
    final futures = <Future<String?>>[];
    for (int i = searchBox.length; i > 0; --i) {
      futures.add(searchBox.getAt(i - 1));
    }
    final list = await Future.wait(futures);
    return list.whereType<String>().toList();
  }

  Future<void> newSettings(GlobalSettings settings) {
    return settingsBox.put(DbField.settings, settings);
  }

  GlobalSettings getSettings() {
    return settingsBox.get(
      DbField.settings,
      defaultValue: const GlobalSettings(),
    ) as GlobalSettings;
  }
}

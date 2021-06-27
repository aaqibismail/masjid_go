import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_enroute/core/db_constants.dart';
import 'package:masjid_enroute/repository/settings_database.dart';
import 'package:masjid_enroute/state_notifiers/home/home_notifier.dart';
import 'package:masjid_enroute/state_notifiers/settings/settings_notifier.dart';

final settingsDatabaseProvider = FutureProvider<SettingsDatabase>((_) async {
  final searchBox = await Hive.openLazyBox<String>(DbBox.search);
  final settingsBox = await Hive.openBox(DbBox.settings);

  return SettingsDatabase(
    searchBox: searchBox,
    settingsBox: settingsBox,
  );
});

final settingsNotifierProvider =
    StateNotifierProvider<SettingsNotifier, AsyncValue<Settings>>((ref) {
  return ref.watch(settingsDatabaseProvider).maybeWhen(
        data: (_) => SettingsNotifier(settingsDatabase: _)..init(),
        orElse: () => SettingsNotifier(),
      );
});

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifier, AsyncValue<HomeState>>((ref) {
  return ref.watch(settingsDatabaseProvider).maybeWhen(
        data: (_) => HomeNotifier(settingsDatabase: _)..init(),
        orElse: () => HomeNotifier(),
      );
});

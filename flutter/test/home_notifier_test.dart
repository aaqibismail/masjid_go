import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/providers.dart';
import 'package:masjid_go/src/settings/settings_database.dart';
import 'package:mocktail/mocktail.dart';

class MockMapRepo extends Mock implements MapRepository {}

class MockSettingsDatabase extends Mock implements SettingsDatabase {}

void main() {
  final mapRepo = MockMapRepo();
  final settings = MockSettingsDatabase();
  late final ProviderContainer container;

  tearDown(() => container.dispose());

  test('No settings database', () {
    container = ProviderContainer(
      overrides: [
        mapRepoProvider.overrideWithProvider(Provider((_) => mapRepo)),
        settingsDatabaseProvider
            .overrideWithProvider(FutureProvider((_) async => settings)),
      ],
    );
    expect(
      container.read(homeNotifierProvider),
      const AsyncLoading(),
    );
  });
}

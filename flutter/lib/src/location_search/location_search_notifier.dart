import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';

class LocationSearchNotifer extends StateNotifier<List<GooglePlace>> {
  final MapRepository mapRepository;
  LocationSearchNotifer({required this.mapRepository}) : super(const []);

  Future<void> search(String query, {LatLong? loc}) async {
    if (query.isEmpty) return;

    final places = await mapRepository.searchPlaces(query, loc: loc);
    state = places;
  }
}

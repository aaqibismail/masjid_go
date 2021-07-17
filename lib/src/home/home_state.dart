part of 'home_notifier.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    LatLong? currentLoc,
    String? startName,
    String? startPlaceId,
    String? destinationName,
    String? destinationPlaceId,
    @Default(<String>[]) List<String> recentSearches,
  }) = _HomeState;
}

enum SearchType {
  start,
  destination,
}

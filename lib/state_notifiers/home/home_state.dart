part of 'home_notifier.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    String? startName,
    LatLng? startLoc,
    String? destinationName,
    LatLng? destinationLoc,
    @Default([]) List<SearchResult> searchResults,
    @Default(false) bool isSearching,
    @Default(<String>[]) List<String> recentSearches,
  }) = _HomeState;
}

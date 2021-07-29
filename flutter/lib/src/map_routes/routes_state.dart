part of 'routes_notifier.dart';

@freezed
class RoutesState with _$RoutesState {
  const factory RoutesState({
    required Set<Polyline> currPolyline,
    @Default(0) int page,
    required List<Polyline> polylines,
    required PolylineResult polylineResult,
  }) = _RoutesState;
}

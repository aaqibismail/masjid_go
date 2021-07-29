// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'routes_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoutesStateTearOff {
  const _$RoutesStateTearOff();

  _RoutesState call(
      {required Set<Polyline> currPolyline,
      int page = 0,
      required List<Polyline> polylines,
      required PolylineResult polylineResult}) {
    return _RoutesState(
      currPolyline: currPolyline,
      page: page,
      polylines: polylines,
      polylineResult: polylineResult,
    );
  }
}

/// @nodoc
const $RoutesState = _$RoutesStateTearOff();

/// @nodoc
mixin _$RoutesState {
  Set<Polyline> get currPolyline => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<Polyline> get polylines => throw _privateConstructorUsedError;
  PolylineResult get polylineResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutesStateCopyWith<RoutesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutesStateCopyWith<$Res> {
  factory $RoutesStateCopyWith(
          RoutesState value, $Res Function(RoutesState) then) =
      _$RoutesStateCopyWithImpl<$Res>;
  $Res call(
      {Set<Polyline> currPolyline,
      int page,
      List<Polyline> polylines,
      PolylineResult polylineResult});
}

/// @nodoc
class _$RoutesStateCopyWithImpl<$Res> implements $RoutesStateCopyWith<$Res> {
  _$RoutesStateCopyWithImpl(this._value, this._then);

  final RoutesState _value;
  // ignore: unused_field
  final $Res Function(RoutesState) _then;

  @override
  $Res call({
    Object? currPolyline = freezed,
    Object? page = freezed,
    Object? polylines = freezed,
    Object? polylineResult = freezed,
  }) {
    return _then(_value.copyWith(
      currPolyline: currPolyline == freezed
          ? _value.currPolyline
          : currPolyline // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      polylines: polylines == freezed
          ? _value.polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as List<Polyline>,
      polylineResult: polylineResult == freezed
          ? _value.polylineResult
          : polylineResult // ignore: cast_nullable_to_non_nullable
              as PolylineResult,
    ));
  }
}

/// @nodoc
abstract class _$RoutesStateCopyWith<$Res>
    implements $RoutesStateCopyWith<$Res> {
  factory _$RoutesStateCopyWith(
          _RoutesState value, $Res Function(_RoutesState) then) =
      __$RoutesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Set<Polyline> currPolyline,
      int page,
      List<Polyline> polylines,
      PolylineResult polylineResult});
}

/// @nodoc
class __$RoutesStateCopyWithImpl<$Res> extends _$RoutesStateCopyWithImpl<$Res>
    implements _$RoutesStateCopyWith<$Res> {
  __$RoutesStateCopyWithImpl(
      _RoutesState _value, $Res Function(_RoutesState) _then)
      : super(_value, (v) => _then(v as _RoutesState));

  @override
  _RoutesState get _value => super._value as _RoutesState;

  @override
  $Res call({
    Object? currPolyline = freezed,
    Object? page = freezed,
    Object? polylines = freezed,
    Object? polylineResult = freezed,
  }) {
    return _then(_RoutesState(
      currPolyline: currPolyline == freezed
          ? _value.currPolyline
          : currPolyline // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      polylines: polylines == freezed
          ? _value.polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as List<Polyline>,
      polylineResult: polylineResult == freezed
          ? _value.polylineResult
          : polylineResult // ignore: cast_nullable_to_non_nullable
              as PolylineResult,
    ));
  }
}

/// @nodoc

class _$_RoutesState with DiagnosticableTreeMixin implements _RoutesState {
  const _$_RoutesState(
      {required this.currPolyline,
      this.page = 0,
      required this.polylines,
      required this.polylineResult});

  @override
  final Set<Polyline> currPolyline;
  @JsonKey(defaultValue: 0)
  @override
  final int page;
  @override
  final List<Polyline> polylines;
  @override
  final PolylineResult polylineResult;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutesState(currPolyline: $currPolyline, page: $page, polylines: $polylines, polylineResult: $polylineResult)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutesState'))
      ..add(DiagnosticsProperty('currPolyline', currPolyline))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('polylines', polylines))
      ..add(DiagnosticsProperty('polylineResult', polylineResult));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoutesState &&
            (identical(other.currPolyline, currPolyline) ||
                const DeepCollectionEquality()
                    .equals(other.currPolyline, currPolyline)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.polylines, polylines) ||
                const DeepCollectionEquality()
                    .equals(other.polylines, polylines)) &&
            (identical(other.polylineResult, polylineResult) ||
                const DeepCollectionEquality()
                    .equals(other.polylineResult, polylineResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currPolyline) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(polylines) ^
      const DeepCollectionEquality().hash(polylineResult);

  @JsonKey(ignore: true)
  @override
  _$RoutesStateCopyWith<_RoutesState> get copyWith =>
      __$RoutesStateCopyWithImpl<_RoutesState>(this, _$identity);
}

abstract class _RoutesState implements RoutesState {
  const factory _RoutesState(
      {required Set<Polyline> currPolyline,
      int page,
      required List<Polyline> polylines,
      required PolylineResult polylineResult}) = _$_RoutesState;

  @override
  Set<Polyline> get currPolyline => throw _privateConstructorUsedError;
  @override
  int get page => throw _privateConstructorUsedError;
  @override
  List<Polyline> get polylines => throw _privateConstructorUsedError;
  @override
  PolylineResult get polylineResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoutesStateCopyWith<_RoutesState> get copyWith =>
      throw _privateConstructorUsedError;
}

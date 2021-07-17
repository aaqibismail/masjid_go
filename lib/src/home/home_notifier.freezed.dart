// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {LatLong? currentLoc,
      String? startName,
      String? startPlaceId,
      String? destinationName,
      String? destinationPlaceId,
      List<String> recentSearches = const <String>[]}) {
    return _HomeState(
      currentLoc: currentLoc,
      startName: startName,
      startPlaceId: startPlaceId,
      destinationName: destinationName,
      destinationPlaceId: destinationPlaceId,
      recentSearches: recentSearches,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  LatLong? get currentLoc => throw _privateConstructorUsedError;
  String? get startName => throw _privateConstructorUsedError;
  String? get startPlaceId => throw _privateConstructorUsedError;
  String? get destinationName => throw _privateConstructorUsedError;
  String? get destinationPlaceId => throw _privateConstructorUsedError;
  List<String> get recentSearches => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {LatLong? currentLoc,
      String? startName,
      String? startPlaceId,
      String? destinationName,
      String? destinationPlaceId,
      List<String> recentSearches});

  $LatLongCopyWith<$Res>? get currentLoc;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? currentLoc = freezed,
    Object? startName = freezed,
    Object? startPlaceId = freezed,
    Object? destinationName = freezed,
    Object? destinationPlaceId = freezed,
    Object? recentSearches = freezed,
  }) {
    return _then(_value.copyWith(
      currentLoc: currentLoc == freezed
          ? _value.currentLoc
          : currentLoc // ignore: cast_nullable_to_non_nullable
              as LatLong?,
      startName: startName == freezed
          ? _value.startName
          : startName // ignore: cast_nullable_to_non_nullable
              as String?,
      startPlaceId: startPlaceId == freezed
          ? _value.startPlaceId
          : startPlaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationName: destinationName == freezed
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationPlaceId: destinationPlaceId == freezed
          ? _value.destinationPlaceId
          : destinationPlaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      recentSearches: recentSearches == freezed
          ? _value.recentSearches
          : recentSearches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $LatLongCopyWith<$Res>? get currentLoc {
    if (_value.currentLoc == null) {
      return null;
    }

    return $LatLongCopyWith<$Res>(_value.currentLoc!, (value) {
      return _then(_value.copyWith(currentLoc: value));
    });
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LatLong? currentLoc,
      String? startName,
      String? startPlaceId,
      String? destinationName,
      String? destinationPlaceId,
      List<String> recentSearches});

  @override
  $LatLongCopyWith<$Res>? get currentLoc;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? currentLoc = freezed,
    Object? startName = freezed,
    Object? startPlaceId = freezed,
    Object? destinationName = freezed,
    Object? destinationPlaceId = freezed,
    Object? recentSearches = freezed,
  }) {
    return _then(_HomeState(
      currentLoc: currentLoc == freezed
          ? _value.currentLoc
          : currentLoc // ignore: cast_nullable_to_non_nullable
              as LatLong?,
      startName: startName == freezed
          ? _value.startName
          : startName // ignore: cast_nullable_to_non_nullable
              as String?,
      startPlaceId: startPlaceId == freezed
          ? _value.startPlaceId
          : startPlaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationName: destinationName == freezed
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationPlaceId: destinationPlaceId == freezed
          ? _value.destinationPlaceId
          : destinationPlaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      recentSearches: recentSearches == freezed
          ? _value.recentSearches
          : recentSearches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  const _$_HomeState(
      {this.currentLoc,
      this.startName,
      this.startPlaceId,
      this.destinationName,
      this.destinationPlaceId,
      this.recentSearches = const <String>[]});

  @override
  final LatLong? currentLoc;
  @override
  final String? startName;
  @override
  final String? startPlaceId;
  @override
  final String? destinationName;
  @override
  final String? destinationPlaceId;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> recentSearches;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(currentLoc: $currentLoc, startName: $startName, startPlaceId: $startPlaceId, destinationName: $destinationName, destinationPlaceId: $destinationPlaceId, recentSearches: $recentSearches)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('currentLoc', currentLoc))
      ..add(DiagnosticsProperty('startName', startName))
      ..add(DiagnosticsProperty('startPlaceId', startPlaceId))
      ..add(DiagnosticsProperty('destinationName', destinationName))
      ..add(DiagnosticsProperty('destinationPlaceId', destinationPlaceId))
      ..add(DiagnosticsProperty('recentSearches', recentSearches));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.currentLoc, currentLoc) ||
                const DeepCollectionEquality()
                    .equals(other.currentLoc, currentLoc)) &&
            (identical(other.startName, startName) ||
                const DeepCollectionEquality()
                    .equals(other.startName, startName)) &&
            (identical(other.startPlaceId, startPlaceId) ||
                const DeepCollectionEquality()
                    .equals(other.startPlaceId, startPlaceId)) &&
            (identical(other.destinationName, destinationName) ||
                const DeepCollectionEquality()
                    .equals(other.destinationName, destinationName)) &&
            (identical(other.destinationPlaceId, destinationPlaceId) ||
                const DeepCollectionEquality()
                    .equals(other.destinationPlaceId, destinationPlaceId)) &&
            (identical(other.recentSearches, recentSearches) ||
                const DeepCollectionEquality()
                    .equals(other.recentSearches, recentSearches)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentLoc) ^
      const DeepCollectionEquality().hash(startName) ^
      const DeepCollectionEquality().hash(startPlaceId) ^
      const DeepCollectionEquality().hash(destinationName) ^
      const DeepCollectionEquality().hash(destinationPlaceId) ^
      const DeepCollectionEquality().hash(recentSearches);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {LatLong? currentLoc,
      String? startName,
      String? startPlaceId,
      String? destinationName,
      String? destinationPlaceId,
      List<String> recentSearches}) = _$_HomeState;

  @override
  LatLong? get currentLoc => throw _privateConstructorUsedError;
  @override
  String? get startName => throw _privateConstructorUsedError;
  @override
  String? get startPlaceId => throw _privateConstructorUsedError;
  @override
  String? get destinationName => throw _privateConstructorUsedError;
  @override
  String? get destinationPlaceId => throw _privateConstructorUsedError;
  @override
  List<String> get recentSearches => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

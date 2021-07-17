// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'lat_long.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LatLongTearOff {
  const _$LatLongTearOff();

  _LatLong call(
      {@HiveField(0) required double lat, @HiveField(1) required double lng}) {
    return _LatLong(
      lat: lat,
      lng: lng,
    );
  }
}

/// @nodoc
const $LatLong = _$LatLongTearOff();

/// @nodoc
mixin _$LatLong {
  @HiveField(0)
  double get lat => throw _privateConstructorUsedError;
  @HiveField(1)
  double get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LatLongCopyWith<LatLong> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLongCopyWith<$Res> {
  factory $LatLongCopyWith(LatLong value, $Res Function(LatLong) then) =
      _$LatLongCopyWithImpl<$Res>;
  $Res call({@HiveField(0) double lat, @HiveField(1) double lng});
}

/// @nodoc
class _$LatLongCopyWithImpl<$Res> implements $LatLongCopyWith<$Res> {
  _$LatLongCopyWithImpl(this._value, this._then);

  final LatLong _value;
  // ignore: unused_field
  final $Res Function(LatLong) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$LatLongCopyWith<$Res> implements $LatLongCopyWith<$Res> {
  factory _$LatLongCopyWith(_LatLong value, $Res Function(_LatLong) then) =
      __$LatLongCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) double lat, @HiveField(1) double lng});
}

/// @nodoc
class __$LatLongCopyWithImpl<$Res> extends _$LatLongCopyWithImpl<$Res>
    implements _$LatLongCopyWith<$Res> {
  __$LatLongCopyWithImpl(_LatLong _value, $Res Function(_LatLong) _then)
      : super(_value, (v) => _then(v as _LatLong));

  @override
  _LatLong get _value => super._value as _LatLong;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_LatLong(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'LatLongAdapter')
class _$_LatLong with DiagnosticableTreeMixin implements _LatLong {
  const _$_LatLong(
      {@HiveField(0) required this.lat, @HiveField(1) required this.lng});

  @override
  @HiveField(0)
  final double lat;
  @override
  @HiveField(1)
  final double lng;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LatLong'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LatLong &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lng, lng) ||
                const DeepCollectionEquality().equals(other.lng, lng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lng);

  @JsonKey(ignore: true)
  @override
  _$LatLongCopyWith<_LatLong> get copyWith =>
      __$LatLongCopyWithImpl<_LatLong>(this, _$identity);
}

abstract class _LatLong implements LatLong {
  const factory _LatLong(
      {@HiveField(0) required double lat,
      @HiveField(1) required double lng}) = _$_LatLong;

  @override
  @HiveField(0)
  double get lat => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  double get lng => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LatLongCopyWith<_LatLong> get copyWith =>
      throw _privateConstructorUsedError;
}

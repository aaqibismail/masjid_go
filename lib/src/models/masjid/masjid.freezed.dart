// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'masjid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MasjidTearOff {
  const _$MasjidTearOff();

  _Masjid call(
      {required String name,
      required String address,
      required DateTime arrival}) {
    return _Masjid(
      name: name,
      address: address,
      arrival: arrival,
    );
  }
}

/// @nodoc
const $Masjid = _$MasjidTearOff();

/// @nodoc
mixin _$Masjid {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  DateTime get arrival => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasjidCopyWith<Masjid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasjidCopyWith<$Res> {
  factory $MasjidCopyWith(Masjid value, $Res Function(Masjid) then) =
      _$MasjidCopyWithImpl<$Res>;
  $Res call({String name, String address, DateTime arrival});
}

/// @nodoc
class _$MasjidCopyWithImpl<$Res> implements $MasjidCopyWith<$Res> {
  _$MasjidCopyWithImpl(this._value, this._then);

  final Masjid _value;
  // ignore: unused_field
  final $Res Function(Masjid) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? arrival = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      arrival: arrival == freezed
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MasjidCopyWith<$Res> implements $MasjidCopyWith<$Res> {
  factory _$MasjidCopyWith(_Masjid value, $Res Function(_Masjid) then) =
      __$MasjidCopyWithImpl<$Res>;
  @override
  $Res call({String name, String address, DateTime arrival});
}

/// @nodoc
class __$MasjidCopyWithImpl<$Res> extends _$MasjidCopyWithImpl<$Res>
    implements _$MasjidCopyWith<$Res> {
  __$MasjidCopyWithImpl(_Masjid _value, $Res Function(_Masjid) _then)
      : super(_value, (v) => _then(v as _Masjid));

  @override
  _Masjid get _value => super._value as _Masjid;

  @override
  $Res call({
    Object? name = freezed,
    Object? address = freezed,
    Object? arrival = freezed,
  }) {
    return _then(_Masjid(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      arrival: arrival == freezed
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Masjid with DiagnosticableTreeMixin implements _Masjid {
  const _$_Masjid(
      {required this.name, required this.address, required this.arrival});

  @override
  final String name;
  @override
  final String address;
  @override
  final DateTime arrival;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Masjid(name: $name, address: $address, arrival: $arrival)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Masjid'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('arrival', arrival));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Masjid &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.arrival, arrival) ||
                const DeepCollectionEquality().equals(other.arrival, arrival)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(arrival);

  @JsonKey(ignore: true)
  @override
  _$MasjidCopyWith<_Masjid> get copyWith =>
      __$MasjidCopyWithImpl<_Masjid>(this, _$identity);
}

abstract class _Masjid implements Masjid {
  const factory _Masjid(
      {required String name,
      required String address,
      required DateTime arrival}) = _$_Masjid;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get address => throw _privateConstructorUsedError;
  @override
  DateTime get arrival => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MasjidCopyWith<_Masjid> get copyWith => throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'prayer_times.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PrayerTimesTearOff {
  const _$PrayerTimesTearOff();

  _PrayerTimes call(
      {required DateTime fajr,
      required DateTime dhuhr,
      required DateTime asr,
      required DateTime maghrib,
      required DateTime isha}) {
    return _PrayerTimes(
      fajr: fajr,
      dhuhr: dhuhr,
      asr: asr,
      maghrib: maghrib,
      isha: isha,
    );
  }
}

/// @nodoc
const $PrayerTimes = _$PrayerTimesTearOff();

/// @nodoc
mixin _$PrayerTimes {
  DateTime get fajr => throw _privateConstructorUsedError;
  DateTime get dhuhr => throw _privateConstructorUsedError;
  DateTime get asr => throw _privateConstructorUsedError;
  DateTime get maghrib => throw _privateConstructorUsedError;
  DateTime get isha => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrayerTimesCopyWith<PrayerTimes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerTimesCopyWith<$Res> {
  factory $PrayerTimesCopyWith(
          PrayerTimes value, $Res Function(PrayerTimes) then) =
      _$PrayerTimesCopyWithImpl<$Res>;
  $Res call(
      {DateTime fajr,
      DateTime dhuhr,
      DateTime asr,
      DateTime maghrib,
      DateTime isha});
}

/// @nodoc
class _$PrayerTimesCopyWithImpl<$Res> implements $PrayerTimesCopyWith<$Res> {
  _$PrayerTimesCopyWithImpl(this._value, this._then);

  final PrayerTimes _value;
  // ignore: unused_field
  final $Res Function(PrayerTimes) _then;

  @override
  $Res call({
    Object? fajr = freezed,
    Object? dhuhr = freezed,
    Object? asr = freezed,
    Object? maghrib = freezed,
    Object? isha = freezed,
  }) {
    return _then(_value.copyWith(
      fajr: fajr == freezed
          ? _value.fajr
          : fajr // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dhuhr: dhuhr == freezed
          ? _value.dhuhr
          : dhuhr // ignore: cast_nullable_to_non_nullable
              as DateTime,
      asr: asr == freezed
          ? _value.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maghrib: maghrib == freezed
          ? _value.maghrib
          : maghrib // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isha: isha == freezed
          ? _value.isha
          : isha // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$PrayerTimesCopyWith<$Res>
    implements $PrayerTimesCopyWith<$Res> {
  factory _$PrayerTimesCopyWith(
          _PrayerTimes value, $Res Function(_PrayerTimes) then) =
      __$PrayerTimesCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime fajr,
      DateTime dhuhr,
      DateTime asr,
      DateTime maghrib,
      DateTime isha});
}

/// @nodoc
class __$PrayerTimesCopyWithImpl<$Res> extends _$PrayerTimesCopyWithImpl<$Res>
    implements _$PrayerTimesCopyWith<$Res> {
  __$PrayerTimesCopyWithImpl(
      _PrayerTimes _value, $Res Function(_PrayerTimes) _then)
      : super(_value, (v) => _then(v as _PrayerTimes));

  @override
  _PrayerTimes get _value => super._value as _PrayerTimes;

  @override
  $Res call({
    Object? fajr = freezed,
    Object? dhuhr = freezed,
    Object? asr = freezed,
    Object? maghrib = freezed,
    Object? isha = freezed,
  }) {
    return _then(_PrayerTimes(
      fajr: fajr == freezed
          ? _value.fajr
          : fajr // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dhuhr: dhuhr == freezed
          ? _value.dhuhr
          : dhuhr // ignore: cast_nullable_to_non_nullable
              as DateTime,
      asr: asr == freezed
          ? _value.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as DateTime,
      maghrib: maghrib == freezed
          ? _value.maghrib
          : maghrib // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isha: isha == freezed
          ? _value.isha
          : isha // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_PrayerTimes with DiagnosticableTreeMixin implements _PrayerTimes {
  const _$_PrayerTimes(
      {required this.fajr,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.isha});

  @override
  final DateTime fajr;
  @override
  final DateTime dhuhr;
  @override
  final DateTime asr;
  @override
  final DateTime maghrib;
  @override
  final DateTime isha;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerTimes(fajr: $fajr, dhuhr: $dhuhr, asr: $asr, maghrib: $maghrib, isha: $isha)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerTimes'))
      ..add(DiagnosticsProperty('fajr', fajr))
      ..add(DiagnosticsProperty('dhuhr', dhuhr))
      ..add(DiagnosticsProperty('asr', asr))
      ..add(DiagnosticsProperty('maghrib', maghrib))
      ..add(DiagnosticsProperty('isha', isha));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PrayerTimes &&
            (identical(other.fajr, fajr) ||
                const DeepCollectionEquality().equals(other.fajr, fajr)) &&
            (identical(other.dhuhr, dhuhr) ||
                const DeepCollectionEquality().equals(other.dhuhr, dhuhr)) &&
            (identical(other.asr, asr) ||
                const DeepCollectionEquality().equals(other.asr, asr)) &&
            (identical(other.maghrib, maghrib) ||
                const DeepCollectionEquality()
                    .equals(other.maghrib, maghrib)) &&
            (identical(other.isha, isha) ||
                const DeepCollectionEquality().equals(other.isha, isha)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fajr) ^
      const DeepCollectionEquality().hash(dhuhr) ^
      const DeepCollectionEquality().hash(asr) ^
      const DeepCollectionEquality().hash(maghrib) ^
      const DeepCollectionEquality().hash(isha);

  @JsonKey(ignore: true)
  @override
  _$PrayerTimesCopyWith<_PrayerTimes> get copyWith =>
      __$PrayerTimesCopyWithImpl<_PrayerTimes>(this, _$identity);
}

abstract class _PrayerTimes implements PrayerTimes {
  const factory _PrayerTimes(
      {required DateTime fajr,
      required DateTime dhuhr,
      required DateTime asr,
      required DateTime maghrib,
      required DateTime isha}) = _$_PrayerTimes;

  @override
  DateTime get fajr => throw _privateConstructorUsedError;
  @override
  DateTime get dhuhr => throw _privateConstructorUsedError;
  @override
  DateTime get asr => throw _privateConstructorUsedError;
  @override
  DateTime get maghrib => throw _privateConstructorUsedError;
  @override
  DateTime get isha => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PrayerTimesCopyWith<_PrayerTimes> get copyWith =>
      throw _privateConstructorUsedError;
}

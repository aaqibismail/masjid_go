// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settings_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {@HiveField(0) AsrJurisdiction asr = AsrJurisdiction.standard,
      @HiveField(1) bool storeLastLocation = true}) {
    return _Settings(
      asr: asr,
      storeLastLocation: storeLastLocation,
    );
  }
}

/// @nodoc
const $Settings = _$SettingsTearOff();

/// @nodoc
mixin _$Settings {
  @HiveField(0)
  AsrJurisdiction get asr => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get storeLastLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) AsrJurisdiction asr,
      @HiveField(1) bool storeLastLocation});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? asr = freezed,
    Object? storeLastLocation = freezed,
  }) {
    return _then(_value.copyWith(
      asr: asr == freezed
          ? _value.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as AsrJurisdiction,
      storeLastLocation: storeLastLocation == freezed
          ? _value.storeLastLocation
          : storeLastLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) AsrJurisdiction asr,
      @HiveField(1) bool storeLastLocation});
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object? asr = freezed,
    Object? storeLastLocation = freezed,
  }) {
    return _then(_Settings(
      asr: asr == freezed
          ? _value.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as AsrJurisdiction,
      storeLastLocation: storeLastLocation == freezed
          ? _value.storeLastLocation
          : storeLastLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'SettingsAdapter')
class _$_Settings with DiagnosticableTreeMixin implements _Settings {
  const _$_Settings(
      {@HiveField(0) this.asr = AsrJurisdiction.standard,
      @HiveField(1) this.storeLastLocation = true});

  @JsonKey(defaultValue: AsrJurisdiction.standard)
  @override
  @HiveField(0)
  final AsrJurisdiction asr;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(1)
  final bool storeLastLocation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Settings(asr: $asr, storeLastLocation: $storeLastLocation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Settings'))
      ..add(DiagnosticsProperty('asr', asr))
      ..add(DiagnosticsProperty('storeLastLocation', storeLastLocation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Settings &&
            (identical(other.asr, asr) ||
                const DeepCollectionEquality().equals(other.asr, asr)) &&
            (identical(other.storeLastLocation, storeLastLocation) ||
                const DeepCollectionEquality()
                    .equals(other.storeLastLocation, storeLastLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(asr) ^
      const DeepCollectionEquality().hash(storeLastLocation);

  @JsonKey(ignore: true)
  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {@HiveField(0) AsrJurisdiction asr,
      @HiveField(1) bool storeLastLocation}) = _$_Settings;

  @override
  @HiveField(0)
  AsrJurisdiction get asr => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  bool get storeLastLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsCopyWith<_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

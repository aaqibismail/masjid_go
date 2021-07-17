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
class _$GlobalSettingsTearOff {
  const _$GlobalSettingsTearOff();

  _GlobalSettings call(
      {@HiveField(0) AsrJurisdiction asr = AsrJurisdiction.standard,
      @HiveField(1) CalculationMethod calcMethod = CalculationMethod.isna,
      @HiveField(2) bool storeLastLocation = true}) {
    return _GlobalSettings(
      asr: asr,
      calcMethod: calcMethod,
      storeLastLocation: storeLastLocation,
    );
  }
}

/// @nodoc
const $GlobalSettings = _$GlobalSettingsTearOff();

/// @nodoc
mixin _$GlobalSettings {
  @HiveField(0)
  AsrJurisdiction get asr => throw _privateConstructorUsedError;
  @HiveField(1)
  CalculationMethod get calcMethod => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get storeLastLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalSettingsCopyWith<GlobalSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingsCopyWith<$Res> {
  factory $GlobalSettingsCopyWith(
          GlobalSettings value, $Res Function(GlobalSettings) then) =
      _$GlobalSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) AsrJurisdiction asr,
      @HiveField(1) CalculationMethod calcMethod,
      @HiveField(2) bool storeLastLocation});
}

/// @nodoc
class _$GlobalSettingsCopyWithImpl<$Res>
    implements $GlobalSettingsCopyWith<$Res> {
  _$GlobalSettingsCopyWithImpl(this._value, this._then);

  final GlobalSettings _value;
  // ignore: unused_field
  final $Res Function(GlobalSettings) _then;

  @override
  $Res call({
    Object? asr = freezed,
    Object? calcMethod = freezed,
    Object? storeLastLocation = freezed,
  }) {
    return _then(_value.copyWith(
      asr: asr == freezed
          ? _value.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as AsrJurisdiction,
      calcMethod: calcMethod == freezed
          ? _value.calcMethod
          : calcMethod // ignore: cast_nullable_to_non_nullable
              as CalculationMethod,
      storeLastLocation: storeLastLocation == freezed
          ? _value.storeLastLocation
          : storeLastLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GlobalSettingsCopyWith<$Res>
    implements $GlobalSettingsCopyWith<$Res> {
  factory _$GlobalSettingsCopyWith(
          _GlobalSettings value, $Res Function(_GlobalSettings) then) =
      __$GlobalSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) AsrJurisdiction asr,
      @HiveField(1) CalculationMethod calcMethod,
      @HiveField(2) bool storeLastLocation});
}

/// @nodoc
class __$GlobalSettingsCopyWithImpl<$Res>
    extends _$GlobalSettingsCopyWithImpl<$Res>
    implements _$GlobalSettingsCopyWith<$Res> {
  __$GlobalSettingsCopyWithImpl(
      _GlobalSettings _value, $Res Function(_GlobalSettings) _then)
      : super(_value, (v) => _then(v as _GlobalSettings));

  @override
  _GlobalSettings get _value => super._value as _GlobalSettings;

  @override
  $Res call({
    Object? asr = freezed,
    Object? calcMethod = freezed,
    Object? storeLastLocation = freezed,
  }) {
    return _then(_GlobalSettings(
      asr: asr == freezed
          ? _value.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as AsrJurisdiction,
      calcMethod: calcMethod == freezed
          ? _value.calcMethod
          : calcMethod // ignore: cast_nullable_to_non_nullable
              as CalculationMethod,
      storeLastLocation: storeLastLocation == freezed
          ? _value.storeLastLocation
          : storeLastLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'SettingsAdapter')
class _$_GlobalSettings
    with DiagnosticableTreeMixin
    implements _GlobalSettings {
  const _$_GlobalSettings(
      {@HiveField(0) this.asr = AsrJurisdiction.standard,
      @HiveField(1) this.calcMethod = CalculationMethod.isna,
      @HiveField(2) this.storeLastLocation = true});

  @JsonKey(defaultValue: AsrJurisdiction.standard)
  @override
  @HiveField(0)
  final AsrJurisdiction asr;
  @JsonKey(defaultValue: CalculationMethod.isna)
  @override
  @HiveField(1)
  final CalculationMethod calcMethod;
  @JsonKey(defaultValue: true)
  @override
  @HiveField(2)
  final bool storeLastLocation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalSettings(asr: $asr, calcMethod: $calcMethod, storeLastLocation: $storeLastLocation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GlobalSettings'))
      ..add(DiagnosticsProperty('asr', asr))
      ..add(DiagnosticsProperty('calcMethod', calcMethod))
      ..add(DiagnosticsProperty('storeLastLocation', storeLastLocation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GlobalSettings &&
            (identical(other.asr, asr) ||
                const DeepCollectionEquality().equals(other.asr, asr)) &&
            (identical(other.calcMethod, calcMethod) ||
                const DeepCollectionEquality()
                    .equals(other.calcMethod, calcMethod)) &&
            (identical(other.storeLastLocation, storeLastLocation) ||
                const DeepCollectionEquality()
                    .equals(other.storeLastLocation, storeLastLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(asr) ^
      const DeepCollectionEquality().hash(calcMethod) ^
      const DeepCollectionEquality().hash(storeLastLocation);

  @JsonKey(ignore: true)
  @override
  _$GlobalSettingsCopyWith<_GlobalSettings> get copyWith =>
      __$GlobalSettingsCopyWithImpl<_GlobalSettings>(this, _$identity);
}

abstract class _GlobalSettings implements GlobalSettings {
  const factory _GlobalSettings(
      {@HiveField(0) AsrJurisdiction asr,
      @HiveField(1) CalculationMethod calcMethod,
      @HiveField(2) bool storeLastLocation}) = _$_GlobalSettings;

  @override
  @HiveField(0)
  AsrJurisdiction get asr => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  CalculationMethod get calcMethod => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool get storeLastLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GlobalSettingsCopyWith<_GlobalSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

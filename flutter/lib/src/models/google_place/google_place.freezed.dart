// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'google_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GooglePlace _$GooglePlaceFromJson(Map<String, dynamic> json) {
  return _GooglePlace.fromJson(json);
}

/// @nodoc
class _$GooglePlaceTearOff {
  const _$GooglePlaceTearOff();

  _GooglePlace call(
      {@_Converter() required String fullText,
      required String primaryText,
      required String secondaryText,
      required String placeId,
      int? distance}) {
    return _GooglePlace(
      fullText: fullText,
      primaryText: primaryText,
      secondaryText: secondaryText,
      placeId: placeId,
      distance: distance,
    );
  }

  GooglePlace fromJson(Map<String, Object> json) {
    return GooglePlace.fromJson(json);
  }
}

/// @nodoc
const $GooglePlace = _$GooglePlaceTearOff();

/// @nodoc
mixin _$GooglePlace {
  @_Converter()
  String get fullText => throw _privateConstructorUsedError;
  String get primaryText => throw _privateConstructorUsedError;
  String get secondaryText => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  int? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GooglePlaceCopyWith<GooglePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooglePlaceCopyWith<$Res> {
  factory $GooglePlaceCopyWith(
          GooglePlace value, $Res Function(GooglePlace) then) =
      _$GooglePlaceCopyWithImpl<$Res>;
  $Res call(
      {@_Converter() String fullText,
      String primaryText,
      String secondaryText,
      String placeId,
      int? distance});
}

/// @nodoc
class _$GooglePlaceCopyWithImpl<$Res> implements $GooglePlaceCopyWith<$Res> {
  _$GooglePlaceCopyWithImpl(this._value, this._then);

  final GooglePlace _value;
  // ignore: unused_field
  final $Res Function(GooglePlace) _then;

  @override
  $Res call({
    Object? fullText = freezed,
    Object? primaryText = freezed,
    Object? secondaryText = freezed,
    Object? placeId = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      fullText: fullText == freezed
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String,
      primaryText: primaryText == freezed
          ? _value.primaryText
          : primaryText // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryText: secondaryText == freezed
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$GooglePlaceCopyWith<$Res>
    implements $GooglePlaceCopyWith<$Res> {
  factory _$GooglePlaceCopyWith(
          _GooglePlace value, $Res Function(_GooglePlace) then) =
      __$GooglePlaceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@_Converter() String fullText,
      String primaryText,
      String secondaryText,
      String placeId,
      int? distance});
}

/// @nodoc
class __$GooglePlaceCopyWithImpl<$Res> extends _$GooglePlaceCopyWithImpl<$Res>
    implements _$GooglePlaceCopyWith<$Res> {
  __$GooglePlaceCopyWithImpl(
      _GooglePlace _value, $Res Function(_GooglePlace) _then)
      : super(_value, (v) => _then(v as _GooglePlace));

  @override
  _GooglePlace get _value => super._value as _GooglePlace;

  @override
  $Res call({
    Object? fullText = freezed,
    Object? primaryText = freezed,
    Object? secondaryText = freezed,
    Object? placeId = freezed,
    Object? distance = freezed,
  }) {
    return _then(_GooglePlace(
      fullText: fullText == freezed
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String,
      primaryText: primaryText == freezed
          ? _value.primaryText
          : primaryText // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryText: secondaryText == freezed
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GooglePlace with DiagnosticableTreeMixin implements _GooglePlace {
  const _$_GooglePlace(
      {@_Converter() required this.fullText,
      required this.primaryText,
      required this.secondaryText,
      required this.placeId,
      this.distance});

  factory _$_GooglePlace.fromJson(Map<String, dynamic> json) =>
      _$_$_GooglePlaceFromJson(json);

  @override
  @_Converter()
  final String fullText;
  @override
  final String primaryText;
  @override
  final String secondaryText;
  @override
  final String placeId;
  @override
  final int? distance;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GooglePlace(fullText: $fullText, primaryText: $primaryText, secondaryText: $secondaryText, placeId: $placeId, distance: $distance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GooglePlace'))
      ..add(DiagnosticsProperty('fullText', fullText))
      ..add(DiagnosticsProperty('primaryText', primaryText))
      ..add(DiagnosticsProperty('secondaryText', secondaryText))
      ..add(DiagnosticsProperty('placeId', placeId))
      ..add(DiagnosticsProperty('distance', distance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GooglePlace &&
            (identical(other.fullText, fullText) ||
                const DeepCollectionEquality()
                    .equals(other.fullText, fullText)) &&
            (identical(other.primaryText, primaryText) ||
                const DeepCollectionEquality()
                    .equals(other.primaryText, primaryText)) &&
            (identical(other.secondaryText, secondaryText) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryText, secondaryText)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullText) ^
      const DeepCollectionEquality().hash(primaryText) ^
      const DeepCollectionEquality().hash(secondaryText) ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(distance);

  @JsonKey(ignore: true)
  @override
  _$GooglePlaceCopyWith<_GooglePlace> get copyWith =>
      __$GooglePlaceCopyWithImpl<_GooglePlace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GooglePlaceToJson(this);
  }
}

abstract class _GooglePlace implements GooglePlace {
  const factory _GooglePlace(
      {@_Converter() required String fullText,
      required String primaryText,
      required String secondaryText,
      required String placeId,
      int? distance}) = _$_GooglePlace;

  factory _GooglePlace.fromJson(Map<String, dynamic> json) =
      _$_GooglePlace.fromJson;

  @override
  @_Converter()
  String get fullText => throw _privateConstructorUsedError;
  @override
  String get primaryText => throw _privateConstructorUsedError;
  @override
  String get secondaryText => throw _privateConstructorUsedError;
  @override
  String get placeId => throw _privateConstructorUsedError;
  @override
  int? get distance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GooglePlaceCopyWith<_GooglePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

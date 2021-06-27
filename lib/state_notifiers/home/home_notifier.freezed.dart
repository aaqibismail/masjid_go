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
      {String? startName,
      LatLng? startLoc,
      String? destinationName,
      LatLng? destinationLoc,
      List<SearchResult> searchResults = const [],
      bool isSearching = false,
      List<String> recentSearches = const <String>[]}) {
    return _HomeState(
      startName: startName,
      startLoc: startLoc,
      destinationName: destinationName,
      destinationLoc: destinationLoc,
      searchResults: searchResults,
      isSearching: isSearching,
      recentSearches: recentSearches,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  String? get startName => throw _privateConstructorUsedError;
  LatLng? get startLoc => throw _privateConstructorUsedError;
  String? get destinationName => throw _privateConstructorUsedError;
  LatLng? get destinationLoc => throw _privateConstructorUsedError;
  List<SearchResult> get searchResults => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
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
      {String? startName,
      LatLng? startLoc,
      String? destinationName,
      LatLng? destinationLoc,
      List<SearchResult> searchResults,
      bool isSearching,
      List<String> recentSearches});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? startName = freezed,
    Object? startLoc = freezed,
    Object? destinationName = freezed,
    Object? destinationLoc = freezed,
    Object? searchResults = freezed,
    Object? isSearching = freezed,
    Object? recentSearches = freezed,
  }) {
    return _then(_value.copyWith(
      startName: startName == freezed
          ? _value.startName
          : startName // ignore: cast_nullable_to_non_nullable
              as String?,
      startLoc: startLoc == freezed
          ? _value.startLoc
          : startLoc // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      destinationName: destinationName == freezed
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationLoc: destinationLoc == freezed
          ? _value.destinationLoc
          : destinationLoc // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      searchResults: searchResults == freezed
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      recentSearches: recentSearches == freezed
          ? _value.recentSearches
          : recentSearches // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? startName,
      LatLng? startLoc,
      String? destinationName,
      LatLng? destinationLoc,
      List<SearchResult> searchResults,
      bool isSearching,
      List<String> recentSearches});
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
    Object? startName = freezed,
    Object? startLoc = freezed,
    Object? destinationName = freezed,
    Object? destinationLoc = freezed,
    Object? searchResults = freezed,
    Object? isSearching = freezed,
    Object? recentSearches = freezed,
  }) {
    return _then(_HomeState(
      startName: startName == freezed
          ? _value.startName
          : startName // ignore: cast_nullable_to_non_nullable
              as String?,
      startLoc: startLoc == freezed
          ? _value.startLoc
          : startLoc // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      destinationName: destinationName == freezed
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationLoc: destinationLoc == freezed
          ? _value.destinationLoc
          : destinationLoc // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      searchResults: searchResults == freezed
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
      isSearching: isSearching == freezed
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {this.startName,
      this.startLoc,
      this.destinationName,
      this.destinationLoc,
      this.searchResults = const [],
      this.isSearching = false,
      this.recentSearches = const <String>[]});

  @override
  final String? startName;
  @override
  final LatLng? startLoc;
  @override
  final String? destinationName;
  @override
  final LatLng? destinationLoc;
  @JsonKey(defaultValue: const [])
  @override
  final List<SearchResult> searchResults;
  @JsonKey(defaultValue: false)
  @override
  final bool isSearching;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> recentSearches;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(startName: $startName, startLoc: $startLoc, destinationName: $destinationName, destinationLoc: $destinationLoc, searchResults: $searchResults, isSearching: $isSearching, recentSearches: $recentSearches)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('startName', startName))
      ..add(DiagnosticsProperty('startLoc', startLoc))
      ..add(DiagnosticsProperty('destinationName', destinationName))
      ..add(DiagnosticsProperty('destinationLoc', destinationLoc))
      ..add(DiagnosticsProperty('searchResults', searchResults))
      ..add(DiagnosticsProperty('isSearching', isSearching))
      ..add(DiagnosticsProperty('recentSearches', recentSearches));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.startName, startName) ||
                const DeepCollectionEquality()
                    .equals(other.startName, startName)) &&
            (identical(other.startLoc, startLoc) ||
                const DeepCollectionEquality()
                    .equals(other.startLoc, startLoc)) &&
            (identical(other.destinationName, destinationName) ||
                const DeepCollectionEquality()
                    .equals(other.destinationName, destinationName)) &&
            (identical(other.destinationLoc, destinationLoc) ||
                const DeepCollectionEquality()
                    .equals(other.destinationLoc, destinationLoc)) &&
            (identical(other.searchResults, searchResults) ||
                const DeepCollectionEquality()
                    .equals(other.searchResults, searchResults)) &&
            (identical(other.isSearching, isSearching) ||
                const DeepCollectionEquality()
                    .equals(other.isSearching, isSearching)) &&
            (identical(other.recentSearches, recentSearches) ||
                const DeepCollectionEquality()
                    .equals(other.recentSearches, recentSearches)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(startName) ^
      const DeepCollectionEquality().hash(startLoc) ^
      const DeepCollectionEquality().hash(destinationName) ^
      const DeepCollectionEquality().hash(destinationLoc) ^
      const DeepCollectionEquality().hash(searchResults) ^
      const DeepCollectionEquality().hash(isSearching) ^
      const DeepCollectionEquality().hash(recentSearches);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {String? startName,
      LatLng? startLoc,
      String? destinationName,
      LatLng? destinationLoc,
      List<SearchResult> searchResults,
      bool isSearching,
      List<String> recentSearches}) = _$_HomeState;

  @override
  String? get startName => throw _privateConstructorUsedError;
  @override
  LatLng? get startLoc => throw _privateConstructorUsedError;
  @override
  String? get destinationName => throw _privateConstructorUsedError;
  @override
  LatLng? get destinationLoc => throw _privateConstructorUsedError;
  @override
  List<SearchResult> get searchResults => throw _privateConstructorUsedError;
  @override
  bool get isSearching => throw _privateConstructorUsedError;
  @override
  List<String> get recentSearches => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

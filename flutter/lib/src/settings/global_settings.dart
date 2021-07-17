part of 'settings_notifier.dart';

@freezed
class GlobalSettings with _$GlobalSettings {
  @HiveType(typeId: 1, adapterName: 'SettingsAdapter')
  const factory GlobalSettings({
    @HiveField(0) @Default(AsrJurisdiction.standard) AsrJurisdiction asr,
    @HiveField(1) @Default(CalculationMethod.isna) CalculationMethod calcMethod,
    @HiveField(2) @Default(true) bool storeLastLocation,
  }) = _GlobalSettings;
}

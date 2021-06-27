part of 'settings_notifier.dart';

@freezed
class Settings with _$Settings {
  @HiveType(typeId: 1, adapterName: 'SettingsAdapter')
  const factory Settings({
    @HiveField(0) @Default(AsrJurisdiction.standard) AsrJurisdiction asr,
    @HiveField(1) @Default(true) bool storeLastLocation,
  }) = _Settings;
}

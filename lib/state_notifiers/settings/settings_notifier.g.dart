// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_notifier.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<_$_Settings> {
  @override
  final int typeId = 1;

  @override
  _$_Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Settings(
      asr: fields[0] as AsrJurisdiction,
      storeLastLocation: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Settings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.asr)
      ..writeByte(1)
      ..write(obj.storeLastLocation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

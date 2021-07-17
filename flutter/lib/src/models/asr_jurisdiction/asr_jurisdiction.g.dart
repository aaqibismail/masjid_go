// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asr_jurisdiction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AsrJurisdictionAdapter extends TypeAdapter<AsrJurisdiction> {
  @override
  final int typeId = 2;

  @override
  AsrJurisdiction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AsrJurisdiction.standard;
      case 1:
        return AsrJurisdiction.hanafi;
      default:
        return AsrJurisdiction.standard;
    }
  }

  @override
  void write(BinaryWriter writer, AsrJurisdiction obj) {
    switch (obj) {
      case AsrJurisdiction.standard:
        writer.writeByte(0);
        break;
      case AsrJurisdiction.hanafi:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsrJurisdictionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

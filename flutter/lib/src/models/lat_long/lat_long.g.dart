// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lat_long.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLongAdapter extends TypeAdapter<_$_LatLong> {
  @override
  final int typeId = 0;

  @override
  _$_LatLong read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_LatLong(
      lat: fields[0] as double,
      lng: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_LatLong obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

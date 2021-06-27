import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

class LatLngAdapter extends TypeAdapter<LatLng> {
  @override
  final typeId = 0;

  @override
  LatLng read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final data = (fields[0] as List).cast<double>();
    return LatLng(data[0], data[1]);
  }

  @override
  void write(BinaryWriter writer, LatLng obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write([obj.latitude, obj.longitude]);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

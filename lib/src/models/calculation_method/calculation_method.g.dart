// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_method.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationMethodAdapter extends TypeAdapter<CalculationMethod> {
  @override
  final int typeId = 3;

  @override
  CalculationMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CalculationMethod.shia;
      case 1:
        return CalculationMethod.karachi;
      case 2:
        return CalculationMethod.isna;
      case 3:
        return CalculationMethod.mwl;
      case 4:
        return CalculationMethod.makkah;
      case 5:
        return CalculationMethod.egypt;
      case 6:
        return CalculationMethod.tehran;
      case 7:
        return CalculationMethod.gulf;
      case 8:
        return CalculationMethod.kuwait;
      case 9:
        return CalculationMethod.qatar;
      case 10:
        return CalculationMethod.singapore;
      case 11:
        return CalculationMethod.france;
      case 12:
        return CalculationMethod.turkey;
      case 13:
        return CalculationMethod.russia;
      default:
        return CalculationMethod.shia;
    }
  }

  @override
  void write(BinaryWriter writer, CalculationMethod obj) {
    switch (obj) {
      case CalculationMethod.shia:
        writer.writeByte(0);
        break;
      case CalculationMethod.karachi:
        writer.writeByte(1);
        break;
      case CalculationMethod.isna:
        writer.writeByte(2);
        break;
      case CalculationMethod.mwl:
        writer.writeByte(3);
        break;
      case CalculationMethod.makkah:
        writer.writeByte(4);
        break;
      case CalculationMethod.egypt:
        writer.writeByte(5);
        break;
      case CalculationMethod.tehran:
        writer.writeByte(6);
        break;
      case CalculationMethod.gulf:
        writer.writeByte(7);
        break;
      case CalculationMethod.kuwait:
        writer.writeByte(8);
        break;
      case CalculationMethod.qatar:
        writer.writeByte(9);
        break;
      case CalculationMethod.singapore:
        writer.writeByte(10);
        break;
      case CalculationMethod.france:
        writer.writeByte(11);
        break;
      case CalculationMethod.turkey:
        writer.writeByte(12);
        break;
      case CalculationMethod.russia:
        writer.writeByte(13);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationMethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

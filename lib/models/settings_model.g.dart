// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempUnitAdapter extends TypeAdapter<TempUnit> {
  @override
  final int typeId = 3;

  @override
  TempUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TempUnit.CELSIUS;
      case 1:
        return TempUnit.FAHRENHEIT;
      default:
        return TempUnit.CELSIUS;
    }
  }

  @override
  void write(BinaryWriter writer, TempUnit obj) {
    switch (obj) {
      case TempUnit.CELSIUS:
        writer.writeByte(0);
        break;
      case TempUnit.FAHRENHEIT:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 4;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      tempUnit: fields[0] as TempUnit,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.tempUnit);
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

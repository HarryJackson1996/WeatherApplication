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

class LocationPermissionsAdapter extends TypeAdapter<LocationPermissions> {
  @override
  final int typeId = 4;

  @override
  LocationPermissions read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LocationPermissions.ALLOWED;
      case 1:
        return LocationPermissions.DENIED;
      default:
        return LocationPermissions.ALLOWED;
    }
  }

  @override
  void write(BinaryWriter writer, LocationPermissions obj) {
    switch (obj) {
      case LocationPermissions.ALLOWED:
        writer.writeByte(0);
        break;
      case LocationPermissions.DENIED:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationPermissionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 5;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      tempUnit: fields[0] as TempUnit,
      onboarding: fields[1] as bool,
      locationPermissions: fields[2] as LocationPermissions,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tempUnit)
      ..writeByte(1)
      ..write(obj.onboarding)
      ..writeByte(2)
      ..write(obj.locationPermissions);
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

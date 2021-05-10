// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GraphTypeAdapter extends TypeAdapter<GraphType> {
  @override
  final int typeId = 13;

  @override
  GraphType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GraphType.LINE;
      case 1:
        return GraphType.BAR;
      default:
        return GraphType.LINE;
    }
  }

  @override
  void write(BinaryWriter writer, GraphType obj) {
    switch (obj) {
      case GraphType.LINE:
        writer.writeByte(0);
        break;
      case GraphType.BAR:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GraphUnitAdapter extends TypeAdapter<GraphUnit> {
  @override
  final int typeId = 14;

  @override
  GraphUnit read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GraphUnit.MIN;
      case 1:
        return GraphUnit.AVG;
      case 2:
        return GraphUnit.MAX;
      default:
        return GraphUnit.MIN;
    }
  }

  @override
  void write(BinaryWriter writer, GraphUnit obj) {
    switch (obj) {
      case GraphUnit.MIN:
        writer.writeByte(0);
        break;
      case GraphUnit.AVG:
        writer.writeByte(1);
        break;
      case GraphUnit.MAX:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphUnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GraphModelAdapter extends TypeAdapter<GraphModel> {
  @override
  final int typeId = 15;

  @override
  GraphModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GraphModel(
      graphType: fields[0] as GraphType,
      graphUnit: fields[1] as GraphUnit,
    );
  }

  @override
  void write(BinaryWriter writer, GraphModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.graphType)
      ..writeByte(1)
      ..write(obj.graphUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

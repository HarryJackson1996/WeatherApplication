import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'graph_model.g.dart';

@HiveType(typeId: 13)
enum GraphType {
  @HiveField(0)
  LINE,
  @HiveField(1)
  BAR,
}

@HiveType(typeId: 14)
enum GraphUnit {
  @HiveField(0)
  MIN,
  @HiveField(1)
  AVG,
  @HiveField(2)
  MAX,
}

@HiveType(typeId: 15)
class GraphModel extends Equatable {
  @HiveField(0)
  final GraphType graphType;
  @HiveField(1)
  final GraphUnit graphUnit;

  GraphModel({
    this.graphType,
    this.graphUnit,
  });

  GraphModel copyWith({
    GraphType graphType,
    GraphUnit graphUnit,
  }) {
    return GraphModel(
      graphType: graphType ?? this.graphType,
      graphUnit: graphUnit ?? this.graphUnit,
    );
  }

  @override
  List<Object> get props => [graphType, graphUnit];
}

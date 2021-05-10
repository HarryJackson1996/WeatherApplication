part of 'graph_bloc.dart';

abstract class GraphEvent extends Equatable {
  const GraphEvent();

  @override
  List<Object> get props => [];
}

class GraphChangedEvent extends GraphEvent {
  final GraphType graphType;

  GraphChangedEvent({this.graphType});

  @override
  List<Object> get props => [graphType];
}

class GraphUnitChangedEvent extends GraphEvent {
  final GraphUnit graphUnit;

  GraphUnitChangedEvent({this.graphUnit});

  @override
  List<Object> get props => [graphUnit];
}

class GraphInitEvent extends GraphEvent {
  final String id;

  GraphInitEvent({this.id});

  @override
  List<Object> get props => [id];
}

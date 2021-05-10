part of 'graph_bloc.dart';

class GraphState extends Equatable {
  final GraphModel graphModel;

  const GraphState({this.graphModel});

  @override
  List<Object> get props => [graphModel];
}

class GraphUpdatedSuccessState extends GraphState {
  final GraphType graphType;

  GraphUpdatedSuccessState({this.graphType});

  @override
  List<Object> get props => [graphType];
}

class GraphLoading extends GraphState {}

class GraphError extends GraphState {}

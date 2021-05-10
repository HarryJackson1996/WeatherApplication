import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/models/graph_model.dart';
import 'package:weather_application/repositories/graph_repository.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final GraphRepository graphRepository;

  GraphBloc({this.graphRepository})
      : super(
          GraphState(
            graphModel: GraphModel(
              graphType: GraphType.BAR,
              graphUnit: GraphUnit.AVG,
            ),
          ),
        );

  @override
  Stream<GraphState> mapEventToState(
    GraphEvent event,
  ) async* {
    if (event is GraphInitEvent) {
      yield* _mapGraphInitEventToState(event);
    }
    if (event is GraphChangedEvent) {
      yield* _mapGraphChangedToState(event);
    }
    if (event is GraphUnitChangedEvent) {
      yield* _mapGraphUnitChangedToState(event);
    }
  }

  Stream<GraphState> _mapGraphInitEventToState(GraphInitEvent event) async* {
    yield GraphLoading();
    try {
      GraphModel graphModel = await graphRepository.get(event.id);
      yield GraphState(graphModel: graphModel);
    } catch (e) {
      yield GraphError();
    }
  }

  Stream<GraphState> _mapGraphChangedToState(GraphChangedEvent event) async* {
    try {
      GraphModel graphModel = await graphRepository.get(graphBoxKey);
      GraphModel newGraphModel = graphModel.copyWith(graphType: event.graphType);
      await graphRepository.put(graphBoxKey, newGraphModel);
      yield GraphState(graphModel: newGraphModel);
    } catch (e) {
      print(e);
    }
  }

  Stream<GraphState> _mapGraphUnitChangedToState(GraphUnitChangedEvent event) async* {
    try {
      GraphModel graphModel = await graphRepository.get(graphBoxKey);
      GraphModel newGraphModel = graphModel.copyWith(graphUnit: event.graphUnit);
      await graphRepository.put(graphBoxKey, newGraphModel);
      yield GraphState(graphModel: newGraphModel);
    } catch (e) {
      print(e);
    }
  }
}

import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/models/graph_model.dart';

class GraphRepository implements IRepository {
  final IRepository<GraphModel> box;

  GraphRepository({
    this.box,
  }) : assert(box != null);

  @override
  Future<GraphModel> get(id, {String city, String lat, String lon}) async {
    GraphModel graph = await this.box.get(id);
    if (graph != null) {
      return graph;
    } else {
      GraphModel newGraph = GraphModel(
        graphType: GraphType.BAR,
        graphUnit: GraphUnit.AVG,
      );
      await this.box.put(id, newGraph);
      return newGraph;
    }
  }

  @override
  Future<void> put(id, object) async {
    await this.box.put(id, object);
    return;
  }
}

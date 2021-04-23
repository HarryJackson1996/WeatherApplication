import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/models/search_model.dart';

class SearchRepository implements IRepository {
  final IRepository<Search> box;

  SearchRepository({
    this.box,
  }) : assert(box != null);

  @override
  Future<Search> get(id, {String city, String lat, String lon}) async {
    Search locations = await this.box.get(id);
    if (locations != null) {
      return locations;
    } else {
      Search newLocations = Search(Map<String, String>());
      await this.box.put(id, newLocations);
      return newLocations;
    }
  }

  @override
  Future<void> put(id, object) async {
    await this.box.put(id, object);
    return;
  }
}

import 'package:hive/hive.dart';
import 'package:weather_application/interfaces/i_repository.dart';

class HiveRepository<T> implements IRepository<T> {
  final Box _box;

  HiveRepository(this._box) : assert(_box != null);

  @override
  Future<dynamic> get(id, {String city, String lat, String lon}) async {
    if (this.isBoxOpen && this._box.isNotEmpty) {
      try {
        return this._box.get(id);
      } catch (e) {
        return e;
      }
    }

    return null;
  }

  @override
  Future<void> put(id, T object) async {
    if (this.isBoxOpen) {
      await this._box.put(id, object);
    }

    return;
  }

  bool get isBoxOpen => (this._box?.isOpen ?? true);
}

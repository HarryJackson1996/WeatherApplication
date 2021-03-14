abstract class IRepository<T> {
  Future<dynamic> get(dynamic id, [String cityName, String unit]);
  Future<void> put(dynamic id, T object);
}

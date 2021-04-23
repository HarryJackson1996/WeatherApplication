abstract class IRepository<T> {
  Future<dynamic> get(
    dynamic id, {
    String city,
    String lat,
    String lon,
  });

  Future<void> put(dynamic id, T object);
}

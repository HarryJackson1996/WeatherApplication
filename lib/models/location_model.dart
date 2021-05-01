import 'package:hive/hive.dart';
part 'location_model.g.dart';

@HiveType(typeId: 0)
class Location {
  Location({
    this.lat,
    this.lon,
    this.name,
    this.country,
  });

  @HiveField(0)
  final String lat;
  @HiveField(1)
  final String lon;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String country;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json["coord"]["lat"].toString(),
      lon: json["coord"]["lon"].toString(),
      country: json["sys"]["country"],
      name: json["name"],
    );
  }
}

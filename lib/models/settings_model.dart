import 'package:hive/hive.dart';
part 'settings_model.g.dart';

@HiveType(typeId: 3)
enum TempUnit {
  @HiveField(0)
  CELSIUS,
  @HiveField(1)
  FAHRENHEIT
}

@HiveType(typeId: 4)
class Settings {
  @HiveField(0)
  TempUnit tempUnit;

  Settings({
    this.tempUnit,
  });
}

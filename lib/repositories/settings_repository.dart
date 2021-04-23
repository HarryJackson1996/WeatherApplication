import 'package:weather_application/interfaces/i_repository.dart';
import '../models/settings_model.dart';

class SettingsRepository implements IRepository {
  final IRepository<Settings> box;

  SettingsRepository({
    this.box,
  }) : assert(box != null);

  @override
  Future<Settings> get(id, {String city, String lat, String lon}) async {
    final settings = await this.box.get(id);
    if (settings != null) {
      return settings;
    } else {
      final Settings settings = Settings(
        tempUnit: TempUnit.CELSIUS,
        onboarding: false,
        locationPermissions: null,
      );
      await put(id, settings);
      return settings;
    }
  }

  @override
  Future<void> put(id, object) async {
    await this.box.put(id, object);
  }
}

import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/themes/app_themes.dart';

class ThemeRepository implements IRepository {
  final IRepository<AppTheme> box;

  ThemeRepository({
    this.box,
  }) : assert(box != null);

  @override
  Future<AppTheme> get(id, [String cityName, String unit]) async {
    final themeData = await this.box.get(id);
    if (themeData != null) {
      return themeData;
    } else {
      await put(id, AppTheme.LIGHT);
      return AppTheme.LIGHT;
    }
  }

  @override
  Future<void> put(id, object) async {
    await this.box.put(id, object);
  }
}

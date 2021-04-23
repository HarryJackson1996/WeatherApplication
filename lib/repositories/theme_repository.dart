import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/themes/app_themes.dart';

class ThemeRepository implements IRepository<AppTheme> {
  final IRepository<AppTheme> box;

  ThemeRepository({
    this.box,
  }) : assert(box != null);

  @override
  Future<AppTheme> get(id, {String city, String lat, String lon}) async {
    final appTheme = await this.box.get(id);
    if (appTheme != null) {
      return appTheme;
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

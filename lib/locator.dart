import 'package:get_it/get_it.dart';
import 'package:weather_application/services/analytics_service.dart';
import 'package:weather_application/services/location_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AnalyticsService>(AnalyticsService());
  getIt.registerSingleton<LocationService>(LocationService());
}

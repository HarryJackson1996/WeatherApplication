import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'app.dart';
import 'models/weather_model.dart';

void _registerDeviceOrientations() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _registerTypeAdapters() {
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(ForecastAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  await Hive.initFlutter();
  _registerTypeAdapters();
  await Hive.openBox<Weather>(currentBox);
  await Hive.openBox<Forecast>(forecastBox);
  runApp(MyApp());
}

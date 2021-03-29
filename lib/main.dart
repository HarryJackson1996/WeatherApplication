import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'app.dart';
import 'consts/box_consts.dart';
import 'models/weather_model.dart';
import 'package:weather_application/models/settings_model.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void _registerDeviceOrientations() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void _registerTypeAdapters() {
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(ForecastAdapter());
  Hive.registerAdapter(AppThemeAdapter());
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(TempUnitAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  await Hive.initFlutter();
  _registerTypeAdapters();
  await Hive.openBox<Weather>(WeatherBoxKey);
  await Hive.openBox<AppTheme>(themeBoxKey);
  await Hive.openBox<Settings>(settingsBoxKey);
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

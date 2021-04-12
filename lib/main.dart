import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_application/blocs/search/search_bloc.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/models/search_model.dart';
import 'package:weather_application/repositories/search_repository.dart';
import 'package:weather_application/repositories/settings_repository.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'app.dart';
import 'blocs/settings/settings_bloc.dart';
import 'blocs/theme/theme_bloc.dart';
import 'blocs/weather/weather_bloc.dart';
import 'clients/weather_client.dart';
import 'models/weather_model.dart';
import 'repositories/hive_repository.dart';
import 'repositories/theme_repository.dart';
import 'consts/box_consts.dart';
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
  Hive.registerAdapter(SearchAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  await Hive.initFlutter();
  _registerTypeAdapters();
  var weatherBox = await Hive.openBox<Weather>(weatherBoxKey);
  var themeBox = await Hive.openBox<AppTheme>(themeBoxKey);
  var settingsBox = await Hive.openBox<Settings>(settingsBoxKey);
  var searchBox = await Hive.openBox<Search>(searchBoxKey);

  Bloc.observer = SimpleBlocDelegate();
  var myCity = weatherBox.get(weatherBoxKey)?.name ?? 'London';
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(
            repository: WeatherRepository(
              client: WeatherClient(),
              box: HiveRepository(weatherBox),
            ),
          )..add(
              WeatherFetchedEvent(
                city: myCity,
                id: weatherBoxKey,
                unit: 'metric',
              ),
            ),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            repository: ThemeRepository(
              box: HiveRepository(themeBox),
            ),
          )..add(
              ThemeFetchedEvent(
                id: themeBoxKey,
              ),
            ),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            repository: SettingsRepository(
              box: HiveRepository(settingsBox),
            ),
          )..add(
              SettingsInitEvent(settingsBoxKey),
            ),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(
            repository: SearchRepository(
              box: HiveRepository(searchBox),
            ),
            weatherBloc: BlocProvider.of<WeatherBloc>(context),
          )..add(SearchFetchedEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

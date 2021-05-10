import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_application/blocs/graph/graph_bloc.dart';
import 'package:weather_application/locator.dart';
import 'package:weather_application/models/graph_model.dart';
import 'package:weather_application/models/location_model.dart';
import 'package:weather_application/models/models.dart';
import 'package:weather_application/repositories/graph_repository.dart';
import 'package:weather_application/repositories/repositories.dart';
import 'blocs/blocs.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'app.dart';
import 'clients/weather_client.dart';
import 'consts/box_consts.dart';

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
  Hive.registerAdapter(DailyAdapter());
  Hive.registerAdapter(CurrentAdapter());
  Hive.registerAdapter(WeatherElementAdapter());
  Hive.registerAdapter(FeelsLikeAdapter());
  Hive.registerAdapter(TempAdapter());
  Hive.registerAdapter(ForecastAdapter());
  Hive.registerAdapter(AppThemeAdapter());
  Hive.registerAdapter(LocationAdapter());
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(TempUnitAdapter());
  Hive.registerAdapter(SearchAdapter());
  Hive.registerAdapter(LocationPermissionsAdapter());
  Hive.registerAdapter(GraphTypeAdapter());
  Hive.registerAdapter(GraphUnitAdapter());
  Hive.registerAdapter(GraphModelAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  setup();
  _registerTypeAdapters();
  var weatherBox = await Hive.openBox<Weather>(weatherBoxKey);
  var themeBox = await Hive.openBox<AppTheme>(themeBoxKey);
  var settingsBox = await Hive.openBox<Settings>(settingsBoxKey);
  var searchBox = await Hive.openBox<Search>(searchBoxKey);
  var graphBox = await Hive.openBox<GraphModel>(graphBoxKey);
  var myCity = weatherBox.get(weatherBoxKey)?.name ?? '';

  Bloc.observer = SimpleBlocDelegate();
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
                id: weatherBoxKey,
                city: myCity,
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
        BlocProvider<GraphBloc>(
          create: (context) => GraphBloc(
            graphRepository: GraphRepository(
              box: HiveRepository(graphBox),
            ),
          )..add(
              GraphInitEvent(id: graphBoxKey),
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
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'app.dart';
import 'blocs/theme/theme_bloc.dart';
import 'blocs/weather/weather_bloc.dart';
import 'clients/weather_client.dart';
import 'models/weather_model.dart';
import 'repositories/hive_repository.dart';
import 'repositories/theme_repository.dart';
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
  Hive.registerAdapter(ForecastAdapter());
  Hive.registerAdapter(AppThemeAdapter());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _registerDeviceOrientations();
  await Hive.initFlutter();
  _registerTypeAdapters();
  var weatherBox = await Hive.openBox<Weather>(weatherBoxKey);
  var themeBox = await Hive.openBox<AppTheme>(themeBoxKey);
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
      ],
      child: MyApp(),
    ),
  );
}

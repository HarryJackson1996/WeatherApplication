import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weather_application/blocs/settings/settings_bloc.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/models/settings_model.dart';
import 'package:weather_application/repositories/hive_repository.dart';
import 'package:weather_application/repositories/settings_repository.dart';
import 'package:weather_application/repositories/theme_repository.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'blocs/theme/theme_bloc.dart';
import 'consts/box_consts.dart';
import 'models/weather_model.dart';
import './utils/router.dart' as MyRouter;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var WeatherBoxKeyRef = Hive.box<Weather>(WeatherBoxKey);
    var myCity = WeatherBoxKeyRef.get(WeatherBoxKey)?.name ?? 'London';
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(
            repository: WeatherRepository(
              client: WeatherClient(),
              box: HiveRepository(WeatherBoxKeyRef),
            ),
          )..add(WeatherFetchedEvent(city: myCity, id: WeatherBoxKey, unit: 'metric')),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(
            repository: ThemeRepository(
              box: HiveRepository(Hive.box<AppTheme>(themeBoxKey)),
            ),
          )..add(
              ThemeFetchedEvent(id: themeBoxKey),
            ),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(
            repository: SettingsRepository(
              box: HiveRepository(Hive.box<Settings>(settingsBoxKey)),
            ),
          )..add(
              SettingsInitEvent(settingsBoxKey),
            ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, AppTheme>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: MyRouter.Router.generateRoute,
            theme: appThemeData[theme],
          );
        },
      ),
    );
  }
}

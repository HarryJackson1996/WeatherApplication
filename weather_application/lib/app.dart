import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/repositories/hive_repository.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/screens/weather/weather_screen.dart';
import 'models/weather_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(
            repository: WeatherRepository(
              client: WeatherClient(),
              box: HiveRepository(
                Hive.box<Weather>(currentBox),
              ),
            ),
          )..add(WeatherFetchedEvent(city: 'London', id: currentBox, unit: 'metric')),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 600),
              child: _mapWeatherStateToWidget(state),
            );
          }),
        ),
      ),
    );
  }

  Widget _mapWeatherStateToWidget(WeatherState state) {
    if (state is WeatherLoadSuccess) {
      return WeatherScreen(state.weather);
    }
    if (state is WeatherLoadFailure) {
      return Center(child: Text('Unable to fetch Weather'));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/repositories/hive_repository.dart';
import 'package:weather_application/repositories/weather_repository.dart';
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherLoadSuccess) {
                  return Text(state.weather.country);
                }
                if (state is WeatherLoadFailure) {
                  return Center(child: Text('Unable to fetch Weather'));
                } else {
                  return CircularProgressIndicator();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

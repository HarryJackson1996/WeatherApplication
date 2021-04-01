import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc({@required this.repository})
      : assert(repository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherFetchedEvent) {
      yield* _mapWeatherFetchedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherFetchedToState(WeatherFetchedEvent event) async* {
    if (state is! WeatherLoading) {
      yield WeatherLoading();
    }
    try {
      final Weather weather = await repository.getCurrentWeather(event.id, event.city, event.unit);
      print(weather);
      yield WeatherLoadSuccess(weather: weather, city: event.city);
    } catch (e) {
      yield WeatherLoadFailure(e);
    }
  }
}

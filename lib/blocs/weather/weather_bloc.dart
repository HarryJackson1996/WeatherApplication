import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/utils/date_utils.dart';

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
    if (event is WeatherRefreshedEvent) {
      yield* _mapWeatherRefreshedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRefreshedToState(WeatherRefreshedEvent event) async* {
    if (MyDateUtils.timeDifference(event.weather.current.dt, 10)) {
      add(WeatherFetchedEvent(city: event.weather.name, id: event.id));
    } else {
      yield WeatherLoadSuccess(weather: event.weather, city: event.weather.name);
    }
  }

  Stream<WeatherState> _mapWeatherFetchedToState(WeatherFetchedEvent event) async* {
    if (state is! WeatherLoading) {
      yield WeatherLoading();
    }
    try {
      final Weather weather = await repository.getCurrentWeather(
        event.id,
        city: event.city,
        lat: event.lat,
        lon: event.lon,
      );
      yield WeatherLoadSuccess(weather: weather, city: event.city);
    } catch (e) {
      yield WeatherLoadFailure(e);
    }
  }
}

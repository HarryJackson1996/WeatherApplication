part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRefreshedEvent extends WeatherEvent {
  final Weather weather;
  final String id;

  WeatherRefreshedEvent({
    this.weather,
    this.id,
  });

  @override
  List<Object> get props => [weather, id];
}

class WeatherSearchedEvent extends WeatherEvent {
  final String id;
  final String city;

  const WeatherSearchedEvent({
    this.id,
    this.city,
  });

  @override
  List<Object> get props => [id, city];
}

class WeatherFetchedEvent extends WeatherEvent {
  final String id;
  final String city;
  final String lat;
  final String lon;

  const WeatherFetchedEvent({
    this.id,
    this.city,
    this.lat,
    this.lon,
  });

  @override
  List<Object> get props => [id, city, lat, lon];
}

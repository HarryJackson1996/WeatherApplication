part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherFetchedEvent extends WeatherEvent {
  final String id;
  final String city;
  final String unit;

  const WeatherFetchedEvent({
    this.id,
    this.city,
    this.unit,
  });

  @override
  List<Object> get props => [id, city, unit];
}

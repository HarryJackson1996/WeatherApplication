part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  WeatherLoadSuccess({@required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {}

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:weather_application/models/weather_model.dart';
part 'forecast_model.g.dart';

@HiveType(typeId: 1)
class Forecast {
  @HiveField(0)
  List<Weather> forecast;

  Forecast({this.forecast});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecast: List<Weather>.from(
        json['list'].map(
          (weather) => Weather.fromJson(weather),
        ),
      ),
    );
  }
}

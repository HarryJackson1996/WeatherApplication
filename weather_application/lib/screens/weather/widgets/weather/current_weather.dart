import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'weather_leading_widget.dart';
import 'weather_trailing_widget.dart';

class CurrentWeather extends StatelessWidget {
  final Weather weather;

  CurrentWeather(this.weather) : assert(weather != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Column(
        children: [
          Expanded(flex: 2, child: WeatherLeadingWidget(weather)),
          Expanded(flex: 1, child: WeatherTrailingWidget(weather)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'weather_leading_widget.dart';
import 'weather_trailing_widget.dart';
import 'package:weather_application/models/settings_model.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Weather weather;
  final Settings settings;

  CurrentWeatherCard(this.weather, this.settings) : assert(weather != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Column(
        children: [
          Expanded(flex: 2, child: WeatherLeadingWidget(weather, settings)),
          Expanded(flex: 1, child: WeatherTrailingWidget(weather, settings)),
        ],
      ),
    );
  }
}

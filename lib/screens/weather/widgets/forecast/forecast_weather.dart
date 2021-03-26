import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'forecast_weather_item.dart';
import 'package:weather_application/models/settings_model.dart';

class ForecastWeather extends StatelessWidget {
  final List<Weather> forecast;
  final Settings settings;

  ForecastWeather(this.forecast, this.settings) : assert(forecast != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: ThemedText(
                  'Forecast',
                  themedTextStyle: ThemedTextStyle.H2,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.separated(
              separatorBuilder: (context, index) => Container(
                width: 10.0,
              ),
              padding: EdgeInsets.only(bottom: 8.0, left: 20.0, right: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: forecast.length,
              itemBuilder: (BuildContext context, int index) {
                return ForecastWeatherItem(forecast[index], settings);
              },
            ),
          ),
        ],
      ),
    );
  }
}

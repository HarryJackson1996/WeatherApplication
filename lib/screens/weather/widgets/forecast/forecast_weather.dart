import 'package:flutter/material.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'forecast_weather_item.dart';

class ForecastWeather extends StatelessWidget {
  final List<Weather> forecast;

  ForecastWeather(this.forecast) : assert(forecast != null);

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
                padding: EdgeInsets.only(left: textPadding),
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
              padding: EdgeInsets.only(left: myPadding, right: myPadding, bottom: myPadding / 2),
              separatorBuilder: (context, index) => Container(
                width: 10.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: forecast.length,
              itemBuilder: (BuildContext context, int index) {
                return ForecastWeatherItem(forecast[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

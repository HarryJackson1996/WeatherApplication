import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/models/weather_model.dart';

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
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Forecast',
                  style: GoogleFonts.getFont(
                    'Muli',
                    textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
                  ),
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
              padding: EdgeInsets.only(bottom: 8.0, left: 20.0),
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

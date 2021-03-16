import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/weather_icons_icons.dart';

class ForecastWeatherItem extends StatelessWidget {
  final Weather weather;

  ForecastWeatherItem(this.weather);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        child: Text(
                          MyDateUtils.convertUnixToDateString(weather.dt, 'EEE, HH:00'),
                          style: GoogleFonts.getFont(
                            'Muli',
                            textStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        child: Icon(
                          WeatherIcons.getWeatherIcon(weather.icon),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        child: Text(
                          weather.temp.toString() + "\u00B0",
                          style: GoogleFonts.getFont(
                            'Muli',
                            textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

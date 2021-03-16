import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/weather_icons_icons.dart';
import 'package:weather_application/widgets/divider.dart';
import 'vertical_weather_item.dart';

class WeatherLeadingWidget extends StatelessWidget {
  final Weather weather;

  WeatherLeadingWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            WeatherIcons.getWeatherIcon(weather.icon),
            size: 90.0,
          ),
          Text(
            weather.description,
            style: GoogleFonts.getFont(
              'Muli',
              textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              MyDateUtils.convertUnixToDateString(weather.dt, 'EEEE, d MMMM yyyy'),
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Muli',
                textStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
              ),
            ),
          ),
          Text(
            weather.temp.toString() + "\u00B0",
            style: GoogleFonts.getFont(
              'Muli',
              textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 80.0),
            ),
          ),
          Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VerticalWeatherWidget(
                  primaryText: 'Min',
                  value: weather.tempMin.toString() + "\u00B0",
                ),
                MyDivider(dividerType: VerticalDivider),
                VerticalWeatherWidget(
                  primaryText: 'Max',
                  value: weather.tempMax.toString() + "\u00B0",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

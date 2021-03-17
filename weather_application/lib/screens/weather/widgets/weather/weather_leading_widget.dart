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
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                WeatherIcons.getWeatherIcon(weather.icon),
                size: 60.0,
              ),
              Text(
                weather.description,
                style: GoogleFonts.getFont(
                  'Muli',
                  textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
                ),
              ),
              Text(
                MyDateUtils.convertUnixToDateString(weather.dt, 'EEEE, d MMMM yyyy'),
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Muli',
                  textStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
                ),
              ),
              Text(
                weather.temp + "\u00B0",
                style: GoogleFonts.getFont(
                  'Muli',
                  textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 50.0),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalWeatherWidget(
                primaryText: 'Min',
                value: weather.tempMin + "\u00B0",
              ),
              MyDivider(dividerType: VerticalDivider),
              VerticalWeatherWidget(
                primaryText: 'Max',
                value: weather.tempMax + "\u00B0",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

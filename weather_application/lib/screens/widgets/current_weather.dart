import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/weather_icons_icons.dart';

import 'column_weather_widget.dart';
import 'extra_weather_item.dart';

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
          Expanded(flex: 3, child: PrimaryWeatherWidget(weather)),
          Expanded(flex: 1, child: BottomWeatherWidget(weather)),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  final dynamic dividerType;
  final Color color;
  MyDivider({this.dividerType, this.color});
  @override
  Widget build(BuildContext context) {
    return dividerType == VerticalDivider
        ? VerticalDivider(
            thickness: 1.0,
            indent: 8.0,
            endIndent: 8.0,
            color: color,
          )
        : Divider(
            thickness: 1.0,
            indent: 8.0,
            endIndent: 8.0,
            color: color,
          );
  }
}

class PrimaryWeatherWidget extends StatelessWidget {
  final Weather weather;

  PrimaryWeatherWidget(this.weather);
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
                ColumnWeatherWidget(
                  primaryText: 'Min',
                  value: weather.tempMin.toString() + "\u00B0",
                ),
                ColumnWeatherWidget(
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

class BottomWeatherWidget extends StatelessWidget {
  final Weather weather;

  BottomWeatherWidget(this.weather);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyDivider(),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ExtraWeatherItem(
                  primaryText: 'Humidity',
                  iconData: WeatherIcons.humidity,
                  value: weather.humidity.toString() + "%",
                ),
              ),
              MyDivider(dividerType: VerticalDivider),
              Expanded(
                flex: 1,
                child: ExtraWeatherItem(
                  primaryText: 'Windspeed',
                  iconData: WeatherIcons.windy_2,
                  value: weather.windSpeed.toString() + " m/s",
                ),
              ),
            ],
          ),
        ),
        MyDivider(),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: ExtraWeatherItem(
                  primaryText: 'Sunrise',
                  iconData: WeatherIcons.sunrise,
                  value: MyDateUtils.convertUnixToDateString(weather.sunrise, 'Hm'),
                ),
              ),
              MyDivider(dividerType: VerticalDivider),
              Expanded(
                child: ExtraWeatherItem(
                  primaryText: 'Sunset',
                  iconData: WeatherIcons.sunset,
                  value: MyDateUtils.convertUnixToDateString(weather.sunset, 'Hm'),
                ),
              ),
            ],
          ),
        ),
        MyDivider(
          color: Colors.transparent,
        ),
      ],
    );
  }
}

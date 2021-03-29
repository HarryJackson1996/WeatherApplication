import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/utils/temp_utils.dart';
import 'package:weather_application/utils/weather_icons_icons.dart';
import 'package:weather_application/widgets/divider.dart';
import 'package:weather_application/widgets/themed_text.dart';
import 'vertical_weather_item.dart';
import 'package:weather_application/models/settings_model.dart';

class WeatherLeadingWidget extends StatelessWidget {
  final Weather weather;
  final Settings settings;

  WeatherLeadingWidget(this.weather, this.settings);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                WeatherIcons.getWeatherIcon(weather.icon),
                size: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 3.0),
                child: ThemedText(
                  weather.description,
                  themedTextStyle: ThemedTextStyle.H2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 3.0),
                child: ThemedText(
                  MyDateUtils.unixToDateString(weather.dt, 'EEEE, d MMMM yyyy'),
                ),
              ),
              ThemedText(
                TempUtils.updateTemp(weather.temp, settings.tempUnit) + "\u00B0",
                themedTextStyle: ThemedTextStyle.H1,
                fontSize: 60.0,
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
                value: TempUtils.updateTemp(weather.tempMin, settings.tempUnit) + "\u00B0",
              ),
              MyDivider(dividerType: VerticalDivider),
              VerticalWeatherWidget(
                primaryText: 'Max',
                value: TempUtils.updateTemp(weather.tempMax, settings.tempUnit) + "\u00B0",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

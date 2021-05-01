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
                WeatherIcons.getWeatherIcon(weather.current.weather[0].icon),
                size: 60.0,
              ),
              ThemedText(
                weather.current.weather[0].description,
                themedTextStyle: ThemedTextStyle.H2,
              ),
              SizedBox(
                height: 5.0,
              ),
              ThemedText(
                MyDateUtils.unixToDateString(weather.current.dt, 'EEEE, d MMMM yyyy'),
              ),
              SizedBox(
                height: 20.0,
              ),
              ThemedText(
                TempUtils.updateTemp(weather.current.temp.toString(), settings.tempUnit) + "\u00B0",
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
                value: TempUtils.updateTemp(weather.daily[0].temp.min.toString(), settings.tempUnit) + "\u00B0",
              ),
              MyDivider(dividerType: VerticalDivider),
              VerticalWeatherWidget(
                primaryText: 'Max',
                value: TempUtils.updateTemp(weather.daily[0].temp.max.toString(), settings.tempUnit) + "\u00B0",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

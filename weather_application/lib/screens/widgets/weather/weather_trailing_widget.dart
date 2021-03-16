import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/weather_icons_icons.dart';
import 'package:weather_application/widgets/divider.dart';

import 'horizontal_weather_item.dart';

class WeatherTrailingWidget extends StatelessWidget {
  final Weather weather;

  WeatherTrailingWidget(this.weather);

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
                child: HorizontalWeatherItem(
                  primaryText: 'Humidity',
                  iconData: WeatherIcons.humidity,
                  value: weather.humidity.toString() + "%",
                ),
              ),
              MyDivider(dividerType: VerticalDivider),
              Expanded(
                flex: 1,
                child: HorizontalWeatherItem(
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
                child: HorizontalWeatherItem(
                  primaryText: 'Sunrise',
                  iconData: WeatherIcons.sunrise,
                  value: MyDateUtils.convertUnixToDateString(weather.sunrise, 'Hm'),
                ),
              ),
              MyDivider(dividerType: VerticalDivider),
              Expanded(
                child: HorizontalWeatherItem(
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

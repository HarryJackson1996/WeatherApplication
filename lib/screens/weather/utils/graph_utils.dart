import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/blocs/blocs.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/temp_utils.dart';

class GraphUtils {
  static String formatBottomData(List<Daily> dailyWeather, int index, String format) {
    return MyDateUtils.unixToDateString(dailyWeather[index].dt, 'E');
  }

  static List<BarChartGroupData> getBarData(
    List<Daily> dailyWeather,
    BuildContext context,
  ) {
    List<BarChartGroupData> groupData = [];

    dailyWeather.toList().forEach((element) {
      if (dailyWeather.indexOf(element) != 0) {
        groupData.add(
          makeGroupData(
            dailyWeather.indexOf(element),
            double.parse(
              TempUtils.updateTemp(
                element.temp.day.toString(),
                BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit,
              ),
            ),
            getMaxTemp(dailyWeather, context),
            context,
          ),
        );
      }
    });

    return groupData;
  }

  static double getMaxTemp(List<Daily> dailyWeather, BuildContext context) {
    var maxWeather = dailyWeather.reduce((value, element) => (value.temp.day > element.temp.day ? value : element));
    return double.parse(
      TempUtils.updateTemp(
        maxWeather.temp.day.toString(),
        BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit,
      ),
    );
  }
}

BarChartGroupData makeGroupData(
  int x,
  double y,
  double maxY,
  BuildContext context, {
  Color barColor,
  double width = 16,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        y: y,
        colors: [Theme.of(context).primaryColor],
        width: width,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          colors: [
            Colors.transparent,
          ],
        ),
      ),
    ],
    showingTooltipIndicators: [0],
  );
}

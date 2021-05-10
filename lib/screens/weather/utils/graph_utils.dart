import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/blocs/blocs.dart';
import 'package:weather_application/blocs/graph/graph_bloc.dart';
import 'package:weather_application/models/graph_model.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/date_utils.dart';
import 'package:weather_application/utils/temp_utils.dart';

class GraphUtils {
  static String formatBottomData(List<Daily> dailyWeather, int index) {
    return MyDateUtils.unixToDateString(dailyWeather[index].dt, 'E');
  }

  static List<LineChartBarData> getLineData(List<Daily> daily, BuildContext context, bool max) {
    List<LineChartBarData> listLineCharts = [];

    listLineCharts.add(
      LineChartBarData(
        spots: calculateSpotData(daily, max, context),
        barWidth: 3.0,
        isStrokeCapRound: true,
        colors: [Theme.of(context).primaryColor],
        showingIndicators: [0],
        isCurved: false,
      ),
    );

    return listLineCharts;
  }

  static LineChartBarData makeGroupLineData(
    List<Daily> daily,
    BuildContext context,
    bool max,
  ) {
    return LineChartBarData(
      spots: calculateSpotData(daily, max, context),
      barWidth: 3.0,
      colors: [Colors.red],
      showingIndicators: [0],
    );
  }

  static List<FlSpot> calculateSpotData(List<Daily> dailyWeather, bool max, BuildContext context) {
    final List<FlSpot> spots = [];
    GraphUnit graphUnit = BlocProvider.of<GraphBloc>(context).state.graphModel.graphUnit;
    for (Daily daily in dailyWeather) {
      if (dailyWeather.indexOf(daily) != 0) {
        spots.add(
          FlSpot(
            dailyWeather.indexOf(daily).toDouble(),
            double.parse(
              TempUtils.updateTemp(
                graphUnit == GraphUnit.AVG
                    ? daily.temp.day.round().toString()
                    : graphUnit == GraphUnit.MAX
                        ? double.parse(daily.temp.max).round().toString()
                        : double.parse(daily.temp.min).round().toString(),
                BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit,
              ),
            ),
          ),
        );
      }
    }

    return spots;
  }

  static List<BarChartGroupData> getBarData(
    List<Daily> dailyWeather,
    BuildContext context,
  ) {
    List<BarChartGroupData> groupData = [];
    GraphUnit graphUnit = BlocProvider.of<GraphBloc>(context).state.graphModel.graphUnit;

    dailyWeather.toList().forEach((element) {
      if (dailyWeather.indexOf(element) != 0) {
        groupData.add(
          makeGroupData(
            dailyWeather.indexOf(element),
            double.parse(
              TempUtils.updateTemp(
                graphUnit == GraphUnit.AVG
                    ? element.temp.day.toString()
                    : graphUnit == GraphUnit.MIN
                        ? element.temp.min
                        : element.temp.max,
                BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit,
              ),
            ),
            context,
          ),
        );
      }
    });

    return groupData;
  }

  static BarChartGroupData makeGroupData(
    int x,
    double y,
    BuildContext context, {
    Color barColor,
    double width = 16,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y.roundToDouble(),
          colors: [Theme.of(context).primaryColor],
          width: width,
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }

  static double getMinOrMaxTemp(List<Daily> dailyWeather, BuildContext context, bool max) {
    var maxWeather;
    if (max) {
      maxWeather = dailyWeather.reduce((value, element) => (double.parse(value.temp.max) > double.parse(element.temp.max) ? value : element));
    } else {
      maxWeather = dailyWeather.reduce((value, element) => (double.parse(value.temp.min) < double.parse(element.temp.min) ? value : element));
    }
    return double.parse(
      TempUtils.updateTemp(
        max ? maxWeather.temp.max : maxWeather.temp.min,
        BlocProvider.of<SettingsBloc>(context).state.settings.tempUnit,
      ),
    );
  }
}

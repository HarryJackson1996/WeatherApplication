import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/screens/weather/utils/graph_utils.dart';

class LineGraph extends StatelessWidget {
  final List<Daily> daily;
  LineGraph({this.daily});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: false,
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipMargin: 20,
            tooltipBgColor: Theme.of(context).backgroundColor,
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            margin: 10,
            getTitles: (value) {
              return GraphUtils.formatBottomData(daily, value.toInt());
            },
          ),
          leftTitles: SideTitles(
            interval: 2,
            showTitles: true,
            getTextStyles: (value) => TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            margin: 15,
            reservedSize: 10,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              width: 4,
              color: Theme.of(context).primaryColor,
            ),
            left: BorderSide(
              width: 4,
              color: Theme.of(context).primaryColor,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        minX: 1,
        maxX: (daily.length - 1).toDouble(),
        maxY: GraphUtils.getMinOrMaxTemp(daily, context, true).roundToDouble() + 1,
        minY: GraphUtils.getMinOrMaxTemp(daily, context, false).roundToDouble() - 1,
        lineBarsData: GraphUtils.getLineData(daily, context, true),
      ),
      swapAnimationDuration: Duration(milliseconds: 350),
      swapAnimationCurve: Curves.decelerate,
    );
  }
}

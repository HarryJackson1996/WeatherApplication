import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/screens/weather/utils/graph_utils.dart';

class BarGraph extends StatelessWidget {
  final List<Daily> daily;
  BarGraph({this.daily});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            direction: TooltipDirection.top,
            fitInsideVertically: true,
            tooltipPadding: EdgeInsets.only(top: -30),
            tooltipBgColor: Colors.transparent,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '',
                TextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: rod.y.round().toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            margin: 10,
            getTitles: (double value) {
              return GraphUtils.formatBottomData(daily, value.toInt());
            },
          ),
          leftTitles: SideTitles(
            showTitles: false,
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: GraphUtils.getBarData(daily, context),
      ),
      swapAnimationDuration: Duration(milliseconds: 300),
    );
  }
}

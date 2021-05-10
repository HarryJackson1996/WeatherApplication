import 'package:flutter/material.dart';
import 'package:weather_application/blocs/blocs.dart';
import 'package:weather_application/blocs/graph/graph_bloc.dart';
import 'package:weather_application/models/graph_model.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/screens/weather/widgets/graphs/bar_graph.dart';
import 'package:weather_application/screens/weather/widgets/graphs/graph_buttons.dart';
import 'package:weather_application/screens/weather/widgets/graphs/line_graph.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';

class GraphSelector extends StatefulWidget {
  final List<Daily> daily;

  GraphSelector({this.daily});

  @override
  _GraphSelectorState createState() => _GraphSelectorState();
}

class _GraphSelectorState extends State<GraphSelector> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(
      builder: (context, state) {
        if (state is GraphState) {
          return AspectRatio(
            aspectRatio: 1,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ThemedText(
                              'Forecast',
                              themedTextStyle: ThemedTextStyle.H2,
                              textAlign: TextAlign.left,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                child: GraphButtons(),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                child: Icon(
                                  state.graphModel.graphType == GraphType.LINE ? Icons.bar_chart : Icons.show_chart,
                                  size: 25.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onTap: () async {
                                  GraphType currentType;
                                  if (state.graphModel.graphType == GraphType.BAR) {
                                    currentType = GraphType.LINE;
                                  } else {
                                    currentType = GraphType.BAR;
                                  }
                                  BlocProvider.of<GraphBloc>(context).add(
                                    GraphChangedEvent(graphType: currentType),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: ThemedText(
                            'Daily',
                            themedTextStyle: ThemedTextStyle.H3,
                            textColor: Color.fromRGBO(180, 180, 180, 1),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Flexible(
                      flex: 9,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: state.graphModel.graphType == GraphType.BAR
                              ? BarGraph(
                                  daily: widget.daily,
                                )
                              : LineGraph(
                                  daily: widget.daily,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

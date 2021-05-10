import 'package:flutter/material.dart';
import 'package:weather_application/blocs/blocs.dart';
import 'package:weather_application/blocs/graph/graph_bloc.dart';
import 'package:weather_application/models/graph_model.dart';
import 'package:weather_application/widgets/themed_text.dart';

class GraphButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          for (int i = 0; i < 3; i++) ...{
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  GraphUnit unit;
                  if (i == 0) {
                    unit = GraphUnit.MIN;
                  } else if (i == 1) {
                    unit = GraphUnit.AVG;
                  } else {
                    unit = GraphUnit.MAX;
                  }
                  BlocProvider.of<GraphBloc>(context).add(
                    GraphUnitChangedEvent(
                      graphUnit: unit,
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    color: i == getIndex(context) ? Theme.of(context).primaryColor : Colors.transparent,
                    boxShadow: [
                      i == getIndex(context)
                          ? BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(1.0, 2.0),
                              spreadRadius: 0.5,
                            )
                          : BoxShadow(
                              color: Colors.transparent,
                            )
                    ],
                  ),
                  margin: EdgeInsets.only(
                    left: i == 0 ? 5 : 5,
                    right: i == 2 ? 5 : 5,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: ThemedText(
                      i == 0
                          ? 'Min'
                          : i == 1
                              ? 'Avg'
                              : 'Max',
                      textColor: i == getIndex(context) ? Theme.of(context).cardColor : Theme.of(context).primaryColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          },
        ],
      ),
    );
  }

  int getIndex(BuildContext context) {
    switch (BlocProvider.of<GraphBloc>(context).state.graphModel.graphUnit) {
      case GraphUnit.MIN:
        return 0;
        break;
      case GraphUnit.AVG:
        return 1;
        break;
      case GraphUnit.MAX:
        return 2;
        break;
      default:
        return 0;
        break;
    }
  }
}

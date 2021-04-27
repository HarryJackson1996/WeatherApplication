import 'package:flutter/material.dart';
import 'package:weather_application/blocs/blocs.dart';
import 'package:weather_application/consts/consts.dart';
import 'package:weather_application/widgets/themed_text.dart';

class LocationItem extends StatelessWidget {
  final SearchUpdatedSuccessState state;
  final int index;

  LocationItem({this.state, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () async {
            BlocProvider.of<WeatherBloc>(context).add(
              WeatherFetchedEvent(
                city: state.search.locations.values.elementAt(index),
                id: weatherBoxKey,
              ),
            );
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(
              left: myPadding,
              right: myPadding,
            ),
            height: 60.0,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ThemedText(
                      state.search.locations.values.elementAt(index),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () async {
                        BlocProvider.of<SearchBloc>(context).add(
                          SearchRemovedEvent(
                            city: state.search.locations.values.elementAt(index),
                            country: state.search.locations.keys.elementAt(index),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.close,
                        size: 20.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

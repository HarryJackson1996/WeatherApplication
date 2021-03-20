import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';
import '../../utils/extensions/extensions.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Theme.of(context).buttonColor),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).buttonColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length <= 3) {
      return Center(
        child: ThemedText('Search term must be greater then 3 letters'),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 20.0, left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ThemedText(
                'Results',
                themedTextStyle: ThemedTextStyle.H2,
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<WeatherBloc>(context).add(
                  WeatherFetchedEvent(
                    city: query.capitalise(),
                    id: weatherBox,
                    unit: 'metric',
                  ),
                );
                close(context, null);
              },
              child: Container(
                height: 30.0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ThemedText(
                        query.capitalise(),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

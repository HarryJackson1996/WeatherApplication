import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_text.dart';
import '../../utils/extensions/extensions.dart';

class SearchScreen extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      accentColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

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
    if (query.isNotEmpty) {
      return Container(
        padding: EdgeInsets.only(left: textPadding, top: textPadding / 2),
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                    id: weatherBoxKey,
                    unit: 'metric',
                  ),
                );
                close(context, null);
              },
              child: Container(
                padding: EdgeInsets.only(top: myPadding),
                child: Row(
                  children: [
                    ThemedText(
                      query.capitalise(),
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
    } else {
      return Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.only(bottom: AppBar().preferredSize.height),
        child: Center(
          child: ThemedText(
            'Enter a location name',
            themedTextStyle: ThemedTextStyle.DEFAULT,
          ),
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.length == 0
        ? Container(
            padding: EdgeInsets.only(bottom: AppBar().preferredSize.height),
            color: Theme.of(context).backgroundColor,
            child: Center(
              child: ThemedText(
                'Enter a location name',
                themedTextStyle: ThemedTextStyle.DEFAULT,
              ),
            ),
          )
        : Container();
  }
}

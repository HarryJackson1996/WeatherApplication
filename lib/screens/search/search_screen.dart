import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/search/search_bloc.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/models/search_model.dart';
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
    if (query.length <= 3) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: ThemedText(
            'Search term must be greater then 3 letters',
          ),
        ),
      );
    } else {
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
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchSavedSuccessState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: myPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: ThemedText(
                            'Recent searches',
                            themedTextStyle: ThemedTextStyle.H2,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              for (String value in state.locations.locations.values) ...{
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      BlocProvider.of<WeatherBloc>(context).add(
                                        WeatherFetchedEvent(
                                          city: value,
                                          id: weatherBoxKey,
                                          unit: 'metric',
                                        ),
                                      );
                                      close(context, null);
                                    },
                                    child: Row(
                                      children: [
                                        ThemedText(
                                          value.capitalise(),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              }
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
    );
  }
}

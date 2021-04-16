import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/consts/screen_consts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/screens/search/search_screen.dart';
import 'package:weather_application/utils/enums.dart';
import 'package:weather_application/widgets/themed_button.dart';
import 'package:weather_application/widgets/themed_text.dart';

class WeatherErrorWidget extends StatelessWidget {
  final DioError dioError;
  final bool showButton;

  WeatherErrorWidget({
    this.dioError,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: textPadding,
        right: textPadding,
        bottom: AppBar().preferredSize.height,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ThemedText(
              formatException(dioError).keys.toList()[0],
              themedTextStyle: ThemedTextStyle.H2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 60.0,
            ),
            child: Center(
              child: ThemedText(
                formatException(dioError).values.toList()[0],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 6,
            ),
          ),
          _moreErrorWidgets(dioError, context),
        ],
      ),
    );
  }

  Widget _moreErrorWidgets(DioError dioError, BuildContext context) {
    switch (dioError.type) {
      case DioErrorType.RESPONSE:
        return showButton
            ? ThemedButton(
                text: 'Search Again',
                function: () async {
                  showSearch(context: context, delegate: SearchScreen());
                },
              )
            : Container();
        break;
      case DioErrorType.DEFAULT:
        String myCity = Hive.box<Weather>(weatherBoxKey).get(weatherBoxKey)?.name;
        return ThemedButton(
          text: 'Retry',
          function: () async {
            BlocProvider.of<WeatherBloc>(context)
              ..add(
                WeatherFetchedEvent(
                  id: weatherBoxKey,
                  city: myCity,
                  unit: 'Metric',
                ),
              );
          },
        );
        break;
      default:
        return Container();
    }
  }

  Map<dynamic, String> formatException(error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.RESPONSE:
          return {'City not found': 'Please search for a new city or press the refresh button to load the last known location'};
          break;
        case DioErrorType.DEFAULT:
          return {
            'No internet connection': 'You are offline, please check your connection.',
            'button': 'Try again',
          };
          break;
        default:
          return {'Unable to fetch weather': ''};
      }
    } else {
      return {'': ''};
    }
  }
}

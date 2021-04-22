import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:weather_application/blocs/settings/settings_bloc.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/screens/onboarding/onboarding_screen.dart';
import 'package:weather_application/screens/weather/weather_screen.dart';

class PagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state.settings.onboarding != false) {
            BlocProvider.of<WeatherBloc>(context).add(
              WeatherFetchedEvent(
                id: weatherBoxKey,
                city: Hive.box<Weather>(weatherBoxKey).get(weatherBoxKey).name,
                unit: 'Metric',
              ),
            );
            return WeatherScreen();
          } else {
            return OnboardingScreen();
          }
        },
      ),
    );
  }
}

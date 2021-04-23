import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/blocs/settings/settings_bloc.dart';
import 'package:weather_application/screens/onboarding/onboarding_screen.dart';
import 'package:weather_application/screens/weather/weather_screen.dart';

class PagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.of<SettingsBloc>(context).state.settings.onboarding == false ? OnboardingScreen() : WeatherScreen(),
    );
  }
}

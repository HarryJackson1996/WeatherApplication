import 'package:flutter/material.dart';
import 'package:weather_application/consts/route_consts.dart';
import 'package:weather_application/screens/onboarding/onboarding_screen.dart';
import 'package:weather_application/screens/page_picker.dart';
import 'package:weather_application/screens/settings/settings_screen.dart';
import 'package:weather_application/screens/weather/weather_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => PagePicker());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => WeatherScreen());
        break;
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
        break;
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:weather_application/consts/route_consts.dart';
import 'package:weather_application/screens/screens.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => PagePicker());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => WeatherScreen());
        break;
      case locationsRoute:
        return MaterialPageRoute(builder: (_) => LocationsScreen());
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

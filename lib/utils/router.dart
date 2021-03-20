import 'package:flutter/material.dart';
import 'package:weather_application/consts/route_consts.dart';
import 'package:weather_application/screens/settings/settings_screen.dart';
import 'package:weather_application/screens/weather/weather_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => WeatherScreen());
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

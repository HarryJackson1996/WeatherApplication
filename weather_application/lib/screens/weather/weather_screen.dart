import 'dart:async';
import 'package:weather_application/blocs/theme/theme_bloc.dart';
import 'package:weather_application/themes/app_themes.dart';
import 'package:weather_application/utils/router.dart';

import '../../widgets/animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/screens/weather/widgets/forecast/forecast_weather.dart';
import 'package:weather_application/screens/weather/widgets/weather/current_weather.dart';

class WeatherScreen extends StatefulWidget {
  final Weather weather;

  WeatherScreen(this.weather) : assert(weather != null);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    Timer(Duration(milliseconds: 600), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ThemeData().appBarTheme.backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.weather.name + ', ',
                style: GoogleFonts.getFont(
                  'Muli',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                widget.weather.country,
                style: GoogleFonts.getFont(
                  'Muli',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          leading: IconButton(
            icon: Container(
              child: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            ),
            onPressed: () async {
              BlocProvider.of<WeatherBloc>(context)
                ..add(
                  WeatherFetchedEvent(id: currentBox, city: 'London', unit: 'Metric'),
                );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, settingsRoute);
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: CurrentWeather(widget.weather),
              ).animate(
                _controller,
                start: 0.0,
                end: 0.5,
                curve: Curves.linear,
                animationType: AnimationType.FADE,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: ForecastWeather(widget.weather.forecast.forecast),
              ).animate(
                _controller,
                start: 0.5,
                end: 1.0,
                curve: Curves.linear,
                animationType: AnimationType.FADE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/services.dart';
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
    _controller = AnimationController(duration: Duration(milliseconds: 1200), vsync: this);
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
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.weather.name + ', ',
                style: GoogleFonts.getFont(
                  'Muli',
                  textStyle: GoogleFonts.getFont('Muli', textStyle: Theme.of(context).textTheme.headline1),
                ),
              ),
              Text(
                widget.weather.country,
                style: GoogleFonts.getFont('Muli', textStyle: Theme.of(context).textTheme.headline1),
              ),
            ],
          ).animate(
            _controller,
            start: 0.0,
            end: 0.4,
            curve: Curves.linear,
            animationType: AnimationType.FADE,
          ),
          leading: IconButton(
            icon: Container(
              child: Icon(
                Icons.refresh,
                color: Theme.of(context).buttonColor,
              ),
            ),
            onPressed: () async {
              BlocProvider.of<WeatherBloc>(context)
                ..add(
                  WeatherFetchedEvent(id: currentBox, city: 'London', unit: 'Metric'),
                );
            },
          )..animate(
              _controller,
              start: 0.0,
              end: 0.4,
              curve: Curves.linear,
              animationType: AnimationType.FADE,
            ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).buttonColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, settingsRoute);
              },
            ).animate(
              _controller,
              start: 0.0,
              end: 0.4,
              curve: Curves.linear,
              animationType: AnimationType.FADE,
            )
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
                start: 0.2,
                end: 0.7,
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

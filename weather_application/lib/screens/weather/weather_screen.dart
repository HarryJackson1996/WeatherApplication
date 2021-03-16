import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'package:weather_application/screens/widgets/current_weather.dart';
import 'package:weather_application/screens/widgets/forecast_weather.dart';

class WeatherScreen extends StatelessWidget {
  final Weather weather;

  WeatherScreen(this.weather) : assert(weather != null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weather.name + ', ',
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
                weather.country,
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
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: CurrentWeather(weather),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: ForecastWeather(weather.forecast.forecast),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

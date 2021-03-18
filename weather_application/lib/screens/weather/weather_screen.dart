import 'dart:async';
import 'package:hive/hive.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/router.dart';
import '../../widgets/animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/screens/weather/widgets/forecast/forecast_weather.dart';
import 'package:weather_application/screens/weather/widgets/weather/current_weather.dart';
import '../search/search_screen.dart';
import '../../utils/consts.dart';

class WeatherScreen extends StatefulWidget {
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
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            centerTitle: true,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is WeatherLoadSuccess
                    ? Text(
                        state.city,
                        style: GoogleFonts.getFont(
                          'Muli',
                          textStyle: GoogleFonts.getFont('Muli', textStyle: Theme.of(context).textTheme.headline1),
                        ),
                      )
                    : Container(),
              ],
            ),
            leading: IconButton(
              icon: Container(
                child: Icon(
                  Icons.refresh,
                  color: Theme.of(context).buttonColor,
                ),
              ),
              onPressed: () async {
                var myCity = Hive.box<Weather>(weatherBox).get(weatherBox)?.name ?? 'London';
                BlocProvider.of<WeatherBloc>(context)
                  ..add(
                    WeatherFetchedEvent(id: weatherBox, city: myCity, unit: 'Metric'),
                  );
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  showSearch(context: context, delegate: SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).buttonColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, settingsRoute);
                },
              ),
            ],
          ),
          body: _mapWeatherStateToWidget(state),
        );
      },
    );
  }

  Widget _mapWeatherStateToWidget(WeatherState state) {
    if (state is WeatherLoadSuccess) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: CurrentWeather(state.weather),
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
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.only(bottom: 10.0),
              child: ForecastWeather(state.weather.forecast.forecast),
            ).animate(
              _controller,
              start: 0.5,
              end: 1.0,
              curve: Curves.linear,
              animationType: AnimationType.FADE,
            ),
          ),
        ],
      );
    }
    if (state is WeatherLoadFailure) {
      return Center(child: Text('Unable to fetch Weather'));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:weather_application/clients/weather_client.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: FutureBuilder(
        future: WeatherClient().fetchForecastWeather('London', 'metric'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Container(
              width: 200,
              height: 200,
              color: Colors.greenAccent,
            );
          } else {
            return Container(
              width: 200,
              height: 200,
              color: Colors.redAccent,
            );
          }
        },
      )),
    );
  }
}

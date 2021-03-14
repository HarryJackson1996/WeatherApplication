import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/repositories/hive_repository.dart';
import 'package:weather_application/repositories/weather_repository.dart';
import 'models/weather_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
              height: 200,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: WeatherRepository(
                  client: WeatherClient(),
                  box: HiveRepository(
                    Hive.box<Forecast>(forecastBox),
                  ),
                ).getForecastWeather(forecastBox, 'London', 'metric'),
                builder: (BuildContext context, AsyncSnapshot<Forecast> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.purpleAccent,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(snapshot.data.forecast[0].description),
                            Text(snapshot.data.forecast.length.toString()),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.redAccent,
                    );
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: FutureBuilder(
                future: WeatherRepository(
                  client: WeatherClient(),
                  box: HiveRepository(
                    Hive.box<Weather>(currentBox),
                  ),
                ).getCurrentWeather(currentBox, 'London', 'metric'),
                builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.greenAccent,
                      child: Center(child: Text(snapshot.data.name)),
                    );
                  } else {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.redAccent,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

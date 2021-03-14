import 'package:hive/hive.dart';
import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/models/weather_model.dart';

const String currentBox = 'currentBox';
const String forecastBox = 'forecastBox';

class WeatherRepository {
  final WeatherClient client;
  final IRepository<dynamic> box;

  WeatherRepository({
    this.box,
    this.client,
  }) : assert(client != null);

  Future<Weather> getCurrentWeather(id, [String cityName, String unit]) async {
    final localWeather = await this.box.get(id);
    if (localWeather != null) {
      print("localWeather");
      return localWeather;
    } else {
      final remoteWeather = await this.client.fetchCurrentWeather(
            cityName: cityName,
            unit: unit,
          );
      await this.box.put(id, remoteWeather);
      print("remoteWeather");
      return remoteWeather;
    }
  }

  Future<Forecast> getForecastWeather(id, [String cityName, String unit]) async {
    final localForecast = await box.get(id);
    if (localForecast != null) {
      print("localForecast");
      return localForecast;
    } else {
      final remoteForecast = await this.client.fetchForecastWeather(
            cityName: cityName,
            unit: unit,
          );
      await this.box.put(id, remoteForecast);
      print("remoteForecast");
      return remoteForecast;
    }
  }
}

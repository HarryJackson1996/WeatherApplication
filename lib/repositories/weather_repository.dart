import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/connectivity_utils.dart';

class WeatherRepository {
  final WeatherClient client;
  final IRepository<Weather> box;

  WeatherRepository({
    this.box,
    this.client,
  }) : assert(client != null);

  Future<Weather> getCurrentWeather(id, {String city, String lat, String lon}) async {
    final localWeather = await this.box.get(id);
    final bool hasConnection = await ConnectivityUtils.hasConnection();

    if (localWeather != null && !hasConnection) {
      print('localWeather');
      return localWeather;
    } else {
      Weather remoteWeather;
      await Future.wait([
        this.client.fetchCurrentWeather(city: city, lat: lat, lon: lon),
        this.client.fetchForecastWeather(city: city, lat: lat, lon: lon),
      ]).then(
        (value) => {
          remoteWeather = value[0],
          remoteWeather.forecast = value[1],
        },
      );
      await this.box.put(id, remoteWeather);
      return remoteWeather;
    }
  }
}

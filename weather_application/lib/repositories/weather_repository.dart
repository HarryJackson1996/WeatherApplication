import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/connectivity_utils.dart';

const String currentBox = 'currentBox';

class WeatherRepository {
  final WeatherClient client;
  final IRepository<Weather> box;

  WeatherRepository({
    this.box,
    this.client,
  }) : assert(client != null);

  Future<Weather> getCurrentWeather(id, [String cityName, String unit]) async {
    final localWeather = await this.box.get(id);
    final bool hasConnection = await ConnectivityUtils.hasConnection();
    if (localWeather != null && !hasConnection) {
      print("localWeather");
      return localWeather;
    } else {
      var remoteWeather = await this.client.fetchCurrentWeather(cityName: cityName, unit: unit);
      remoteWeather.forecast = await this.client.fetchForecastWeather(cityName: cityName, unit: unit);
      await this.box.put(id, remoteWeather);
      print("remoteWeather");
      return remoteWeather;
    }
  }
}

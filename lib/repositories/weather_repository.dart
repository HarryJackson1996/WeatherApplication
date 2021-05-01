import 'package:weather_application/clients/weather_client.dart';
import 'package:weather_application/interfaces/i_repository.dart';
import 'package:weather_application/models/location_model.dart';
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
      await this.client.fetchWeatherData(city: city, lat: lat, lon: lon).then((location) async {
        remoteWeather = await this.client.fetchWeather(lat: location.lat, lon: location.lon);
        setWeatherValues(remoteWeather, location);
        await this.box.put(id, remoteWeather);
      });
      return remoteWeather;
    }
  }

  void setWeatherValues(Weather weather, Location location) {
    weather.name = location.name;
    weather.country = location.country;
  }
}

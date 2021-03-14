import 'package:dio/dio.dart';
import 'package:weather_application/models/forecast_model.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherClient {
  final String _apiKey = '247f9e0d951d640a8515aa3995884175';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/';
  Dio _dio;

  WeatherClient() {
    this._dio = Dio();
  }

  Future<Weather> fetchCurrentWeather({
    String cityName = 'London',
    String unit = 'metric',
  }) async {
    final String url = '${_baseUrl}weather?q=$cityName&appid=$_apiKey&units=$unit';
    try {
      final response = await _dio.get(url);
      final weather = Weather.fromJson(response.data);
      return weather;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Forecast> fetchForecastWeather({
    String cityName = 'London',
    String unit = 'metric',
  }) async {
    final String url = "${_baseUrl}forecast?q=$cityName&appid=$_apiKey&units=$unit";
    try {
      final response = await _dio.get(url);
      return Forecast.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }
}

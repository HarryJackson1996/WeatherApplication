import 'package:dio/dio.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherClient {
  final String _apiKey = '247f9e0d951d640a8515aa3995884175';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/';
  Dio _dio;

  WeatherClient() {
    this._dio = Dio();
  }

  Future<Weather> fetchCurrentWeather(String cityName, String units) async {
    final String url = '${_baseUrl}weather?q=$cityName&appid=$_apiKey&units=$units';
    try {
      final response = await _dio.get(url);
      final weather = Weather.fromJson(response.data);
      return weather;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<List<Weather>> fetchForecastWeather(String cityName, String unit) async {
    final String url = "${_baseUrl}forecast?q=$cityName&appid=$_apiKey&units=$unit";
    try {
      final response = await _dio.get(url);
      final List<Weather> forecast = [];
      for (var weatherItem in response.data['list']) {
        forecast.add(Weather.fromJson(weatherItem));
      }
      return forecast;
    } on DioError catch (e) {
      throw e;
    }
  }
}

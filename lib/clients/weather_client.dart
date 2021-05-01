import 'package:dio/dio.dart';
import 'package:weather_application/models/location_model.dart';
import 'package:weather_application/models/weather_model.dart';

class WeatherClient {
  final String _apiKey = '247f9e0d951d640a8515aa3995884175';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/';
  Dio _dio;

  WeatherClient() {
    this._dio = Dio();
  }
  Future<Weather> fetchWeather({
    String lat,
    String lon,
  }) async {
    String url;
    url = '${_baseUrl}onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$_apiKey&units=metric';
    try {
      final response = await _dio.get(url);
      final weather = Weather.fromJson(response.data);
      return weather;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Location> fetchWeatherData({
    String city,
    String lat,
    String lon,
  }) async {
    String url;
    try {
      if (lat != null && lon != null) {
        url = '${_baseUrl}weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
      } else {
        url = '${_baseUrl}weather?q=$city&appid=$_apiKey&units=metric';
      }
      final response = await _dio.get(url);
      final weather = Location.fromJson(response.data);
      return weather;
    } on DioError catch (e) {
      throw e;
    }
  }
}

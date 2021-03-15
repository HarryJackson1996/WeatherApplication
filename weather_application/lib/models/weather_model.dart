import 'package:hive/hive.dart';

import 'forecast_model.dart';
part 'weather_model.g.dart';

@HiveType(typeId: 0)
class Weather {
  Weather(
      {this.id,
      this.main,
      this.description,
      this.icon,
      this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.humidity,
      this.windSpeed,
      this.country,
      this.sunrise,
      this.sunset,
      this.dt,
      this.name,
      this.dtTxt,
      this.forecast});

  @HiveField(0)
  int id;
  @HiveField(1)
  String main;
  @HiveField(2)
  String description;
  @HiveField(3)
  String icon;
  @HiveField(4)
  double temp;
  @HiveField(5)
  double feelsLike;
  @HiveField(6)
  double tempMin;
  @HiveField(7)
  double tempMax;
  @HiveField(8)
  int humidity;
  @HiveField(9)
  double windSpeed;
  @HiveField(10)
  String country;
  @HiveField(11)
  int sunrise;
  @HiveField(12)
  int sunset;
  @HiveField(13)
  int dt;
  @HiveField(14)
  String name;
  @HiveField(15)
  String dtTxt;
  @HiveField(16)
  Forecast forecast;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["weather"][0]["id"],
      main: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      temp: json["main"]["temp"].toDouble(),
      feelsLike: json["main"]["feels_like"].toDouble(),
      tempMin: json["main"]["temp_min"].toDouble(),
      tempMax: json["main"]["temp_max"].toDouble(),
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["speed"].toDouble(),
      country: json["sys"]["country"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
      dt: json["dt"],
      name: json["name"],
      dtTxt: json["dt_txt"] != null ? json["dt_txt"] : null,
    );
  }
}

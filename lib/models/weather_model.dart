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
      this.timezone,
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
  String temp;
  @HiveField(5)
  String feelsLike;
  @HiveField(6)
  String tempMin;
  @HiveField(7)
  String tempMax;
  @HiveField(8)
  int humidity;
  @HiveField(9)
  String windSpeed;
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
  String timezone;
  @HiveField(17)
  Forecast forecast;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["weather"][0]["id"],
      main: json["weather"][0]["main"],
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      temp: json["main"]["temp"].round().toString(),
      feelsLike: json["main"]["feels_like"].round().toString(),
      tempMin: json["main"]["temp_min"].round().toString(),
      tempMax: json["main"]["temp_max"].round().toString(),
      humidity: json["main"]["humidity"],
      windSpeed: json["wind"]["speed"].toString(),
      country: json["sys"]["country"],
      sunrise: json["sys"]["sunrise"],
      sunset: json["sys"]["sunset"],
      dt: json["dt"],
      name: json["name"],
      dtTxt: json["dt_txt"] != null ? json["dt_txt"] : null,
      timezone: json["timezone"] != null ? json["timezone"].toString() : null,
    );
  }
}

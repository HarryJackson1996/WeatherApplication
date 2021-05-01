// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'weather_model.g.dart';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

@HiveType(typeId: 7)
class Weather {
  Weather({this.lat, this.lon, this.timezone, this.timezoneOffset, this.current, this.hourly, this.daily, this.name, this.country});

  @HiveField(0)
  final double lat;
  @HiveField(1)
  final double lon;
  @HiveField(2)
  final String timezone;
  @HiveField(3)
  final int timezoneOffset;
  @HiveField(4)
  final Current current;
  @HiveField(5)
  final List<Current> hourly;
  @HiveField(6)
  final List<Daily> daily;
  @HiveField(7)
  String name;
  @HiveField(8)
  String country;
  @HiveField(9)
  String minTemp;
  @HiveField(10)
  String maxTemp;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        timezone: json["timezone"] == null ? null : json["timezone"],
        timezoneOffset: json["timezone_offset"] == null ? null : json["timezone_offset"],
        current: json["current"] == null ? null : Current.fromJson(json["current"]),
        hourly: json["hourly"] == null ? null : List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: json["daily"] == null ? null : List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "timezone": timezone == null ? null : timezone,
        "timezone_offset": timezoneOffset == null ? null : timezoneOffset,
        "current": current == null ? null : current.toJson(),
        "hourly": hourly == null ? null : List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": daily == null ? null : List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 8)
class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.windGust,
    this.pop,
  });

  @HiveField(0)
  final int dt;
  @HiveField(1)
  final int sunrise;
  @HiveField(2)
  final int sunset;
  @HiveField(3)
  final String temp;
  @HiveField(4)
  final double feelsLike;
  @HiveField(5)
  final int pressure;
  @HiveField(6)
  final int humidity;
  @HiveField(7)
  final double dewPoint;
  @HiveField(8)
  final double uvi;
  @HiveField(9)
  final int clouds;
  @HiveField(10)
  final int visibility;
  @HiveField(11)
  final double windSpeed;
  @HiveField(12)
  final int windDeg;
  @HiveField(13)
  final List<WeatherElement> weather;
  @HiveField(14)
  final double windGust;
  @HiveField(15)
  final double pop;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"] == null ? null : json["temp"].floor().toString(),
        feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint: json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
        clouds: json["clouds"] == null ? null : json["clouds"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        weather: json["weather"] == null ? null : List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "uvi": uvi == null ? null : uvi,
        "clouds": clouds == null ? null : clouds,
        "visibility": visibility == null ? null : visibility,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "weather": weather == null ? null : List<dynamic>.from(weather.map((x) => x.toJson())),
        "wind_gust": windGust == null ? null : windGust,
        "pop": pop == null ? null : pop,
      };
}

@HiveType(typeId: 9)
class WeatherElement {
  WeatherElement({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String main;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}

@HiveType(typeId: 10)
class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  @HiveField(0)
  final int dt;
  @HiveField(1)
  final int sunrise;
  @HiveField(2)
  final int sunset;
  @HiveField(3)
  final int moonrise;
  @HiveField(4)
  final int moonset;
  @HiveField(5)
  final double moonPhase;
  @HiveField(6)
  final Temp temp;
  @HiveField(7)
  final FeelsLike feelsLike;
  @HiveField(8)
  final int pressure;
  @HiveField(9)
  final int humidity;
  @HiveField(10)
  final double dewPoint;
  @HiveField(11)
  final double windSpeed;
  @HiveField(12)
  final int windDeg;
  @HiveField(13)
  final double windGust;
  @HiveField(14)
  final List<WeatherElement> weather;
  @HiveField(15)
  final int clouds;
  @HiveField(16)
  final double pop;
  @HiveField(17)
  final double rain;
  @HiveField(18)
  final double uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        moonrise: json["moonrise"] == null ? null : json["moonrise"],
        moonset: json["moonset"] == null ? null : json["moonset"],
        moonPhase: json["moon_phase"] == null ? null : json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null ? null : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint: json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null ? null : List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        clouds: json["clouds"] == null ? null : json["clouds"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "moonrise": moonrise == null ? null : moonrise,
        "moonset": moonset == null ? null : moonset,
        "moon_phase": moonPhase == null ? null : moonPhase,
        "temp": temp == null ? null : temp.toJson(),
        "feels_like": feelsLike == null ? null : feelsLike.toJson(),
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null ? null : List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds == null ? null : clouds,
        "pop": pop == null ? null : pop,
        "rain": rain == null ? null : rain,
        "uvi": uvi == null ? null : uvi,
      };
}

@HiveType(typeId: 11)
class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  @HiveField(0)
  final double day;
  @HiveField(1)
  final double night;
  @HiveField(2)
  final double eve;
  @HiveField(3)
  final double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"] == null ? null : json["day"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "night": night == null ? null : night,
        "eve": eve == null ? null : eve,
        "morn": morn == null ? null : morn,
      };
}

@HiveType(typeId: 12)
class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  @HiveField(0)
  final double day;
  @HiveField(1)
  final String min;
  @HiveField(2)
  final String max;
  @HiveField(3)
  final double night;
  @HiveField(4)
  final double eve;
  @HiveField(5)
  final double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? null : json["day"].toDouble(),
        min: json["min"] == null ? null : json["min"].round().toString(),
        max: json["max"] == null ? null : json["max"].round().toString(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "min": min == null ? null : min,
        "max": max == null ? null : max,
        "night": night == null ? null : night,
        "eve": eve == null ? null : eve,
        "morn": morn == null ? null : morn,
      };
}

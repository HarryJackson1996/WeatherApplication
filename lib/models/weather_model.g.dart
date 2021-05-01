// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 7;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      lat: fields[0] as double,
      lon: fields[1] as double,
      timezone: fields[2] as String,
      timezoneOffset: fields[3] as int,
      current: fields[4] as Current,
      hourly: (fields[5] as List)?.cast<Current>(),
      daily: (fields[6] as List)?.cast<Daily>(),
      name: fields[7] as String,
      country: fields[8] as String,
    )
      ..minTemp = fields[9] as String
      ..maxTemp = fields[10] as String;
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.timezoneOffset)
      ..writeByte(4)
      ..write(obj.current)
      ..writeByte(5)
      ..write(obj.hourly)
      ..writeByte(6)
      ..write(obj.daily)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.minTemp)
      ..writeByte(10)
      ..write(obj.maxTemp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 8;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      dt: fields[0] as int,
      sunrise: fields[1] as int,
      sunset: fields[2] as int,
      temp: fields[3] as String,
      feelsLike: fields[4] as double,
      pressure: fields[5] as int,
      humidity: fields[6] as int,
      dewPoint: fields[7] as double,
      uvi: fields[8] as double,
      clouds: fields[9] as int,
      visibility: fields[10] as int,
      windSpeed: fields[11] as double,
      windDeg: fields[12] as int,
      weather: (fields[13] as List)?.cast<WeatherElement>(),
      windGust: fields[14] as double,
      pop: fields[15] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.temp)
      ..writeByte(4)
      ..write(obj.feelsLike)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.dewPoint)
      ..writeByte(8)
      ..write(obj.uvi)
      ..writeByte(9)
      ..write(obj.clouds)
      ..writeByte(10)
      ..write(obj.visibility)
      ..writeByte(11)
      ..write(obj.windSpeed)
      ..writeByte(12)
      ..write(obj.windDeg)
      ..writeByte(13)
      ..write(obj.weather)
      ..writeByte(14)
      ..write(obj.windGust)
      ..writeByte(15)
      ..write(obj.pop);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherElementAdapter extends TypeAdapter<WeatherElement> {
  @override
  final int typeId = 9;

  @override
  WeatherElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherElement(
      id: fields[0] as int,
      main: fields[1] as String,
      description: fields[2] as String,
      icon: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherElement obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyAdapter extends TypeAdapter<Daily> {
  @override
  final int typeId = 10;

  @override
  Daily read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Daily(
      dt: fields[0] as int,
      sunrise: fields[1] as int,
      sunset: fields[2] as int,
      moonrise: fields[3] as int,
      moonset: fields[4] as int,
      moonPhase: fields[5] as double,
      temp: fields[6] as Temp,
      feelsLike: fields[7] as FeelsLike,
      pressure: fields[8] as int,
      humidity: fields[9] as int,
      dewPoint: fields[10] as double,
      windSpeed: fields[11] as double,
      windDeg: fields[12] as int,
      windGust: fields[13] as double,
      weather: (fields[14] as List)?.cast<WeatherElement>(),
      clouds: fields[15] as int,
      pop: fields[16] as double,
      rain: fields[17] as double,
      uvi: fields[18] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Daily obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.dt)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.sunset)
      ..writeByte(3)
      ..write(obj.moonrise)
      ..writeByte(4)
      ..write(obj.moonset)
      ..writeByte(5)
      ..write(obj.moonPhase)
      ..writeByte(6)
      ..write(obj.temp)
      ..writeByte(7)
      ..write(obj.feelsLike)
      ..writeByte(8)
      ..write(obj.pressure)
      ..writeByte(9)
      ..write(obj.humidity)
      ..writeByte(10)
      ..write(obj.dewPoint)
      ..writeByte(11)
      ..write(obj.windSpeed)
      ..writeByte(12)
      ..write(obj.windDeg)
      ..writeByte(13)
      ..write(obj.windGust)
      ..writeByte(14)
      ..write(obj.weather)
      ..writeByte(15)
      ..write(obj.clouds)
      ..writeByte(16)
      ..write(obj.pop)
      ..writeByte(17)
      ..write(obj.rain)
      ..writeByte(18)
      ..write(obj.uvi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FeelsLikeAdapter extends TypeAdapter<FeelsLike> {
  @override
  final int typeId = 11;

  @override
  FeelsLike read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeelsLike(
      day: fields[0] as double,
      night: fields[1] as double,
      eve: fields[2] as double,
      morn: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FeelsLike obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.night)
      ..writeByte(2)
      ..write(obj.eve)
      ..writeByte(3)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeelsLikeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TempAdapter extends TypeAdapter<Temp> {
  @override
  final int typeId = 12;

  @override
  Temp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Temp(
      day: fields[0] as double,
      min: fields[1] as String,
      max: fields[2] as String,
      night: fields[3] as double,
      eve: fields[4] as double,
      morn: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Temp obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.night)
      ..writeByte(4)
      ..write(obj.eve)
      ..writeByte(5)
      ..write(obj.morn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

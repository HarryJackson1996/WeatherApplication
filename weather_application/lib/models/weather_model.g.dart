// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 0;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      id: fields[0] as int,
      main: fields[1] as String,
      description: fields[2] as String,
      icon: fields[3] as String,
      temp: fields[4] as String,
      feelsLike: fields[5] as String,
      tempMin: fields[6] as String,
      tempMax: fields[7] as String,
      humidity: fields[8] as int,
      windSpeed: fields[9] as String,
      country: fields[10] as String,
      sunrise: fields[11] as int,
      sunset: fields[12] as int,
      dt: fields[13] as int,
      name: fields[14] as String,
      dtTxt: fields[15] as String,
      forecast: fields[16] as Forecast,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.temp)
      ..writeByte(5)
      ..write(obj.feelsLike)
      ..writeByte(6)
      ..write(obj.tempMin)
      ..writeByte(7)
      ..write(obj.tempMax)
      ..writeByte(8)
      ..write(obj.humidity)
      ..writeByte(9)
      ..write(obj.windSpeed)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.sunrise)
      ..writeByte(12)
      ..write(obj.sunset)
      ..writeByte(13)
      ..write(obj.dt)
      ..writeByte(14)
      ..write(obj.name)
      ..writeByte(15)
      ..write(obj.dtTxt)
      ..writeByte(16)
      ..write(obj.forecast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WeatherAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

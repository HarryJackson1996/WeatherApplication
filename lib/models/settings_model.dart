import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'settings_model.g.dart';

@HiveType(typeId: 3)
enum TempUnit {
  @HiveField(0)
  CELSIUS,
  @HiveField(1)
  FAHRENHEIT
}

@HiveType(typeId: 4)
enum LocationPermissions {
  @HiveField(0)
  ALLOWED,
  @HiveField(1)
  DENIED,
}

@HiveType(typeId: 5)
class Settings extends Equatable {
  @HiveField(0)
  final TempUnit tempUnit;
  @HiveField(1)
  final bool onboarding;
  @HiveField(2)
  final LocationPermissions locationPermissions;

  Settings({
    this.tempUnit,
    this.onboarding = false,
    this.locationPermissions,
  });

  Settings copyWith({
    TempUnit tempUnit,
    bool onboarding,
    LocationPermissions locationPermissions,
  }) {
    return Settings(
      tempUnit: tempUnit ?? this.tempUnit,
      onboarding: onboarding ?? this.onboarding,
      locationPermissions: locationPermissions ?? this.locationPermissions,
    );
  }

  @override
  List<Object> get props => [tempUnit, onboarding, locationPermissions];
}

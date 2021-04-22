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
class Settings extends Equatable {
  @HiveField(0)
  TempUnit tempUnit;
  @HiveField(1)
  bool onboarding;

  Settings({
    this.tempUnit,
    this.onboarding,
  });

  Settings copyWith({
    TempUnit tempUnit,
    bool onboarding,
  }) {
    return Settings(
      tempUnit: tempUnit ?? this.tempUnit,
      onboarding: onboarding ?? this.onboarding,
    );
  }

  @override
  List<Object> get props => [tempUnit, onboarding];
}

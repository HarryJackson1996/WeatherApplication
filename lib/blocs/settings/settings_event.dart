part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsInitEvent extends SettingsEvent {
  final String id;

  SettingsInitEvent(this.id);

  @override
  List<Object> get props => [id];
}

class TempUpdatedEvent extends SettingsEvent {
  final String id;
  final TempUnit tempUnit;

  TempUpdatedEvent(
    this.id, {
    this.tempUnit,
  });

  @override
  List<Object> get props => [id, tempUnit];
}

class OnboardingUpdatedEvent extends SettingsEvent {
  final String id;
  final bool onboarding;

  OnboardingUpdatedEvent(
    this.id, {
    this.onboarding,
  });

  @override
  List<Object> get props => [id, onboarding];
}

class LocationUpdatedEvent extends SettingsEvent {
  final String id;
  final LocationPermissions permissions;

  LocationUpdatedEvent(
    this.id, {
    this.permissions,
  });

  @override
  List<Object> get props => [id, permissions];
}

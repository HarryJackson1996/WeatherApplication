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

  TempUpdatedEvent(this.id, this.tempUnit);

  @override
  List<Object> get props => [id, tempUnit];
}

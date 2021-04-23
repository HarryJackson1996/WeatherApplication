part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Settings settings;

  const SettingsState(this.settings);

  @override
  List<Object> get props => [settings];
}

class TempUpdatedState extends SettingsState {
  TempUpdatedState(Settings settings) : super(settings);
}

class OnboardingUpdatedState extends SettingsState {
  OnboardingUpdatedState(Settings settings) : super(settings);
}

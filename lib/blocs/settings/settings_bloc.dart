import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_application/models/settings_model.dart';
import 'package:weather_application/repositories/settings_repository.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository repository;

  SettingsBloc({this.repository})
      : super(
          SettingsState(
            Settings(),
          ),
        );

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsInitEvent) {
      yield* _mapSettingsInitToState(event);
    }
    if (event is TempUpdatedEvent) {
      yield* _mapTempUpdatedToState(event);
    }
    if (event is OnboardingUpdatedEvent) {
      yield* _mapOnboardingUpdatedToState(event);
    }
    if (event is LocationUpdatedEvent) {
      yield* _mapLocationUpdatedToState(event);
    }
  }

  Stream<SettingsState> _mapSettingsInitToState(SettingsInitEvent event) async* {
    Settings settings = await repository.get(event.id);
    yield SettingsState(settings);
  }

  Stream<SettingsState> _mapLocationUpdatedToState(LocationUpdatedEvent event) async* {
    try {
      Settings settings = await repository.get(event.id);
      Settings newSettings = settings.copyWith(locationPermissions: event.permissions);
      await repository.put(event.id, newSettings);
      yield SettingsState(newSettings);
    } catch (e) {
      print(e);
    }
  }

  Stream<SettingsState> _mapOnboardingUpdatedToState(OnboardingUpdatedEvent event) async* {
    try {
      Settings settings = await repository.get(event.id);
      Settings newSettings = settings.copyWith(onboarding: event.onboarding);
      await repository.put(event.id, newSettings);
      yield SettingsState(newSettings);
    } catch (e) {
      print(e);
    }
  }

  Stream<SettingsState> _mapTempUpdatedToState(TempUpdatedEvent event) async* {
    Settings settings = Settings(tempUnit: event.tempUnit);
    yield TempUpdatedState(settings);
    try {
      Settings settings = await repository.get(event.id);
      Settings newSettings = settings.copyWith(tempUnit: event.tempUnit);
      await repository.put(event.id, newSettings);
      yield SettingsState(newSettings);
    } catch (e) {
      print(e);
    }
  }
}

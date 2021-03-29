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
            Settings(
              tempUnit: TempUnit.CELSIUS,
            ),
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
  }

  Stream<SettingsState> _mapSettingsInitToState(SettingsInitEvent event) async* {
    Settings settings = await repository.get(event.id);
    yield SettingsState(settings);
  }

  Stream<SettingsState> _mapTempUpdatedToState(TempUpdatedEvent event) async* {
    Settings settings = Settings(tempUnit: event.tempUnit);
    yield TempUpdatedState(settings);
    try {
      await repository.put(event.id, settings);
      yield SettingsState(settings);
    } catch (e) {
      print(e);
    }
  }
}

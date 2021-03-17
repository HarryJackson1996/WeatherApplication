import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_application/repositories/theme_repository.dart';
import 'package:weather_application/themes/app_themes.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, AppTheme> {
  final ThemeRepository repository;

  ThemeBloc({this.repository}) : super(AppTheme.LIGHT);

  @override
  Stream<AppTheme> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeFetchedEvent) {
      final AppTheme appTheme = await repository.get(event.id);
      yield appTheme;
    }
    if (event is ThemeUpdatedEvent) {
      await repository.put(event.id, event.theme);
      final AppTheme appTheme = await repository.get(event.id);
      yield appTheme;
    }
  }
}

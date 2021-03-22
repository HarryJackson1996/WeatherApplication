part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeUpdatedEvent extends ThemeEvent {
  final dynamic theme;
  final String id;

  const ThemeUpdatedEvent({@required this.theme, this.id});

  @override
  List<Object> get props => [theme, id];
}

class ThemeFetchedEvent extends ThemeEvent {
  final String id;

  const ThemeFetchedEvent({
    @required this.id,
  });

  @override
  List<Object> get props => [id];
}

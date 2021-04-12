part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchFetchedEvent extends SearchEvent {}

class SearchAddedEvent extends SearchEvent {
  final String city;
  final String country;
  SearchAddedEvent({this.city, this.country});

  @override
  List<Object> get props => [city, country];
}

class SearchRemovedEvent extends SearchEvent {
  final Map<String, String> location;

  SearchRemovedEvent({this.location});

  @override
  List<Object> get props => [location];
}

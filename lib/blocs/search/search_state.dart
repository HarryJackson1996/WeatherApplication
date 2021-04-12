part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSavedSuccessState extends SearchState {
  final Search locations;

  SearchSavedSuccessState({this.locations});

  @override
  List<Object> get props => [locations];
}

class SearchSavedFailedState extends SearchState {}

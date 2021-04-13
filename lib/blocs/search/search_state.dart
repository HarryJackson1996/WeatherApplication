part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchUpdatedSuccessState extends SearchState {
  final Search search;

  SearchUpdatedSuccessState({this.search});

  @override
  List<Object> get props => [search];
}

class SearchUpdatedFailedState extends SearchState {}

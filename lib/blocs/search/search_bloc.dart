import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/blocs/weather/weather_bloc.dart';
import 'package:weather_application/consts/box_consts.dart';
import 'package:weather_application/models/search_model.dart';
import 'package:weather_application/repositories/search_repository.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository repository;
  final WeatherBloc weatherBloc;
  StreamSubscription subscription;

  SearchBloc({@required this.repository, this.weatherBloc}) : super(SearchInitial()) {
    if (weatherBloc != null) {
      subscription = weatherBloc.stream.listen((state) {
        if (state is WeatherLoadSuccess) {
          add(SearchAddedEvent(city: state.city, country: state.weather.country));
        }
      });
    }
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchFetchedEvent) {
      yield* _mapSearchFetchedToState(event);
    }
    if (event is SearchAddedEvent) {
      yield* _mapSearchAddedToState(event);
    }
    if (event is SearchRemovedEvent) {
      yield* _mapSearchRemovedToState(event);
    }
  }

  Stream<SearchState> _mapSearchFetchedToState(SearchFetchedEvent event) async* {
    Search search = await repository.get(searchBoxKey);
    yield SearchUpdatedSuccessState(search: search);
  }

  Stream<SearchState> _mapSearchAddedToState(SearchAddedEvent event) async* {
    yield SearchLoading();
    try {
      Search search = await repository.get(searchBoxKey);
      search.locations.putIfAbsent(event.country + event.city, () => event.city);
      await repository.put(searchBoxKey, search);
      yield SearchUpdatedSuccessState(
        search: search,
      );
    } catch (e) {
      yield SearchUpdatedFailedState();
    }
  }

  Stream<SearchState> _mapSearchRemovedToState(SearchRemovedEvent event) async* {
    yield SearchLoading();
    try {
      Search search = await repository.get(searchBoxKey);
      search.locations.remove(event.country);
      await repository.put(searchBoxKey, search);
      yield SearchUpdatedSuccessState(
        search: search,
      );
    } catch (e) {
      yield SearchUpdatedFailedState();
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}

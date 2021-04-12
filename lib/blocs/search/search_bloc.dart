import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
        } else {
          print('gwan');
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
  }

  Stream<SearchState> _mapSearchFetchedToState(SearchFetchedEvent event) async* {
    Search search = await repository.get(searchBoxKey);
    yield SearchSavedSuccessState(locations: search);
  }

  Stream<SearchState> _mapSearchAddedToState(SearchAddedEvent event) async* {
    try {
      Search search = await repository.get(searchBoxKey);
      search.locations.putIfAbsent(event.country + event.city, () => event.city);
      await repository.put(searchBoxKey, search);
      yield SearchSavedSuccessState(
        locations: search,
      );
    } catch (e) {
      yield SearchSavedFailedState();
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}

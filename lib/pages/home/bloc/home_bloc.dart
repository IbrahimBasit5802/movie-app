import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/api/request_url.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/models/movie.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFetchMoviesEvent>(homeFetchMoviesEvent);
    on<HomeMovieSearchEvent>(homeMovieSearchEvent);
    on<HomeMovieSearchCancelButtonClickedEvent>(
        homeMovieSearchCancelButtonClickedEvent);
  }

  FutureOr<void> homeFetchMoviesEvent(
      HomeFetchMoviesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      final movies = await getUpcomingMovies();
      emit(HomeLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await ApiService.executeRequest(
      [],
      EndPoint.MOVIE_UPCOMING,
    );

    if (response!.status == 200) {
      final List<MovieModel> movies = [];
      response.body['results'].forEach((movie) {
        movies.add(MovieModel.fromMap(movie));
      });
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> searchMovies(String searchText) async {
    final response = await ApiService.executeRequest(
      [searchText],
      EndPoint.MOVIE_SEARCH,
    );

    if (response!.status == 200) {
      final List<MovieModel> movies = [];
      response.body['results'].forEach((movie) {
        movies.add(MovieModel.fromMap(movie));
      });
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> getGenres(List<MovieModel> movies) async {
    final response = await ApiService.executeRequest(
      [],
      EndPoint.MOVIE_GENRES,
    );

    if (response!.status == 200) {
      final List<Genre> genres = [];
      response.body['genres'].forEach((genre) {
        genres.add(Genre.fromMap(genre));
      });
      for (var movie in movies) {
        movie.genres = [];
        for (var genre in genres) {
          if (movie.genre_ids.contains(genre.id)) {
            movie.genres!.add(genre);
          }
        }
      }

      return movies;
    } else {
      throw Exception('Failed to load genres');
    }
  }

  FutureOr<void> homeMovieSearchEvent(
      HomeMovieSearchEvent event, Emitter<HomeState> emit) async {
    emit(SearchLoading());
    final tempMovies = await searchMovies(event.searchText);
    final finalMovies = await getGenres(tempMovies);
    emit(SearchLoaded(finalMovies));
  }

  FutureOr<void> homeMovieSearchCancelButtonClickedEvent(
      HomeMovieSearchCancelButtonClickedEvent event,
      Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      final movies = await getUpcomingMovies();
      emit(HomeLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}

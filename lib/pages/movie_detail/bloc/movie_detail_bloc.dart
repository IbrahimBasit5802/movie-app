import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/api/api_service.dart';
import 'package:movie_app/api/request_url.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/models/movie.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailInitialEvent>(movieDetailInitialEvent);
    on<MovieDetailWatchTrailerButtonClickedEvent>(
        movieDetailWatchTrailerButtonClickedEvent);
    on<MovieDetailClearButtonClickedEvent>(movieDetailClearButtonClickedEvent);
  }

  FutureOr<void> movieDetailInitialEvent(
      MovieDetailInitialEvent event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoading());

    try {
      final movieDetail = await getGenres(event.movie);
      emit(MovieDetailLoaded(movieDetail));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }

  Future<MovieModel> getGenres(MovieModel movie) async {
    final response = await ApiService.executeRequest(
      [],
      EndPoint.MOVIE_GENRES,
    );

    if (response!.status == 200) {
      final List<Genre> genres = [];
      response.body['genres'].forEach((genre) {
        genres.add(Genre.fromMap(genre));
      });
      movie.genres = [];
      for (var genre in genres) {
        if (movie.genre_ids.contains(genre.id)) {
          movie.genres!.add(genre);
        }
      }
      return movie;
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<String> getTrailerLink(MovieModel movie) async {
    try {
      final response = await ApiService.executeRequest(
        [movie.id],
        EndPoint.MOVIE_TRAILER,
      );

      if (response!.status == 200) {
        final String trailerLink = response.body['results'][0]['key'];
        return trailerLink;
      } else {
        throw Exception('Failed to load trailer link');
      }
    } catch (e) {
      throw Exception('Failed to load trailer link');
    }
  }

  FutureOr<void> movieDetailWatchTrailerButtonClickedEvent(
      MovieDetailWatchTrailerButtonClickedEvent event,
      Emitter<MovieDetailState> emit) async {
    emit(MovieDetailTrailerLinkLoading());
    try {
      String trailerLink = await getTrailerLink(event.movie);
      emit(MovieTrailerLinkFetched(trailerLink));
    } catch (e) {
      emit(MovieTrailerLoadError(e.toString()));
    }
  }

  FutureOr<void> movieDetailClearButtonClickedEvent(
      MovieDetailClearButtonClickedEvent event,
      Emitter<MovieDetailState> emit) {
    emit(MovieDetailLoaded(event.movie));
  }
}

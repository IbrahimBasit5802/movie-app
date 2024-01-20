part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailError extends MovieDetailState {
  final String message;
  MovieDetailError(this.message);
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieModel movie;
  MovieDetailLoaded(this.movie);
}

class MovieDetailTrailerLinkLoading extends MovieDetailState {}

class MovieTrailerLoadError extends MovieDetailState {
  final String message;
  MovieTrailerLoadError(this.message);
}

class MovieTrailerLinkFetched extends MovieDetailState {
  final String videoId;
  MovieTrailerLinkFetched(this.videoId);
}

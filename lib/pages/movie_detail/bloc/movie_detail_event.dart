part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

class MovieDetailInitialEvent extends MovieDetailEvent {
  final MovieModel movie;
  MovieDetailInitialEvent({required this.movie});
}

class MovieDetailWatchTrailerButtonClickedEvent extends MovieDetailEvent {
  final MovieModel movie;
  MovieDetailWatchTrailerButtonClickedEvent({required this.movie});
}

class MovieDetailClearButtonClickedEvent extends MovieDetailEvent {
  final MovieModel movie;
  MovieDetailClearButtonClickedEvent({required this.movie});
}

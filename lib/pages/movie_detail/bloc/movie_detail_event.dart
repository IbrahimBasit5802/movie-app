part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

class MovieDetailInitialEvent extends MovieDetailEvent {
  final MovieModel movie;
  MovieDetailInitialEvent({required this.movie});
}

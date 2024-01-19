part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MovieModel> movies;
  HomeLoaded(this.movies);
}

class MoviesError extends HomeState {
  final String message;
  MoviesError(this.message);
}

class HomeMovieSearchButtonClickedState extends HomeState {}

class SearchLoading extends HomeState {}

class SearchLoaded extends HomeState {
  final List<MovieModel> movies;
  SearchLoaded(this.movies);
}

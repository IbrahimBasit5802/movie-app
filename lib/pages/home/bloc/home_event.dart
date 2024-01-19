part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeFetchMoviesEvent extends HomeEvent {}

class HomeMovieSearchCancelButtonClickedEvent extends HomeEvent {}

class HomeMovieSearchEvent extends HomeEvent {
  final String searchText;
  HomeMovieSearchEvent(this.searchText);
}

class HomeMovieSearchCompleteEvent extends HomeEvent {}

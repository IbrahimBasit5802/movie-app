part of 'app_bar_bloc.dart';

@immutable
sealed class AppBarState {}

final class AppBarInitial extends AppBarState {}

class HomeMovieSearchCompleteState extends AppBarState {}

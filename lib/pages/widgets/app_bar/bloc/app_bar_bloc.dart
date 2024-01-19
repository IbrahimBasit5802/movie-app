import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(AppBarInitial()) {
    on<HomeMovieSearchCompleteEvent>(homeMovieSearchCompleteEvent);
  }

  FutureOr<void> homeMovieSearchCompleteEvent(
      HomeMovieSearchCompleteEvent event, Emitter<AppBarState> emit) {
    emit(HomeMovieSearchCompleteState());
  }
}

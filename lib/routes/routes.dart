import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/home/seat_select/ui/seat_select_page.dart';
import 'package:movie_app/pages/home/ui/home_page.dart';
import 'package:movie_app/pages/movie_detail/ui/movie_detail_page.dart';
import 'package:movie_app/pages/mqtt/bloc/mqtt_bloc.dart';
import 'package:movie_app/pages/mqtt/ui/mqtt_page.dart';
import 'package:movie_app/pages/theater_select/ui/theater_select_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(
        child: HomePage(),
      ),
    ),
    GoRoute(
      name: '/movieDetail',
      path: '/movieDetail',
      pageBuilder: (context, state) => MaterialPage(
        child: MovieDetailPage(
          movie: state.extra as MovieModel,
        ),
      ),
    ),
    GoRoute(
        path: '/theaterSelect',
        name: '/theaterSelect',
        pageBuilder: (context, state) => MaterialPage(
                child: TheaterSelectPage(
              movie: state.extra as MovieModel,
            ))),
    GoRoute(
        path: '/seatSelect',
        name: '/seatSelect',
        pageBuilder: (context, state) => MaterialPage(
                child: SeatSelectPage(
              movie: state.extra as MovieModel,
            ))),
    GoRoute(
      path: '/mqtt',
      name: '/mqtt',
      pageBuilder: (context, state) {
        final mqttBloc = MqttBloc();

        return MaterialPage(
          child: BlocProvider.value(
            value: mqttBloc,
            child: MQTTPage(
              movie: state.extra as MovieModel,
            ),
          ),
        );
      },
    )
  ],
);

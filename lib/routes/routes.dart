import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/home/ui/home_page.dart';
import 'package:movie_app/pages/movie_detail/ui/movie_detail_page.dart';

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
  ],
);

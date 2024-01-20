// ignore_for_file: non_constant_identifier_names

import 'package:floor/floor.dart';

@entity
class MovieDBModel {
  @primaryKey
  final int id;

  final String original_title;
  final String? backdrop_path;
  final String? release_date;
  final String? overview;
  final String? poster_path;

  MovieDBModel(
      {required this.id,
      required this.original_title,
      required this.backdrop_path,
      required this.release_date,
      required this.overview,
      required this.poster_path});
}

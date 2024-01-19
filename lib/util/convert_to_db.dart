import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movie_database.dart';

MovieDBModel convertMovieModelToDB(MovieModel movie) {
  return MovieDBModel(
    id: int.tryParse(movie.id) ??
        0, // Convert String to int, default to 0 if parsing fails
    original_title: movie.original_title,
    backdrop_path:
        movie.backdrop_path ?? '', // Handle nullable with default value
    release_date:
        movie.release_date ?? '', // Handle nullable with default value
    overview: movie.overview ?? '', // Handle nullable with default value
    poster_path: movie.poster_path ?? '', // Handle nullable with default value
  );
}

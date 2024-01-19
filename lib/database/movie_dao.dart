import 'package:floor/floor.dart';
import 'package:movie_app/models/movie_database.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM movies')
  Future<List<MovieDBModel>> getAllMovies();

  @Query('SELECT * FROM movies WHERE id = :id')
  Future<MovieDBModel?> getMovieById(int id);

  @Query('SELECT COUNT(*) FROM movies')
  Future<int?> countMovies();

  @insert
  Future<void> insertMovie(MovieDBModel movie);

  @insert
  Future<void> insertMovies(List<MovieDBModel> movies);
}

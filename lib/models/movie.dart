import 'package:movie_app/models/genre.dart';

const baseImageUrl = "https://image.tmdb.org/t/p/w500";

class MovieModel {
  final String id;
  final String original_title;
  final String? backdrop_path;
  final String? release_date;
  final String? overview;
  final String? poster_path;
  late List<Genre>? genres;
  final List<dynamic> genre_ids;

  MovieModel({
    required this.original_title,
    required this.id,
    this.backdrop_path,
    this.release_date,
    this.overview,
    this.genres,
    this.poster_path,
    required this.genre_ids,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'original_title': original_title,
      'backdrop_path': backdrop_path,
      'release_date': release_date,
      'overview': overview,
      'genre_ids': genre_ids,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'].toString(),
      original_title: map['original_title'] as String,
      backdrop_path: map['backdrop_path'] ?? "",
      release_date: map['release_date'] as String,
      overview: map['overview'] as String,
      poster_path: map['poster_path'] ?? "",
      genre_ids: List<dynamic>.from(
        (map['genre_ids'] as List<dynamic>),
      ),
    );
  }

  static List<MovieModel> toList(dynamic map) {
    List<MovieModel> list = [];
    for (var i = 0; i < map.length; i++) {
      list.add(MovieModel.fromMap(map[i]));
    }
    return list;
  }
}

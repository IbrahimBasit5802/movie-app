// File: test/movie_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/models/movie.dart';

void main() {
  group('MovieModel.fromMap', () {
    test('Should convert JSON map to MovieModel correctly', () {
      final Map<String, dynamic> jsonMap = {
        'id': 550,
        'original_title': 'Fight Club',
        'backdrop_path': '/backdrop.jpg',
        'release_date': '1999-10-15',
        'overview': 'A movie overview here',
        'poster_path': '/poster.jpg',
        'genre_ids': [18, 28],
      };

      final result = MovieModel.fromMap(jsonMap);

      expect(result.id, '550');
      expect(result.original_title, 'Fight Club');
      expect(result.backdrop_path, '/backdrop.jpg');
      expect(result.release_date, '1999-10-15');
      expect(result.overview, 'A movie overview here');
      expect(result.poster_path, '/poster.jpg');
      expect(result.genre_ids, [18, 28]);
    });
  });
}

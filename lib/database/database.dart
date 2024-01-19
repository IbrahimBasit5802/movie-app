// database.dart

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:movie_app/database/movie_dao.dart';
import 'package:movie_app/models/movie_database.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [MovieDBModel])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}

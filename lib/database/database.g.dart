// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieDBModel` (`id` INTEGER NOT NULL, `original_title` TEXT NOT NULL, `backdrop_path` TEXT, `release_date` TEXT, `overview` TEXT, `poster_path` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieDBModelInsertionAdapter = InsertionAdapter(
            database,
            'MovieDBModel',
            (MovieDBModel item) => <String, Object?>{
                  'id': item.id,
                  'original_title': item.original_title,
                  'backdrop_path': item.backdrop_path,
                  'release_date': item.release_date,
                  'overview': item.overview,
                  'poster_path': item.poster_path
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieDBModel> _movieDBModelInsertionAdapter;

  @override
  Future<List<MovieDBModel>> getAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movies',
        mapper: (Map<String, Object?> row) => MovieDBModel(
            id: row['id'] as int,
            original_title: row['original_title'] as String,
            backdrop_path: row['backdrop_path'] as String?,
            release_date: row['release_date'] as String?,
            overview: row['overview'] as String?,
            poster_path: row['poster_path'] as String?));
  }

  @override
  Future<MovieDBModel?> getMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM movies WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MovieDBModel(
            id: row['id'] as int,
            original_title: row['original_title'] as String,
            backdrop_path: row['backdrop_path'] as String?,
            release_date: row['release_date'] as String?,
            overview: row['overview'] as String?,
            poster_path: row['poster_path'] as String?),
        arguments: [id]);
  }

  @override
  Future<int?> countMovies() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM movies',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<void> insertMovie(MovieDBModel movie) async {
    await _movieDBModelInsertionAdapter.insert(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMovies(List<MovieDBModel> movies) async {
    await _movieDBModelInsertionAdapter.insertList(
        movies, OnConflictStrategy.abort);
  }
}

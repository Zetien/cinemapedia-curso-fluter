import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IsarDatasource extends LocalStorageDataSource {
  static const _boxName = 'favorites';

  Future<Box<Movie>> get _box async => Hive.openBox<Movie>(_boxName);

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final box = await _box;
    return box.values.any((m) => m.id == movieId);
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final box = await _box;
    final existing = box.values.firstWhere(
      (m) => m.id == movie.id,
      orElse: () => Movie(
        adult: false, backdropPath: '', genreIds: [], id: -1,
        originalLanguage: '', originalTitle: '', overview: '',
        popularity: 0, posterPath: '', releaseDate: DateTime.now(),
        title: '', video: false, voteAverage: 0, voteCount: 0,
      ),
    );

    if (existing.id != -1) {
      final key = box.keys.firstWhere((k) => (box.get(k) as Movie).id == movie.id);
      await box.delete(key);
    } else {
      await box.add(movie);
    }
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) async {
    final box = await _box;
    final all = box.values.toList();
    return all.skip(offset).take(limit).toList();
  }
}
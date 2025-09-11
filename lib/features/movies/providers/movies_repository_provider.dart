import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moviepedia/features/movies/infrastructure/datasources/moviedb_datasource.dart';
import 'package:moviepedia/features/movies/infrastructure/repositories/movie_repository_impl.dart';

// provider inmutable when using Provider
final moviesRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDatasource());
});

import 'package:moviepedia/features/movies/domain/datasources/movie_datasource.dart';
import 'package:moviepedia/features/movies/domain/entities/movie.dart';
import 'package:moviepedia/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> fetchNowPlaying({int page = 1}) {
    return datasource.fetchNowPlaying(page: page);
  }
}

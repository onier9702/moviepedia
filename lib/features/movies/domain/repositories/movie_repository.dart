import 'package:moviepedia/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchNowPlaying({int page = 1});
}

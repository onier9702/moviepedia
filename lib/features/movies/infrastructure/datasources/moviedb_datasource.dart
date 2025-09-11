import 'package:dio/dio.dart';
import 'package:moviepedia/config/constants/environment.dart';
import 'package:moviepedia/features/movies/domain/datasources/movie_datasource.dart';
import 'package:moviepedia/features/movies/domain/entities/movie.dart';
import 'package:moviepedia/features/movies/infrastructure/mappers/movie_mapper.dart';
import 'package:moviepedia/features/movies/infrastructure/models/moviedb_response.dart';

class MovieDbDatasource extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'en-USA',
      },
    ),
  );

  @override
  Future<List<Movie>> fetchNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> moviesNowPlaying = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((elem) => MovieMapper.movieDbToEntity(elem))
        .toList();

    return moviesNowPlaying;
  }
}

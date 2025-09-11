import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moviepedia/features/movies/domain/entities/movie.dart';
import 'package:moviepedia/features/movies/providers/movies_repository_provider.dart';

final nowPlayingProvider = NotifierProvider<MoviesNotifier, List<Movie>>(
  MoviesNotifier.new,
);

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  late final MovieCallback fetchMoreMovies;

  @override
  List<Movie> build() {
    fetchMoreMovies = ref.watch(moviesRepositoryProvider).fetchNowPlaying;
    return []; // initial state
  }

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/features/movies/movies_exporter.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingProvider);

  if (nowPlayingMovies.isEmpty) {
    return [];
  }

  return nowPlayingMovies.sublist(0, 6);
});

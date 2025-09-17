import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/features/movies/movies_exporter.dart';
import 'package:moviepedia/shared/shared_exporter.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // load the first movies with page = 1
    ref.read(nowPlayingProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPLayingMovies = ref.watch(nowPlayingProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          MoviesSlideshow(movies: slideshowMovies),
          MoviesHorizontalListview(
            movies: nowPLayingMovies,
            title: 'On theater',
            subtitle: 'Thursday 17',
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

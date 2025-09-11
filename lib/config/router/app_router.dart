import 'package:go_router/go_router.dart';
import 'package:moviepedia/features/movies/movies_exporter.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

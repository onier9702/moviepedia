import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moviepedia/features/movies/domain/entities/movie.dart';

class MoviesHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          // header title + subtitle
          if (title != null || subtitle != null)
            _Title(title: title, subtitle: subtitle),

          // movies listview
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image posterPath
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                fit: BoxFit.cover,
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          SizedBox(height: 5),

          // Info
          SizedBox(
            width: 150,
            child: Text(movie.title, maxLines: 2, style: textTheme.titleSmall),
          ),

          // Rating
          Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
              SizedBox(width: 3),
              Text(
                '${movie.voteAverage}',
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.yellow.shade800,
                ),
              ),
              SizedBox(width: 10),
              Text('${movie.popularity}', style: textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: EdgeInsets.only(top: 12),
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),

          Spacer(),

          if (subtitle != null)
            FilledButton.tonal(
              onPressed: () {},
              style: ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDbKey =
      dotenv.env['MOVIE_DB_API_KEY'] ?? 'Missing MOVIE_DB_API_KEY';
}

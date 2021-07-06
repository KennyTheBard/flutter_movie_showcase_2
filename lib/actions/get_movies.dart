import 'package:flutter_movie_showcase_2/models/movie.dart';

class GetMovies {
  const GetMovies();

  @override
  String toString() {
    return 'GetMovies{}';
  }
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies);

  final List<Movie> movies;

  @override
  String toString() {
    return 'GetMoviesSuccessful{movies: $movies}';
  }
}

class GetMoviesError {
  const GetMoviesError(this.error);

  final Object error;

  @override
  String toString() {
    return 'GetMoviesError{error: $error}';
  }
}

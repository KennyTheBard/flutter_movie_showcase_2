import 'package:flutter_movie_showcase_2/actions/index.dart';
import 'package:flutter_movie_showcase_2/models/index.dart';

import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesStart>(_getMovies),
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMoviesError>(_getMoviesError),
  TypedReducer<AppState, SelectMovie>(_selectMovie),
]);

AppState _getMovies(AppState state, GetMoviesStart action) {
  print(action);
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  print(action);
  return state.rebuild((AppStateBuilder b) {
    b
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..pageIndex = state.pageIndex + 1;
  });
}

AppState _getMoviesError(AppState state, GetMoviesError action) {
  print(action);
  return state.rebuild((AppStateBuilder b) {
    b
      ..isLoading = false
      ..error = '${action.error}';
  });
}

AppState _selectMovie(AppState state, SelectMovie action) {
  print(action);
  return state.rebuild((AppStateBuilder b) {
    b.selectedMovie = state.movies.firstWhere((Movie movie) => movie.id == action.movieId).toBuilder();
  });
}

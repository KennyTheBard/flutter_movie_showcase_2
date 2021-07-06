import 'package:flutter_movie_showcase_2/actions/get_movies.dart';
import 'package:flutter_movie_showcase_2/data/yts.api.dart';
import 'package:flutter_movie_showcase_2/models/app_state.dart';
import 'package:flutter_movie_showcase_2/models/movie.dart';

import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({required YtsApi ytsApi}) : _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetMovies>(_getMovies),
    ];
  }

  Future<void> _getMovies(Store<AppState> store, GetMovies action, NextDispatcher next) async {
    next(action);

    try {
      final List<Movie> movies = await _ytsApi.getMovies(store.state.pageIndex, store.state.pageIndex);
      store.dispatch(GetMoviesSuccessful(movies));
    } catch (err) {
      print(err);
      store.dispatch(GetMoviesError(err));
    }
  }
}

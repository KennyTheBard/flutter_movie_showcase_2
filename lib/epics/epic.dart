import 'package:flutter_movie_showcase_2/actions/get_movies.dart';
import 'package:flutter_movie_showcase_2/data/yts.api.dart';
import 'package:flutter_movie_showcase_2/models/app_state.dart';
import 'package:flutter_movie_showcase_2/models/movie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpic {
  const AppEpic({required YtsApi ytsApi}) : _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMovies>(_getMovies),
    ]);
  }

  Stream<Object> _getMovies(Stream<GetMovies> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMovies event) => _ytsApi.getMovies(store.state.pageIndex, store.state.pageIndex))
        .map<Object>((List<Movie> movies) => GetMoviesSuccessful(movies))
        .onErrorReturnWith((Object error, StackTrace st) => GetMoviesError(error));
  }
}

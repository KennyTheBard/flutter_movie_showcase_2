import 'package:flutter_movie_showcase_2/actions/index.dart';
import 'package:flutter_movie_showcase_2/data/yts.api.dart';
import 'package:flutter_movie_showcase_2/models/index.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpic {
  const AppEpic({required YtsApi ytsApi}) : _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesStart>(_getMovies),
    ]);
  }

  Stream<Object> _getMovies(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart event) => _ytsApi.getMovies(store.state.pageIndex, store.state.pageIndex))
        .map<Object>((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((Object error, StackTrace st) => GetMovies.error(error, st));
  }
}

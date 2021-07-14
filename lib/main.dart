import 'package:flutter/material.dart';
import 'package:flutter_movie_showcase_2/data/yts.api.dart';
import 'package:flutter_movie_showcase_2/epics/epic.dart';
import 'package:flutter_movie_showcase_2/models/index.dart';
import 'package:flutter_movie_showcase_2/reducers/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'presentation//home_page.dart';

void main() {
  final YtsApi ytsApi = YtsApi();
  final AppEpic epic = AppEpic(ytsApi: ytsApi);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.epics),
    ],
  );

  runApp(JollyRogerCinema(store: store));
}

class JollyRogerCinema extends StatelessWidget {
  const JollyRogerCinema({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Jolly Roger Cinema 2',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const HomePage(title: 'Jolly Roger Cinema 2'),
        ));
  }
}

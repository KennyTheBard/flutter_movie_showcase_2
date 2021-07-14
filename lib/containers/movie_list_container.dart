import 'package:flutter/material.dart';
import 'package:flutter_movie_showcase_2/models/index.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MovieListContainer extends StatelessWidget {
  const MovieListContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Movie>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Movie>>(
      converter: (Store<AppState> store) {
        return store.state.movies.toList();
      },
      builder: builder,
    );
  }
}

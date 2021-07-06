import 'package:built_collection/built_collection.dart';
import 'package:flutter_movie_showcase_2/actions/get_movies.dart';
import 'package:flutter_movie_showcase_2/containers/movies_container.dart';
import 'package:flutter_movie_showcase_2/models/app_state.dart';
import 'package:flutter_movie_showcase_2/models/movie.dart';
import 'package:flutter_movie_showcase_2/containers/movie_grid_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    _loadMovies();
  }

  Future<void> _loadMovies() async {
    StoreProvider.of<AppState>(context).dispatch(const GetMovies());
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color.fromRGBO(20, 20, 20, 1),
        child: Center(
          child: NotificationListener<ScrollEndNotification>(onNotification: (ScrollEndNotification scrollEnd) {
            final ScrollMetrics metrics = scrollEnd.metrics;
            if (metrics.atEdge && metrics.pixels > 0) {
              _loadMovies();
            }
            return true;
          }, child: MovieContainer(builder: (BuildContext context, BuiltList<Movie> movies) {
            return CustomScrollView(
              slivers: <Widget>[
                // This one is scrolled first
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: store.state.isLoading ? 0.65 : 0.58),
                  delegate: SliverChildListDelegate(<Widget>[
                    GridView.builder(
                        itemCount: movies.length,
                        padding: const EdgeInsets.all(5.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 5.0, childAspectRatio: 0.69),
                        itemBuilder: (BuildContext context, int index) {
                          return MovieGridItem(
                            index: index,
                            movieId: movies[index].id,
                            title: movies[index].titleEnglish,
                            imageUrl: movies[index].coverImage,
                            // onTap: onTap
                          );
                        }),
                  ]),
                ),
                // Then this one becomes visible and start scrolling as well
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    if (store.state.isLoading)
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                  ]),
                ),
              ],
            );
          })),
        ),
      ),
    );
  }
}

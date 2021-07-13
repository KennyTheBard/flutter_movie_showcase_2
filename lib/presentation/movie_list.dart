import 'package:flutter_movie_showcase_2/actions/get_movies.dart';
import 'package:flutter_movie_showcase_2/actions/select_movie.dart';
import 'package:flutter_movie_showcase_2/containers/is_loading_container.dart';
import 'package:flutter_movie_showcase_2/containers/movie_list_container.dart';
import 'package:flutter_movie_showcase_2/models/app_state.dart';
import 'package:flutter_movie_showcase_2/models/movie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  void _loadMovies() {
    StoreProvider.of<AppState>(context).dispatch(const GetMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(20, 20, 20, 1),
      child: Center(
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification scrollEnd) {
            final ScrollMetrics metrics = scrollEnd.metrics;
            if (metrics.atEdge && metrics.pixels > 0) {
              _loadMovies();
            }
            return true;
          },
          child: IsLoadingContainer(
            builder: (BuildContext context, bool isLoading) {
              return MovieListContainer(
                builder: (BuildContext context, List<Movie> movies) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      // This one is scrolled first
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: isLoading ? 0.65 : 0.58),
                        delegate: SliverChildListDelegate(<Widget>[
                          GridView.builder(
                              itemCount: movies.length,
                              padding: const EdgeInsets.all(5.0),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 5.0,
                                  childAspectRatio: 0.69),
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
                        delegate: SliverChildListDelegate(
                          <Widget>[
                            if (isLoading)
                              const Align(
                                alignment: Alignment.bottomCenter,
                                child: SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

typedef OnTap = void Function(int);

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({
    Key? key,
    required this.index,
    required this.movieId,
    required this.title,
    required this.imageUrl,
    // required this.onTap
  }) : super(key: key);

  final int index;
  final int movieId;
  final String title;
  final String imageUrl;

  // final OnTap onTap;

  Widget _getOutlinedText(String text, double fontSize, Color textColor, Color outlineColor, double outlineWidth) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = outlineWidth
              ..color = outlineColor,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          StoreProvider.of<AppState>(context).dispatch(SelectMovie(movieId));
        },
        child: Stack(children: <Widget>[
          Image.network(imageUrl),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _getOutlinedText(title, 20, Colors.white, Colors.black, 6))),
        ]));
  }
}

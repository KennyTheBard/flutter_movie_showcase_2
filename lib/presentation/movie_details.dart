import 'package:flutter_movie_showcase_2/actions/get_movies.dart';
import 'package:flutter_movie_showcase_2/actions/select_movie.dart';
import 'package:flutter_movie_showcase_2/containers/is_loading_container.dart';
import 'package:flutter_movie_showcase_2/containers/movie_details_container.dart';
import 'package:flutter_movie_showcase_2/containers/movie_list_container.dart';
import 'package:flutter_movie_showcase_2/models/app_state.dart';
import 'package:flutter_movie_showcase_2/models/movie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(20, 20, 20, 1),
      child: Center(
        child: Column(
          children: <Widget>[
            MovieDetailsContainer(
              builder: (BuildContext context, Movie? movie) {
                return (movie != null) ? Image.network(movie.coverImage) : const Icon(Icons.error);
              },
            ),
          ],
        ),
      ),
    );
  }
}

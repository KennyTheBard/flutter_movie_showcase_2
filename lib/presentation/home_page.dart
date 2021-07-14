import 'package:flutter_movie_showcase_2/actions/index.dart';
import 'package:flutter_movie_showcase_2/containers/movie_details_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_movie_showcase_2/models/index.dart';
import 'package:flutter_movie_showcase_2/presentation/movie_details.dart';
import 'package:flutter_movie_showcase_2/presentation/movie_list.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _loadMovies() {
    StoreProvider.of<AppState>(context).dispatch(const GetMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MovieDetailsContainer(
        builder: (BuildContext context, Movie? movie) {
          print(movie);
          return movie == null ? const MovieList() : const MovieDetails();
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _loadMovies();
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.download)),
    );
  }
}

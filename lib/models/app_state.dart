import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_movie_showcase_2/models/movie.dart';
import 'package:flutter_movie_showcase_2/models/serializers.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder b) {
      b
        ..movies = null
        ..selectedMovie = null
        ..isLoading = false
        ..pageIndex = 1
        ..pageSize = 20;
    });
  }

  AppState._();

  BuiltList<Movie> get movies;

  bool get isLoading;

  Movie? get selectedMovie;

  int get pageIndex;

  int get pageSize;

  String? get error;

  Map<String, dynamic> get json => serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}

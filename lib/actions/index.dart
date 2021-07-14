library actions;

import 'package:flutter_movie_showcase_2/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'index.freezed.dart';
part 'get_movies.dart';
part 'select_movie.dart';

abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  Object get error;
  StackTrace get stackTrace;
}

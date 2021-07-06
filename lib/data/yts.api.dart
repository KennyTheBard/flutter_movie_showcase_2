import 'dart:convert';

import 'package:flutter_movie_showcase_2/models/movie.dart';
import 'package:http/http.dart';

class YtsApi {
  Future<List<Movie>> getMovies(int pageIndex, int pageSize) async {
    final Uri url = Uri(
        scheme: 'https',
        host: 'yts.mx',
        pathSegments: <String>['api', 'v2', 'list_movies.json'],
        queryParameters: <String, String>{'limit': pageSize.toString(), 'page': pageIndex.toString()});

    final Response response = await get(url);

    return (jsonDecode(response.body)['data']['movies'] as List<dynamic>)
        .map((dynamic movieJson) => Movie.fromJson(movieJson as Map<String, dynamic>))
        .toList();
  }
}

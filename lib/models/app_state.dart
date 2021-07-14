part of models;

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

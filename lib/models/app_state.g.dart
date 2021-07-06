// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'movies',
      serializers.serialize(object.movies, specifiedType: const FullType(BuiltList, const [const FullType(Movie)])),
      'isLoading',
      serializers.serialize(object.isLoading, specifiedType: const FullType(bool)),
      'pageIndex',
      serializers.serialize(object.pageIndex, specifiedType: const FullType(int)),
      'pageSize',
      serializers.serialize(object.pageSize, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.error;
    if (value != null) {
      result..add('error')..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'movies':
          result.movies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [const FullType(Movie)]))! as BuiltList<Object?>);
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool;
          break;
        case 'pageIndex':
          result.pageIndex = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'pageSize':
          result.pageSize = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<Movie> movies;
  @override
  final bool isLoading;
  @override
  final int pageIndex;
  @override
  final int pageSize;
  @override
  final String? error;

  factory _$AppState([void Function(AppStateBuilder)? updates]) => (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {required this.movies, required this.isLoading, required this.pageIndex, required this.pageSize, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(movies, 'AppState', 'movies');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'AppState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(pageIndex, 'AppState', 'pageIndex');
    BuiltValueNullFieldError.checkNotNull(pageSize, 'AppState', 'pageSize');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        movies == other.movies &&
        isLoading == other.isLoading &&
        pageIndex == other.pageIndex &&
        pageSize == other.pageSize &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc($jc(0, movies.hashCode), isLoading.hashCode), pageIndex.hashCode), pageSize.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('movies', movies)
          ..add('isLoading', isLoading)
          ..add('pageIndex', pageIndex)
          ..add('pageSize', pageSize)
          ..add('error', error))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  ListBuilder<Movie>? _movies;
  ListBuilder<Movie> get movies => _$this._movies ??= new ListBuilder<Movie>();
  set movies(ListBuilder<Movie>? movies) => _$this._movies = movies;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  int? _pageIndex;
  int? get pageIndex => _$this._pageIndex;
  set pageIndex(int? pageIndex) => _$this._pageIndex = pageIndex;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _movies = $v.movies.toBuilder();
      _isLoading = $v.isLoading;
      _pageIndex = $v.pageIndex;
      _pageSize = $v.pageSize;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              movies: movies.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(isLoading, 'AppState', 'isLoading'),
              pageIndex: BuiltValueNullFieldError.checkNotNull(pageIndex, 'AppState', 'pageIndex'),
              pageSize: BuiltValueNullFieldError.checkNotNull(pageSize, 'AppState', 'pageSize'),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'movies';
        movies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError('AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
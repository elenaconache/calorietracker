// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchRecipeState {
  AsyncState<List<Recipe>> get allRecipes;
  List<Recipe> get searchResults;

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchRecipeStateCopyWith<SearchRecipeState> get copyWith =>
      _$SearchRecipeStateCopyWithImpl<SearchRecipeState>(
          this as SearchRecipeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchRecipeState &&
            (identical(other.allRecipes, allRecipes) ||
                other.allRecipes == allRecipes) &&
            const DeepCollectionEquality()
                .equals(other.searchResults, searchResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allRecipes,
      const DeepCollectionEquality().hash(searchResults));

  @override
  String toString() {
    return 'SearchRecipeState(allRecipes: $allRecipes, searchResults: $searchResults)';
  }
}

/// @nodoc
abstract mixin class $SearchRecipeStateCopyWith<$Res> {
  factory $SearchRecipeStateCopyWith(
          SearchRecipeState value, $Res Function(SearchRecipeState) _then) =
      _$SearchRecipeStateCopyWithImpl;
  @useResult
  $Res call({AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults});

  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes;
}

/// @nodoc
class _$SearchRecipeStateCopyWithImpl<$Res>
    implements $SearchRecipeStateCopyWith<$Res> {
  _$SearchRecipeStateCopyWithImpl(this._self, this._then);

  final SearchRecipeState _self;
  final $Res Function(SearchRecipeState) _then;

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allRecipes = null,
    Object? searchResults = null,
  }) {
    return _then(_self.copyWith(
      allRecipes: null == allRecipes
          ? _self.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<Recipe>>,
      searchResults: null == searchResults
          ? _self.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes {
    return $AsyncStateCopyWith<List<Recipe>, $Res>(_self.allRecipes, (value) {
      return _then(_self.copyWith(allRecipes: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchRecipeState].
extension SearchRecipeStatePatterns on SearchRecipeState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchRecipeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchRecipeState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchRecipeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRecipeState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchRecipeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRecipeState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchRecipeState() when $default != null:
        return $default(_that.allRecipes, _that.searchResults);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRecipeState():
        return $default(_that.allRecipes, _that.searchResults);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchRecipeState() when $default != null:
        return $default(_that.allRecipes, _that.searchResults);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchRecipeState implements SearchRecipeState {
  const _SearchRecipeState(
      {required this.allRecipes, required final List<Recipe> searchResults})
      : _searchResults = searchResults;

  @override
  final AsyncState<List<Recipe>> allRecipes;
  final List<Recipe> _searchResults;
  @override
  List<Recipe> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchRecipeStateCopyWith<_SearchRecipeState> get copyWith =>
      __$SearchRecipeStateCopyWithImpl<_SearchRecipeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRecipeState &&
            (identical(other.allRecipes, allRecipes) ||
                other.allRecipes == allRecipes) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allRecipes,
      const DeepCollectionEquality().hash(_searchResults));

  @override
  String toString() {
    return 'SearchRecipeState(allRecipes: $allRecipes, searchResults: $searchResults)';
  }
}

/// @nodoc
abstract mixin class _$SearchRecipeStateCopyWith<$Res>
    implements $SearchRecipeStateCopyWith<$Res> {
  factory _$SearchRecipeStateCopyWith(
          _SearchRecipeState value, $Res Function(_SearchRecipeState) _then) =
      __$SearchRecipeStateCopyWithImpl;
  @override
  @useResult
  $Res call({AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults});

  @override
  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes;
}

/// @nodoc
class __$SearchRecipeStateCopyWithImpl<$Res>
    implements _$SearchRecipeStateCopyWith<$Res> {
  __$SearchRecipeStateCopyWithImpl(this._self, this._then);

  final _SearchRecipeState _self;
  final $Res Function(_SearchRecipeState) _then;

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allRecipes = null,
    Object? searchResults = null,
  }) {
    return _then(_SearchRecipeState(
      allRecipes: null == allRecipes
          ? _self.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<Recipe>>,
      searchResults: null == searchResults
          ? _self._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes {
    return $AsyncStateCopyWith<List<Recipe>, $Res>(_self.allRecipes, (value) {
      return _then(_self.copyWith(allRecipes: value));
    });
  }
}

// dart format on

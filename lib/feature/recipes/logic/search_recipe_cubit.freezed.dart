// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchRecipeState {
  AsyncState<List<Recipe>> get allRecipes => throw _privateConstructorUsedError;
  List<Recipe> get searchResults => throw _privateConstructorUsedError;

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchRecipeStateCopyWith<SearchRecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRecipeStateCopyWith<$Res> {
  factory $SearchRecipeStateCopyWith(
          SearchRecipeState value, $Res Function(SearchRecipeState) then) =
      _$SearchRecipeStateCopyWithImpl<$Res, SearchRecipeState>;
  @useResult
  $Res call({AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults});

  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes;
}

/// @nodoc
class _$SearchRecipeStateCopyWithImpl<$Res, $Val extends SearchRecipeState>
    implements $SearchRecipeStateCopyWith<$Res> {
  _$SearchRecipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allRecipes = null,
    Object? searchResults = null,
  }) {
    return _then(_value.copyWith(
      allRecipes: null == allRecipes
          ? _value.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<Recipe>>,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ) as $Val);
  }

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes {
    return $AsyncStateCopyWith<List<Recipe>, $Res>(_value.allRecipes, (value) {
      return _then(_value.copyWith(allRecipes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchRecipeStateImplCopyWith<$Res>
    implements $SearchRecipeStateCopyWith<$Res> {
  factory _$$SearchRecipeStateImplCopyWith(_$SearchRecipeStateImpl value,
          $Res Function(_$SearchRecipeStateImpl) then) =
      __$$SearchRecipeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncState<List<Recipe>> allRecipes, List<Recipe> searchResults});

  @override
  $AsyncStateCopyWith<List<Recipe>, $Res> get allRecipes;
}

/// @nodoc
class __$$SearchRecipeStateImplCopyWithImpl<$Res>
    extends _$SearchRecipeStateCopyWithImpl<$Res, _$SearchRecipeStateImpl>
    implements _$$SearchRecipeStateImplCopyWith<$Res> {
  __$$SearchRecipeStateImplCopyWithImpl(_$SearchRecipeStateImpl _value,
      $Res Function(_$SearchRecipeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allRecipes = null,
    Object? searchResults = null,
  }) {
    return _then(_$SearchRecipeStateImpl(
      allRecipes: null == allRecipes
          ? _value.allRecipes
          : allRecipes // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<Recipe>>,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc

class _$SearchRecipeStateImpl implements _SearchRecipeState {
  const _$SearchRecipeStateImpl(
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

  @override
  String toString() {
    return 'SearchRecipeState(allRecipes: $allRecipes, searchResults: $searchResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRecipeStateImpl &&
            (identical(other.allRecipes, allRecipes) ||
                other.allRecipes == allRecipes) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allRecipes,
      const DeepCollectionEquality().hash(_searchResults));

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRecipeStateImplCopyWith<_$SearchRecipeStateImpl> get copyWith =>
      __$$SearchRecipeStateImplCopyWithImpl<_$SearchRecipeStateImpl>(
          this, _$identity);
}

abstract class _SearchRecipeState implements SearchRecipeState {
  const factory _SearchRecipeState(
      {required final AsyncState<List<Recipe>> allRecipes,
      required final List<Recipe> searchResults}) = _$SearchRecipeStateImpl;

  @override
  AsyncState<List<Recipe>> get allRecipes;
  @override
  List<Recipe> get searchResults;

  /// Create a copy of SearchRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRecipeStateImplCopyWith<_$SearchRecipeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

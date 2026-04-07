// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeDetailsState {
  AsyncState<Nutrition> get nutrition;
  AsyncState<List<RecipeIngredient>> get ingredients;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeDetailsStateCopyWith<RecipeDetailsState> get copyWith =>
      _$RecipeDetailsStateCopyWithImpl<RecipeDetailsState>(
          this as RecipeDetailsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipeDetailsState &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nutrition, ingredients);

  @override
  String toString() {
    return 'RecipeDetailsState(nutrition: $nutrition, ingredients: $ingredients)';
  }
}

/// @nodoc
abstract mixin class $RecipeDetailsStateCopyWith<$Res> {
  factory $RecipeDetailsStateCopyWith(
          RecipeDetailsState value, $Res Function(RecipeDetailsState) _then) =
      _$RecipeDetailsStateCopyWithImpl;
  @useResult
  $Res call(
      {AsyncState<Nutrition> nutrition,
      AsyncState<List<RecipeIngredient>> ingredients});

  $AsyncStateCopyWith<Nutrition, $Res> get nutrition;
  $AsyncStateCopyWith<List<RecipeIngredient>, $Res> get ingredients;
}

/// @nodoc
class _$RecipeDetailsStateCopyWithImpl<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  _$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final RecipeDetailsState _self;
  final $Res Function(RecipeDetailsState) _then;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrition = null,
    Object? ingredients = null,
  }) {
    return _then(_self.copyWith(
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as AsyncState<Nutrition>,
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<RecipeIngredient>>,
    ));
  }

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<Nutrition, $Res> get nutrition {
    return $AsyncStateCopyWith<Nutrition, $Res>(_self.nutrition, (value) {
      return _then(_self.copyWith(nutrition: value));
    });
  }

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<RecipeIngredient>, $Res> get ingredients {
    return $AsyncStateCopyWith<List<RecipeIngredient>, $Res>(_self.ingredients,
        (value) {
      return _then(_self.copyWith(ingredients: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RecipeDetailsState].
extension RecipeDetailsStatePatterns on RecipeDetailsState {
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
    TResult Function(_RecipeDetailsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecipeDetailsState() when $default != null:
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
    TResult Function(_RecipeDetailsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecipeDetailsState():
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
    TResult? Function(_RecipeDetailsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecipeDetailsState() when $default != null:
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
    TResult Function(AsyncState<Nutrition> nutrition,
            AsyncState<List<RecipeIngredient>> ingredients)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RecipeDetailsState() when $default != null:
        return $default(_that.nutrition, _that.ingredients);
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
    TResult Function(AsyncState<Nutrition> nutrition,
            AsyncState<List<RecipeIngredient>> ingredients)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecipeDetailsState():
        return $default(_that.nutrition, _that.ingredients);
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
    TResult? Function(AsyncState<Nutrition> nutrition,
            AsyncState<List<RecipeIngredient>> ingredients)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RecipeDetailsState() when $default != null:
        return $default(_that.nutrition, _that.ingredients);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RecipeDetailsState implements RecipeDetailsState {
  const _RecipeDetailsState(
      {required this.nutrition, required this.ingredients});

  @override
  final AsyncState<Nutrition> nutrition;
  @override
  final AsyncState<List<RecipeIngredient>> ingredients;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipeDetailsStateCopyWith<_RecipeDetailsState> get copyWith =>
      __$RecipeDetailsStateCopyWithImpl<_RecipeDetailsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeDetailsState &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nutrition, ingredients);

  @override
  String toString() {
    return 'RecipeDetailsState(nutrition: $nutrition, ingredients: $ingredients)';
  }
}

/// @nodoc
abstract mixin class _$RecipeDetailsStateCopyWith<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  factory _$RecipeDetailsStateCopyWith(
          _RecipeDetailsState value, $Res Function(_RecipeDetailsState) _then) =
      __$RecipeDetailsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AsyncState<Nutrition> nutrition,
      AsyncState<List<RecipeIngredient>> ingredients});

  @override
  $AsyncStateCopyWith<Nutrition, $Res> get nutrition;
  @override
  $AsyncStateCopyWith<List<RecipeIngredient>, $Res> get ingredients;
}

/// @nodoc
class __$RecipeDetailsStateCopyWithImpl<$Res>
    implements _$RecipeDetailsStateCopyWith<$Res> {
  __$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final _RecipeDetailsState _self;
  final $Res Function(_RecipeDetailsState) _then;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutrition = null,
    Object? ingredients = null,
  }) {
    return _then(_RecipeDetailsState(
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as AsyncState<Nutrition>,
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<RecipeIngredient>>,
    ));
  }

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<Nutrition, $Res> get nutrition {
    return $AsyncStateCopyWith<Nutrition, $Res>(_self.nutrition, (value) {
      return _then(_self.copyWith(nutrition: value));
    });
  }

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<RecipeIngredient>, $Res> get ingredients {
    return $AsyncStateCopyWith<List<RecipeIngredient>, $Res>(_self.ingredients,
        (value) {
      return _then(_self.copyWith(ingredients: value));
    });
  }
}

// dart format on

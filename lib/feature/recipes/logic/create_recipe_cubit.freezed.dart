// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateRecipeState {
  List<RecipeIngredient> get ingredients;
  Nutrition get nutrition;
  AsyncState get createRecipeStatus;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateRecipeStateCopyWith<CreateRecipeState> get copyWith =>
      _$CreateRecipeStateCopyWithImpl<CreateRecipeState>(
          this as CreateRecipeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateRecipeState &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.createRecipeStatus, createRecipeStatus) ||
                other.createRecipeStatus == createRecipeStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ingredients),
      nutrition,
      createRecipeStatus);

  @override
  String toString() {
    return 'CreateRecipeState(ingredients: $ingredients, nutrition: $nutrition, createRecipeStatus: $createRecipeStatus)';
  }
}

/// @nodoc
abstract mixin class $CreateRecipeStateCopyWith<$Res> {
  factory $CreateRecipeStateCopyWith(
          CreateRecipeState value, $Res Function(CreateRecipeState) _then) =
      _$CreateRecipeStateCopyWithImpl;
  @useResult
  $Res call(
      {List<RecipeIngredient> ingredients,
      Nutrition nutrition,
      AsyncState createRecipeStatus});

  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus;
}

/// @nodoc
class _$CreateRecipeStateCopyWithImpl<$Res>
    implements $CreateRecipeStateCopyWith<$Res> {
  _$CreateRecipeStateCopyWithImpl(this._self, this._then);

  final CreateRecipeState _self;
  final $Res Function(CreateRecipeState) _then;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
    Object? nutrition = null,
    Object? createRecipeStatus = null,
  }) {
    return _then(_self.copyWith(
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<RecipeIngredient>,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
      createRecipeStatus: null == createRecipeStatus
          ? _self.createRecipeStatus
          : createRecipeStatus // ignore: cast_nullable_to_non_nullable
              as AsyncState,
    ));
  }

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus {
    return $AsyncStateCopyWith<dynamic, $Res>(_self.createRecipeStatus,
        (value) {
      return _then(_self.copyWith(createRecipeStatus: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreateRecipeState].
extension CreateRecipeStatePatterns on CreateRecipeState {
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
    TResult Function(_CreateRecipeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateRecipeState() when $default != null:
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
    TResult Function(_CreateRecipeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRecipeState():
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
    TResult? Function(_CreateRecipeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRecipeState() when $default != null:
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
    TResult Function(List<RecipeIngredient> ingredients, Nutrition nutrition,
            AsyncState createRecipeStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateRecipeState() when $default != null:
        return $default(
            _that.ingredients, _that.nutrition, _that.createRecipeStatus);
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
    TResult Function(List<RecipeIngredient> ingredients, Nutrition nutrition,
            AsyncState createRecipeStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRecipeState():
        return $default(
            _that.ingredients, _that.nutrition, _that.createRecipeStatus);
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
    TResult? Function(List<RecipeIngredient> ingredients, Nutrition nutrition,
            AsyncState createRecipeStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateRecipeState() when $default != null:
        return $default(
            _that.ingredients, _that.nutrition, _that.createRecipeStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreateRecipeState implements CreateRecipeState {
  const _CreateRecipeState(
      {required final List<RecipeIngredient> ingredients,
      required this.nutrition,
      required this.createRecipeStatus})
      : _ingredients = ingredients;

  final List<RecipeIngredient> _ingredients;
  @override
  List<RecipeIngredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final Nutrition nutrition;
  @override
  final AsyncState createRecipeStatus;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateRecipeStateCopyWith<_CreateRecipeState> get copyWith =>
      __$CreateRecipeStateCopyWithImpl<_CreateRecipeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateRecipeState &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.createRecipeStatus, createRecipeStatus) ||
                other.createRecipeStatus == createRecipeStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ingredients),
      nutrition,
      createRecipeStatus);

  @override
  String toString() {
    return 'CreateRecipeState(ingredients: $ingredients, nutrition: $nutrition, createRecipeStatus: $createRecipeStatus)';
  }
}

/// @nodoc
abstract mixin class _$CreateRecipeStateCopyWith<$Res>
    implements $CreateRecipeStateCopyWith<$Res> {
  factory _$CreateRecipeStateCopyWith(
          _CreateRecipeState value, $Res Function(_CreateRecipeState) _then) =
      __$CreateRecipeStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<RecipeIngredient> ingredients,
      Nutrition nutrition,
      AsyncState createRecipeStatus});

  @override
  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus;
}

/// @nodoc
class __$CreateRecipeStateCopyWithImpl<$Res>
    implements _$CreateRecipeStateCopyWith<$Res> {
  __$CreateRecipeStateCopyWithImpl(this._self, this._then);

  final _CreateRecipeState _self;
  final $Res Function(_CreateRecipeState) _then;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ingredients = null,
    Object? nutrition = null,
    Object? createRecipeStatus = null,
  }) {
    return _then(_CreateRecipeState(
      ingredients: null == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<RecipeIngredient>,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
      createRecipeStatus: null == createRecipeStatus
          ? _self.createRecipeStatus
          : createRecipeStatus // ignore: cast_nullable_to_non_nullable
              as AsyncState,
    ));
  }

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus {
    return $AsyncStateCopyWith<dynamic, $Res>(_self.createRecipeStatus,
        (value) {
      return _then(_self.copyWith(createRecipeStatus: value));
    });
  }
}

// dart format on

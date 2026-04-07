// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_food_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateFoodState {
  FoodError? get validationError;
  AsyncState<CreatedFood> get createdFood;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateFoodStateCopyWith<CreateFoodState> get copyWith =>
      _$CreateFoodStateCopyWithImpl<CreateFoodState>(
          this as CreateFoodState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateFoodState &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.createdFood, createdFood) ||
                other.createdFood == createdFood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validationError, createdFood);

  @override
  String toString() {
    return 'CreateFoodState(validationError: $validationError, createdFood: $createdFood)';
  }
}

/// @nodoc
abstract mixin class $CreateFoodStateCopyWith<$Res> {
  factory $CreateFoodStateCopyWith(
          CreateFoodState value, $Res Function(CreateFoodState) _then) =
      _$CreateFoodStateCopyWithImpl;
  @useResult
  $Res call({FoodError? validationError, AsyncState<CreatedFood> createdFood});

  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood;
}

/// @nodoc
class _$CreateFoodStateCopyWithImpl<$Res>
    implements $CreateFoodStateCopyWith<$Res> {
  _$CreateFoodStateCopyWithImpl(this._self, this._then);

  final CreateFoodState _self;
  final $Res Function(CreateFoodState) _then;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validationError = freezed,
    Object? createdFood = null,
  }) {
    return _then(_self.copyWith(
      validationError: freezed == validationError
          ? _self.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as FoodError?,
      createdFood: null == createdFood
          ? _self.createdFood
          : createdFood // ignore: cast_nullable_to_non_nullable
              as AsyncState<CreatedFood>,
    ));
  }

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood {
    return $AsyncStateCopyWith<CreatedFood, $Res>(_self.createdFood, (value) {
      return _then(_self.copyWith(createdFood: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreateFoodState].
extension CreateFoodStatePatterns on CreateFoodState {
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
    TResult Function(_CreateFoodState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateFoodState() when $default != null:
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
    TResult Function(_CreateFoodState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFoodState():
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
    TResult? Function(_CreateFoodState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFoodState() when $default != null:
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
            FoodError? validationError, AsyncState<CreatedFood> createdFood)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateFoodState() when $default != null:
        return $default(_that.validationError, _that.createdFood);
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
            FoodError? validationError, AsyncState<CreatedFood> createdFood)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFoodState():
        return $default(_that.validationError, _that.createdFood);
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
            FoodError? validationError, AsyncState<CreatedFood> createdFood)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateFoodState() when $default != null:
        return $default(_that.validationError, _that.createdFood);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreateFoodState implements CreateFoodState {
  const _CreateFoodState({this.validationError, required this.createdFood});

  @override
  final FoodError? validationError;
  @override
  final AsyncState<CreatedFood> createdFood;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateFoodStateCopyWith<_CreateFoodState> get copyWith =>
      __$CreateFoodStateCopyWithImpl<_CreateFoodState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateFoodState &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.createdFood, createdFood) ||
                other.createdFood == createdFood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validationError, createdFood);

  @override
  String toString() {
    return 'CreateFoodState(validationError: $validationError, createdFood: $createdFood)';
  }
}

/// @nodoc
abstract mixin class _$CreateFoodStateCopyWith<$Res>
    implements $CreateFoodStateCopyWith<$Res> {
  factory _$CreateFoodStateCopyWith(
          _CreateFoodState value, $Res Function(_CreateFoodState) _then) =
      __$CreateFoodStateCopyWithImpl;
  @override
  @useResult
  $Res call({FoodError? validationError, AsyncState<CreatedFood> createdFood});

  @override
  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood;
}

/// @nodoc
class __$CreateFoodStateCopyWithImpl<$Res>
    implements _$CreateFoodStateCopyWith<$Res> {
  __$CreateFoodStateCopyWithImpl(this._self, this._then);

  final _CreateFoodState _self;
  final $Res Function(_CreateFoodState) _then;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? validationError = freezed,
    Object? createdFood = null,
  }) {
    return _then(_CreateFoodState(
      validationError: freezed == validationError
          ? _self.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as FoodError?,
      createdFood: null == createdFood
          ? _self.createdFood
          : createdFood // ignore: cast_nullable_to_non_nullable
              as AsyncState<CreatedFood>,
    ));
  }

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood {
    return $AsyncStateCopyWith<CreatedFood, $Res>(_self.createdFood, (value) {
      return _then(_self.copyWith(createdFood: value));
    });
  }
}

// dart format on

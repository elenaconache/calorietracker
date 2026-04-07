// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_food_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddFoodState {
  Meal? get selectedMeal;
  bool get isLoading;
  double? get servingSize;
  Nutrition get nutrition;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddFoodStateCopyWith<AddFoodState> get copyWith =>
      _$AddFoodStateCopyWithImpl<AddFoodState>(
          this as AddFoodState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddFoodState &&
            (identical(other.selectedMeal, selectedMeal) ||
                other.selectedMeal == selectedMeal) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedMeal, isLoading, servingSize, nutrition);

  @override
  String toString() {
    return 'AddFoodState(selectedMeal: $selectedMeal, isLoading: $isLoading, servingSize: $servingSize, nutrition: $nutrition)';
  }
}

/// @nodoc
abstract mixin class $AddFoodStateCopyWith<$Res> {
  factory $AddFoodStateCopyWith(
          AddFoodState value, $Res Function(AddFoodState) _then) =
      _$AddFoodStateCopyWithImpl;
  @useResult
  $Res call(
      {Meal? selectedMeal,
      bool isLoading,
      double? servingSize,
      Nutrition nutrition});
}

/// @nodoc
class _$AddFoodStateCopyWithImpl<$Res> implements $AddFoodStateCopyWith<$Res> {
  _$AddFoodStateCopyWithImpl(this._self, this._then);

  final AddFoodState _self;
  final $Res Function(AddFoodState) _then;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMeal = freezed,
    Object? isLoading = null,
    Object? servingSize = freezed,
    Object? nutrition = null,
  }) {
    return _then(_self.copyWith(
      selectedMeal: freezed == selectedMeal
          ? _self.selectedMeal
          : selectedMeal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      servingSize: freezed == servingSize
          ? _self.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddFoodState].
extension AddFoodStatePatterns on AddFoodState {
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
    TResult Function(_AddFoodState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddFoodState() when $default != null:
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
    TResult Function(_AddFoodState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddFoodState():
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
    TResult? Function(_AddFoodState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddFoodState() when $default != null:
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
    TResult Function(Meal? selectedMeal, bool isLoading, double? servingSize,
            Nutrition nutrition)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddFoodState() when $default != null:
        return $default(_that.selectedMeal, _that.isLoading, _that.servingSize,
            _that.nutrition);
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
    TResult Function(Meal? selectedMeal, bool isLoading, double? servingSize,
            Nutrition nutrition)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddFoodState():
        return $default(_that.selectedMeal, _that.isLoading, _that.servingSize,
            _that.nutrition);
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
    TResult? Function(Meal? selectedMeal, bool isLoading, double? servingSize,
            Nutrition nutrition)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddFoodState() when $default != null:
        return $default(_that.selectedMeal, _that.isLoading, _that.servingSize,
            _that.nutrition);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddFoodState implements AddFoodState {
  const _AddFoodState(
      {this.selectedMeal,
      required this.isLoading,
      this.servingSize,
      required this.nutrition});

  @override
  final Meal? selectedMeal;
  @override
  final bool isLoading;
  @override
  final double? servingSize;
  @override
  final Nutrition nutrition;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddFoodStateCopyWith<_AddFoodState> get copyWith =>
      __$AddFoodStateCopyWithImpl<_AddFoodState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddFoodState &&
            (identical(other.selectedMeal, selectedMeal) ||
                other.selectedMeal == selectedMeal) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedMeal, isLoading, servingSize, nutrition);

  @override
  String toString() {
    return 'AddFoodState(selectedMeal: $selectedMeal, isLoading: $isLoading, servingSize: $servingSize, nutrition: $nutrition)';
  }
}

/// @nodoc
abstract mixin class _$AddFoodStateCopyWith<$Res>
    implements $AddFoodStateCopyWith<$Res> {
  factory _$AddFoodStateCopyWith(
          _AddFoodState value, $Res Function(_AddFoodState) _then) =
      __$AddFoodStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Meal? selectedMeal,
      bool isLoading,
      double? servingSize,
      Nutrition nutrition});
}

/// @nodoc
class __$AddFoodStateCopyWithImpl<$Res>
    implements _$AddFoodStateCopyWith<$Res> {
  __$AddFoodStateCopyWithImpl(this._self, this._then);

  final _AddFoodState _self;
  final $Res Function(_AddFoodState) _then;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedMeal = freezed,
    Object? isLoading = null,
    Object? servingSize = freezed,
    Object? nutrition = null,
  }) {
    return _then(_AddFoodState(
      selectedMeal: freezed == selectedMeal
          ? _self.selectedMeal
          : selectedMeal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      servingSize: freezed == servingSize
          ? _self.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrition: null == nutrition
          ? _self.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
    ));
  }
}

// dart format on

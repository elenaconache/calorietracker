// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedFood {
  int? get localId;
  int? get createdFoodId;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreatedFoodCopyWith<CreatedFood> get copyWith =>
      _$CreatedFoodCopyWithImpl<CreatedFood>(this as CreatedFood, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatedFood &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.createdFoodId, createdFoodId) ||
                other.createdFoodId == createdFoodId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localId, createdFoodId);

  @override
  String toString() {
    return 'CreatedFood(localId: $localId, createdFoodId: $createdFoodId)';
  }
}

/// @nodoc
abstract mixin class $CreatedFoodCopyWith<$Res> {
  factory $CreatedFoodCopyWith(
          CreatedFood value, $Res Function(CreatedFood) _then) =
      _$CreatedFoodCopyWithImpl;
  @useResult
  $Res call({int? localId, int? createdFoodId});
}

/// @nodoc
class _$CreatedFoodCopyWithImpl<$Res> implements $CreatedFoodCopyWith<$Res> {
  _$CreatedFoodCopyWithImpl(this._self, this._then);

  final CreatedFood _self;
  final $Res Function(CreatedFood) _then;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? createdFoodId = freezed,
  }) {
    return _then(_self.copyWith(
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdFoodId: freezed == createdFoodId
          ? _self.createdFoodId
          : createdFoodId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreatedFood].
extension CreatedFoodPatterns on CreatedFood {
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
    TResult Function(_CreatedFood value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreatedFood() when $default != null:
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
    TResult Function(_CreatedFood value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatedFood():
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
    TResult? Function(_CreatedFood value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatedFood() when $default != null:
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
    TResult Function(int? localId, int? createdFoodId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreatedFood() when $default != null:
        return $default(_that.localId, _that.createdFoodId);
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
    TResult Function(int? localId, int? createdFoodId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatedFood():
        return $default(_that.localId, _that.createdFoodId);
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
    TResult? Function(int? localId, int? createdFoodId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatedFood() when $default != null:
        return $default(_that.localId, _that.createdFoodId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreatedFood implements CreatedFood {
  const _CreatedFood({this.localId, this.createdFoodId});

  @override
  final int? localId;
  @override
  final int? createdFoodId;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreatedFoodCopyWith<_CreatedFood> get copyWith =>
      __$CreatedFoodCopyWithImpl<_CreatedFood>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreatedFood &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.createdFoodId, createdFoodId) ||
                other.createdFoodId == createdFoodId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localId, createdFoodId);

  @override
  String toString() {
    return 'CreatedFood(localId: $localId, createdFoodId: $createdFoodId)';
  }
}

/// @nodoc
abstract mixin class _$CreatedFoodCopyWith<$Res>
    implements $CreatedFoodCopyWith<$Res> {
  factory _$CreatedFoodCopyWith(
          _CreatedFood value, $Res Function(_CreatedFood) _then) =
      __$CreatedFoodCopyWithImpl;
  @override
  @useResult
  $Res call({int? localId, int? createdFoodId});
}

/// @nodoc
class __$CreatedFoodCopyWithImpl<$Res> implements _$CreatedFoodCopyWith<$Res> {
  __$CreatedFoodCopyWithImpl(this._self, this._then);

  final _CreatedFood _self;
  final $Res Function(_CreatedFood) _then;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = freezed,
    Object? createdFoodId = freezed,
  }) {
    return _then(_CreatedFood(
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdFoodId: freezed == createdFoodId
          ? _self.createdFoodId
          : createdFoodId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

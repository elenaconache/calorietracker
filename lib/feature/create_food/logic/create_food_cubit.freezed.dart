// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_food_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateFoodState {
  FoodError? get validationError => throw _privateConstructorUsedError;
  AsyncState<CreatedFood> get createdFood => throw _privateConstructorUsedError;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFoodStateCopyWith<CreateFoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFoodStateCopyWith<$Res> {
  factory $CreateFoodStateCopyWith(
          CreateFoodState value, $Res Function(CreateFoodState) then) =
      _$CreateFoodStateCopyWithImpl<$Res, CreateFoodState>;
  @useResult
  $Res call({FoodError? validationError, AsyncState<CreatedFood> createdFood});

  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood;
}

/// @nodoc
class _$CreateFoodStateCopyWithImpl<$Res, $Val extends CreateFoodState>
    implements $CreateFoodStateCopyWith<$Res> {
  _$CreateFoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validationError = freezed,
    Object? createdFood = null,
  }) {
    return _then(_value.copyWith(
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as FoodError?,
      createdFood: null == createdFood
          ? _value.createdFood
          : createdFood // ignore: cast_nullable_to_non_nullable
              as AsyncState<CreatedFood>,
    ) as $Val);
  }

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood {
    return $AsyncStateCopyWith<CreatedFood, $Res>(_value.createdFood, (value) {
      return _then(_value.copyWith(createdFood: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateFoodStateImplCopyWith<$Res>
    implements $CreateFoodStateCopyWith<$Res> {
  factory _$$CreateFoodStateImplCopyWith(_$CreateFoodStateImpl value,
          $Res Function(_$CreateFoodStateImpl) then) =
      __$$CreateFoodStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodError? validationError, AsyncState<CreatedFood> createdFood});

  @override
  $AsyncStateCopyWith<CreatedFood, $Res> get createdFood;
}

/// @nodoc
class __$$CreateFoodStateImplCopyWithImpl<$Res>
    extends _$CreateFoodStateCopyWithImpl<$Res, _$CreateFoodStateImpl>
    implements _$$CreateFoodStateImplCopyWith<$Res> {
  __$$CreateFoodStateImplCopyWithImpl(
      _$CreateFoodStateImpl _value, $Res Function(_$CreateFoodStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validationError = freezed,
    Object? createdFood = null,
  }) {
    return _then(_$CreateFoodStateImpl(
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as FoodError?,
      createdFood: null == createdFood
          ? _value.createdFood
          : createdFood // ignore: cast_nullable_to_non_nullable
              as AsyncState<CreatedFood>,
    ));
  }
}

/// @nodoc

class _$CreateFoodStateImpl implements _CreateFoodState {
  const _$CreateFoodStateImpl(
      {this.validationError, required this.createdFood});

  @override
  final FoodError? validationError;
  @override
  final AsyncState<CreatedFood> createdFood;

  @override
  String toString() {
    return 'CreateFoodState(validationError: $validationError, createdFood: $createdFood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFoodStateImpl &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.createdFood, createdFood) ||
                other.createdFood == createdFood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, validationError, createdFood);

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFoodStateImplCopyWith<_$CreateFoodStateImpl> get copyWith =>
      __$$CreateFoodStateImplCopyWithImpl<_$CreateFoodStateImpl>(
          this, _$identity);
}

abstract class _CreateFoodState implements CreateFoodState {
  const factory _CreateFoodState(
          {final FoodError? validationError,
          required final AsyncState<CreatedFood> createdFood}) =
      _$CreateFoodStateImpl;

  @override
  FoodError? get validationError;
  @override
  AsyncState<CreatedFood> get createdFood;

  /// Create a copy of CreateFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFoodStateImplCopyWith<_$CreateFoodStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

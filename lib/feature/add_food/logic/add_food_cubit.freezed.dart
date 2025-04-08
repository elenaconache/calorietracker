// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_food_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddFoodState {
  Meal? get selectedMeal => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  double? get servingSize => throw _privateConstructorUsedError;
  Nutrition get nutrition => throw _privateConstructorUsedError;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFoodStateCopyWith<AddFoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFoodStateCopyWith<$Res> {
  factory $AddFoodStateCopyWith(
          AddFoodState value, $Res Function(AddFoodState) then) =
      _$AddFoodStateCopyWithImpl<$Res, AddFoodState>;
  @useResult
  $Res call(
      {Meal? selectedMeal,
      bool isLoading,
      double? servingSize,
      Nutrition nutrition});
}

/// @nodoc
class _$AddFoodStateCopyWithImpl<$Res, $Val extends AddFoodState>
    implements $AddFoodStateCopyWith<$Res> {
  _$AddFoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      selectedMeal: freezed == selectedMeal
          ? _value.selectedMeal
          : selectedMeal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      servingSize: freezed == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFoodStateImplCopyWith<$Res>
    implements $AddFoodStateCopyWith<$Res> {
  factory _$$AddFoodStateImplCopyWith(
          _$AddFoodStateImpl value, $Res Function(_$AddFoodStateImpl) then) =
      __$$AddFoodStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Meal? selectedMeal,
      bool isLoading,
      double? servingSize,
      Nutrition nutrition});
}

/// @nodoc
class __$$AddFoodStateImplCopyWithImpl<$Res>
    extends _$AddFoodStateCopyWithImpl<$Res, _$AddFoodStateImpl>
    implements _$$AddFoodStateImplCopyWith<$Res> {
  __$$AddFoodStateImplCopyWithImpl(
      _$AddFoodStateImpl _value, $Res Function(_$AddFoodStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$AddFoodStateImpl(
      selectedMeal: freezed == selectedMeal
          ? _value.selectedMeal
          : selectedMeal // ignore: cast_nullable_to_non_nullable
              as Meal?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      servingSize: freezed == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
    ));
  }
}

/// @nodoc

class _$AddFoodStateImpl implements _AddFoodState {
  const _$AddFoodStateImpl(
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

  @override
  String toString() {
    return 'AddFoodState(selectedMeal: $selectedMeal, isLoading: $isLoading, servingSize: $servingSize, nutrition: $nutrition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFoodStateImpl &&
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

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFoodStateImplCopyWith<_$AddFoodStateImpl> get copyWith =>
      __$$AddFoodStateImplCopyWithImpl<_$AddFoodStateImpl>(this, _$identity);
}

abstract class _AddFoodState implements AddFoodState {
  const factory _AddFoodState(
      {final Meal? selectedMeal,
      required final bool isLoading,
      final double? servingSize,
      required final Nutrition nutrition}) = _$AddFoodStateImpl;

  @override
  Meal? get selectedMeal;
  @override
  bool get isLoading;
  @override
  double? get servingSize;
  @override
  Nutrition get nutrition;

  /// Create a copy of AddFoodState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFoodStateImplCopyWith<_$AddFoodStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

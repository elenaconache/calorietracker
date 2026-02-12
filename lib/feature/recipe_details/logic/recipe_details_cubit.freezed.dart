// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeDetailsState {
  AsyncState<Nutrition> get nutrition => throw _privateConstructorUsedError;
  AsyncState<List<RecipeIngredient>> get ingredients =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeDetailsStateCopyWith<RecipeDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDetailsStateCopyWith<$Res> {
  factory $RecipeDetailsStateCopyWith(
          RecipeDetailsState value, $Res Function(RecipeDetailsState) then) =
      _$RecipeDetailsStateCopyWithImpl<$Res, RecipeDetailsState>;
  @useResult
  $Res call(
      {AsyncState<Nutrition> nutrition,
      AsyncState<List<RecipeIngredient>> ingredients});

  $AsyncStateCopyWith<Nutrition, $Res> get nutrition;
  $AsyncStateCopyWith<List<RecipeIngredient>, $Res> get ingredients;
}

/// @nodoc
class _$RecipeDetailsStateCopyWithImpl<$Res, $Val extends RecipeDetailsState>
    implements $RecipeDetailsStateCopyWith<$Res> {
  _$RecipeDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrition = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as AsyncState<Nutrition>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<RecipeIngredient>>,
    ) as $Val);
  }

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<Nutrition, $Res> get nutrition {
    return $AsyncStateCopyWith<Nutrition, $Res>(_value.nutrition, (value) {
      return _then(_value.copyWith(nutrition: value) as $Val);
    });
  }

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<RecipeIngredient>, $Res> get ingredients {
    return $AsyncStateCopyWith<List<RecipeIngredient>, $Res>(_value.ingredients,
        (value) {
      return _then(_value.copyWith(ingredients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeDetailsStateImplCopyWith<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  factory _$$RecipeDetailsStateImplCopyWith(_$RecipeDetailsStateImpl value,
          $Res Function(_$RecipeDetailsStateImpl) then) =
      __$$RecipeDetailsStateImplCopyWithImpl<$Res>;
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
class __$$RecipeDetailsStateImplCopyWithImpl<$Res>
    extends _$RecipeDetailsStateCopyWithImpl<$Res, _$RecipeDetailsStateImpl>
    implements _$$RecipeDetailsStateImplCopyWith<$Res> {
  __$$RecipeDetailsStateImplCopyWithImpl(_$RecipeDetailsStateImpl _value,
      $Res Function(_$RecipeDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrition = null,
    Object? ingredients = null,
  }) {
    return _then(_$RecipeDetailsStateImpl(
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as AsyncState<Nutrition>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<RecipeIngredient>>,
    ));
  }
}

/// @nodoc

class _$RecipeDetailsStateImpl implements _RecipeDetailsState {
  const _$RecipeDetailsStateImpl(
      {required this.nutrition, required this.ingredients});

  @override
  final AsyncState<Nutrition> nutrition;
  @override
  final AsyncState<List<RecipeIngredient>> ingredients;

  @override
  String toString() {
    return 'RecipeDetailsState(nutrition: $nutrition, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeDetailsStateImpl &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nutrition, ingredients);

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeDetailsStateImplCopyWith<_$RecipeDetailsStateImpl> get copyWith =>
      __$$RecipeDetailsStateImplCopyWithImpl<_$RecipeDetailsStateImpl>(
          this, _$identity);
}

abstract class _RecipeDetailsState implements RecipeDetailsState {
  const factory _RecipeDetailsState(
          {required final AsyncState<Nutrition> nutrition,
          required final AsyncState<List<RecipeIngredient>> ingredients}) =
      _$RecipeDetailsStateImpl;

  @override
  AsyncState<Nutrition> get nutrition;
  @override
  AsyncState<List<RecipeIngredient>> get ingredients;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeDetailsStateImplCopyWith<_$RecipeDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

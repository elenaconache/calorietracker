// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateRecipeState {
  List<RecipeIngredient> get ingredients => throw _privateConstructorUsedError;
  Nutrition get nutrition => throw _privateConstructorUsedError;
  AsyncState<dynamic> get createRecipeStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRecipeStateCopyWith<CreateRecipeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRecipeStateCopyWith<$Res> {
  factory $CreateRecipeStateCopyWith(
          CreateRecipeState value, $Res Function(CreateRecipeState) then) =
      _$CreateRecipeStateCopyWithImpl<$Res, CreateRecipeState>;
  @useResult
  $Res call(
      {List<RecipeIngredient> ingredients,
      Nutrition nutrition,
      AsyncState<dynamic> createRecipeStatus});

  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus;
}

/// @nodoc
class _$CreateRecipeStateCopyWithImpl<$Res, $Val extends CreateRecipeState>
    implements $CreateRecipeStateCopyWith<$Res> {
  _$CreateRecipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
    Object? nutrition = null,
    Object? createRecipeStatus = null,
  }) {
    return _then(_value.copyWith(
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<RecipeIngredient>,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
      createRecipeStatus: null == createRecipeStatus
          ? _value.createRecipeStatus
          : createRecipeStatus // ignore: cast_nullable_to_non_nullable
              as AsyncState<dynamic>,
    ) as $Val);
  }

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus {
    return $AsyncStateCopyWith<dynamic, $Res>(_value.createRecipeStatus,
        (value) {
      return _then(_value.copyWith(createRecipeStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateRecipeStateImplCopyWith<$Res>
    implements $CreateRecipeStateCopyWith<$Res> {
  factory _$$CreateRecipeStateImplCopyWith(_$CreateRecipeStateImpl value,
          $Res Function(_$CreateRecipeStateImpl) then) =
      __$$CreateRecipeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RecipeIngredient> ingredients,
      Nutrition nutrition,
      AsyncState<dynamic> createRecipeStatus});

  @override
  $AsyncStateCopyWith<dynamic, $Res> get createRecipeStatus;
}

/// @nodoc
class __$$CreateRecipeStateImplCopyWithImpl<$Res>
    extends _$CreateRecipeStateCopyWithImpl<$Res, _$CreateRecipeStateImpl>
    implements _$$CreateRecipeStateImplCopyWith<$Res> {
  __$$CreateRecipeStateImplCopyWithImpl(_$CreateRecipeStateImpl _value,
      $Res Function(_$CreateRecipeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
    Object? nutrition = null,
    Object? createRecipeStatus = null,
  }) {
    return _then(_$CreateRecipeStateImpl(
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<RecipeIngredient>,
      nutrition: null == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as Nutrition,
      createRecipeStatus: null == createRecipeStatus
          ? _value.createRecipeStatus
          : createRecipeStatus // ignore: cast_nullable_to_non_nullable
              as AsyncState<dynamic>,
    ));
  }
}

/// @nodoc

class _$CreateRecipeStateImpl implements _CreateRecipeState {
  const _$CreateRecipeStateImpl(
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
  final AsyncState<dynamic> createRecipeStatus;

  @override
  String toString() {
    return 'CreateRecipeState(ingredients: $ingredients, nutrition: $nutrition, createRecipeStatus: $createRecipeStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRecipeStateImpl &&
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

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRecipeStateImplCopyWith<_$CreateRecipeStateImpl> get copyWith =>
      __$$CreateRecipeStateImplCopyWithImpl<_$CreateRecipeStateImpl>(
          this, _$identity);
}

abstract class _CreateRecipeState implements CreateRecipeState {
  const factory _CreateRecipeState(
          {required final List<RecipeIngredient> ingredients,
          required final Nutrition nutrition,
          required final AsyncState<dynamic> createRecipeStatus}) =
      _$CreateRecipeStateImpl;

  @override
  List<RecipeIngredient> get ingredients;
  @override
  Nutrition get nutrition;
  @override
  AsyncState<dynamic> get createRecipeStatus;

  /// Create a copy of CreateRecipeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRecipeStateImplCopyWith<_$CreateRecipeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

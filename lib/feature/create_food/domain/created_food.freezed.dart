// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreatedFood {
  int? get localId => throw _privateConstructorUsedError;
  int? get createdFoodId => throw _privateConstructorUsedError;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatedFoodCopyWith<CreatedFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedFoodCopyWith<$Res> {
  factory $CreatedFoodCopyWith(
          CreatedFood value, $Res Function(CreatedFood) then) =
      _$CreatedFoodCopyWithImpl<$Res, CreatedFood>;
  @useResult
  $Res call({int? localId, int? createdFoodId});
}

/// @nodoc
class _$CreatedFoodCopyWithImpl<$Res, $Val extends CreatedFood>
    implements $CreatedFoodCopyWith<$Res> {
  _$CreatedFoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? createdFoodId = freezed,
  }) {
    return _then(_value.copyWith(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdFoodId: freezed == createdFoodId
          ? _value.createdFoodId
          : createdFoodId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedFoodImplCopyWith<$Res>
    implements $CreatedFoodCopyWith<$Res> {
  factory _$$CreatedFoodImplCopyWith(
          _$CreatedFoodImpl value, $Res Function(_$CreatedFoodImpl) then) =
      __$$CreatedFoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? localId, int? createdFoodId});
}

/// @nodoc
class __$$CreatedFoodImplCopyWithImpl<$Res>
    extends _$CreatedFoodCopyWithImpl<$Res, _$CreatedFoodImpl>
    implements _$$CreatedFoodImplCopyWith<$Res> {
  __$$CreatedFoodImplCopyWithImpl(
      _$CreatedFoodImpl _value, $Res Function(_$CreatedFoodImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? createdFoodId = freezed,
  }) {
    return _then(_$CreatedFoodImpl(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdFoodId: freezed == createdFoodId
          ? _value.createdFoodId
          : createdFoodId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CreatedFoodImpl implements _CreatedFood {
  const _$CreatedFoodImpl({this.localId, this.createdFoodId});

  @override
  final int? localId;
  @override
  final int? createdFoodId;

  @override
  String toString() {
    return 'CreatedFood(localId: $localId, createdFoodId: $createdFoodId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedFoodImpl &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.createdFoodId, createdFoodId) ||
                other.createdFoodId == createdFoodId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localId, createdFoodId);

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedFoodImplCopyWith<_$CreatedFoodImpl> get copyWith =>
      __$$CreatedFoodImplCopyWithImpl<_$CreatedFoodImpl>(this, _$identity);
}

abstract class _CreatedFood implements CreatedFood {
  const factory _CreatedFood({final int? localId, final int? createdFoodId}) =
      _$CreatedFoodImpl;

  @override
  int? get localId;
  @override
  int? get createdFoodId;

  /// Create a copy of CreatedFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedFoodImplCopyWith<_$CreatedFoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

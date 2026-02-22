// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) generalFailure,
    required TResult Function(String? message) connection,
    required TResult Function(AuthError type) auth,
    required TResult Function(CreateRecipeError type) createRecipe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? generalFailure,
    TResult? Function(String? message)? connection,
    TResult? Function(AuthError type)? auth,
    TResult? Function(CreateRecipeError type)? createRecipe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? generalFailure,
    TResult Function(String? message)? connection,
    TResult Function(AuthError type)? auth,
    TResult Function(CreateRecipeError type)? createRecipe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralFailure value) generalFailure,
    required TResult Function(ConnectionFailure value) connection,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(CreateRecipeFailure value) createRecipe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralFailure value)? generalFailure,
    TResult? Function(ConnectionFailure value)? connection,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(CreateRecipeFailure value)? createRecipe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralFailure value)? generalFailure,
    TResult Function(ConnectionFailure value)? connection,
    TResult Function(AuthFailure value)? auth,
    TResult Function(CreateRecipeFailure value)? createRecipe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GeneralFailureImplCopyWith<$Res> {
  factory _$$GeneralFailureImplCopyWith(_$GeneralFailureImpl value,
          $Res Function(_$GeneralFailureImpl) then) =
      __$$GeneralFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$GeneralFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GeneralFailureImpl>
    implements _$$GeneralFailureImplCopyWith<$Res> {
  __$$GeneralFailureImplCopyWithImpl(
      _$GeneralFailureImpl _value, $Res Function(_$GeneralFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$GeneralFailureImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GeneralFailureImpl implements GeneralFailure {
  const _$GeneralFailureImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.generalFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralFailureImplCopyWith<_$GeneralFailureImpl> get copyWith =>
      __$$GeneralFailureImplCopyWithImpl<_$GeneralFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) generalFailure,
    required TResult Function(String? message) connection,
    required TResult Function(AuthError type) auth,
    required TResult Function(CreateRecipeError type) createRecipe,
  }) {
    return generalFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? generalFailure,
    TResult? Function(String? message)? connection,
    TResult? Function(AuthError type)? auth,
    TResult? Function(CreateRecipeError type)? createRecipe,
  }) {
    return generalFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? generalFailure,
    TResult Function(String? message)? connection,
    TResult Function(AuthError type)? auth,
    TResult Function(CreateRecipeError type)? createRecipe,
    required TResult orElse(),
  }) {
    if (generalFailure != null) {
      return generalFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralFailure value) generalFailure,
    required TResult Function(ConnectionFailure value) connection,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(CreateRecipeFailure value) createRecipe,
  }) {
    return generalFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralFailure value)? generalFailure,
    TResult? Function(ConnectionFailure value)? connection,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(CreateRecipeFailure value)? createRecipe,
  }) {
    return generalFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralFailure value)? generalFailure,
    TResult Function(ConnectionFailure value)? connection,
    TResult Function(AuthFailure value)? auth,
    TResult Function(CreateRecipeFailure value)? createRecipe,
    required TResult orElse(),
  }) {
    if (generalFailure != null) {
      return generalFailure(this);
    }
    return orElse();
  }
}

abstract class GeneralFailure implements Failure {
  const factory GeneralFailure({final String? message}) = _$GeneralFailureImpl;

  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralFailureImplCopyWith<_$GeneralFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionFailureImplCopyWith<$Res> {
  factory _$$ConnectionFailureImplCopyWith(_$ConnectionFailureImpl value,
          $Res Function(_$ConnectionFailureImpl) then) =
      __$$ConnectionFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ConnectionFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConnectionFailureImpl>
    implements _$$ConnectionFailureImplCopyWith<$Res> {
  __$$ConnectionFailureImplCopyWithImpl(_$ConnectionFailureImpl _value,
      $Res Function(_$ConnectionFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ConnectionFailureImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConnectionFailureImpl implements ConnectionFailure {
  const _$ConnectionFailureImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.connection(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionFailureImplCopyWith<_$ConnectionFailureImpl> get copyWith =>
      __$$ConnectionFailureImplCopyWithImpl<_$ConnectionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) generalFailure,
    required TResult Function(String? message) connection,
    required TResult Function(AuthError type) auth,
    required TResult Function(CreateRecipeError type) createRecipe,
  }) {
    return connection(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? generalFailure,
    TResult? Function(String? message)? connection,
    TResult? Function(AuthError type)? auth,
    TResult? Function(CreateRecipeError type)? createRecipe,
  }) {
    return connection?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? generalFailure,
    TResult Function(String? message)? connection,
    TResult Function(AuthError type)? auth,
    TResult Function(CreateRecipeError type)? createRecipe,
    required TResult orElse(),
  }) {
    if (connection != null) {
      return connection(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralFailure value) generalFailure,
    required TResult Function(ConnectionFailure value) connection,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(CreateRecipeFailure value) createRecipe,
  }) {
    return connection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralFailure value)? generalFailure,
    TResult? Function(ConnectionFailure value)? connection,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(CreateRecipeFailure value)? createRecipe,
  }) {
    return connection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralFailure value)? generalFailure,
    TResult Function(ConnectionFailure value)? connection,
    TResult Function(AuthFailure value)? auth,
    TResult Function(CreateRecipeFailure value)? createRecipe,
    required TResult orElse(),
  }) {
    if (connection != null) {
      return connection(this);
    }
    return orElse();
  }
}

abstract class ConnectionFailure implements Failure {
  const factory ConnectionFailure({final String? message}) =
      _$ConnectionFailureImpl;

  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionFailureImplCopyWith<_$ConnectionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthError type});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$AuthFailureImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthError,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl({this.type = AuthError.unknown});

  @override
  @JsonKey()
  final AuthError type;

  @override
  String toString() {
    return 'Failure.auth(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) generalFailure,
    required TResult Function(String? message) connection,
    required TResult Function(AuthError type) auth,
    required TResult Function(CreateRecipeError type) createRecipe,
  }) {
    return auth(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? generalFailure,
    TResult? Function(String? message)? connection,
    TResult? Function(AuthError type)? auth,
    TResult? Function(CreateRecipeError type)? createRecipe,
  }) {
    return auth?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? generalFailure,
    TResult Function(String? message)? connection,
    TResult Function(AuthError type)? auth,
    TResult Function(CreateRecipeError type)? createRecipe,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralFailure value) generalFailure,
    required TResult Function(ConnectionFailure value) connection,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(CreateRecipeFailure value) createRecipe,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralFailure value)? generalFailure,
    TResult? Function(ConnectionFailure value)? connection,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(CreateRecipeFailure value)? createRecipe,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralFailure value)? generalFailure,
    TResult Function(ConnectionFailure value)? connection,
    TResult Function(AuthFailure value)? auth,
    TResult Function(CreateRecipeFailure value)? createRecipe,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements Failure {
  const factory AuthFailure({final AuthError type}) = _$AuthFailureImpl;

  AuthError get type;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateRecipeFailureImplCopyWith<$Res> {
  factory _$$CreateRecipeFailureImplCopyWith(_$CreateRecipeFailureImpl value,
          $Res Function(_$CreateRecipeFailureImpl) then) =
      __$$CreateRecipeFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateRecipeError type});
}

/// @nodoc
class __$$CreateRecipeFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CreateRecipeFailureImpl>
    implements _$$CreateRecipeFailureImplCopyWith<$Res> {
  __$$CreateRecipeFailureImplCopyWithImpl(_$CreateRecipeFailureImpl _value,
      $Res Function(_$CreateRecipeFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$CreateRecipeFailureImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CreateRecipeError,
    ));
  }
}

/// @nodoc

class _$CreateRecipeFailureImpl implements CreateRecipeFailure {
  const _$CreateRecipeFailureImpl({this.type = CreateRecipeError.unknown});

  @override
  @JsonKey()
  final CreateRecipeError type;

  @override
  String toString() {
    return 'Failure.createRecipe(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRecipeFailureImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRecipeFailureImplCopyWith<_$CreateRecipeFailureImpl> get copyWith =>
      __$$CreateRecipeFailureImplCopyWithImpl<_$CreateRecipeFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) generalFailure,
    required TResult Function(String? message) connection,
    required TResult Function(AuthError type) auth,
    required TResult Function(CreateRecipeError type) createRecipe,
  }) {
    return createRecipe(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? generalFailure,
    TResult? Function(String? message)? connection,
    TResult? Function(AuthError type)? auth,
    TResult? Function(CreateRecipeError type)? createRecipe,
  }) {
    return createRecipe?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? generalFailure,
    TResult Function(String? message)? connection,
    TResult Function(AuthError type)? auth,
    TResult Function(CreateRecipeError type)? createRecipe,
    required TResult orElse(),
  }) {
    if (createRecipe != null) {
      return createRecipe(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralFailure value) generalFailure,
    required TResult Function(ConnectionFailure value) connection,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(CreateRecipeFailure value) createRecipe,
  }) {
    return createRecipe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralFailure value)? generalFailure,
    TResult? Function(ConnectionFailure value)? connection,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(CreateRecipeFailure value)? createRecipe,
  }) {
    return createRecipe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralFailure value)? generalFailure,
    TResult Function(ConnectionFailure value)? connection,
    TResult Function(AuthFailure value)? auth,
    TResult Function(CreateRecipeFailure value)? createRecipe,
    required TResult orElse(),
  }) {
    if (createRecipe != null) {
      return createRecipe(this);
    }
    return orElse();
  }
}

abstract class CreateRecipeFailure implements Failure {
  const factory CreateRecipeFailure({final CreateRecipeError type}) =
      _$CreateRecipeFailureImpl;

  CreateRecipeError get type;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRecipeFailureImplCopyWith<_$CreateRecipeFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

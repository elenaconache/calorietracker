// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure()';
  }
}

/// @nodoc
class $FailureCopyWith<$Res> {
  $FailureCopyWith(Failure _, $Res Function(Failure) __);
}

/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneralFailure value)? generalFailure,
    TResult Function(ConnectionFailure value)? connection,
    TResult Function(AuthFailure value)? auth,
    TResult Function(CreateRecipeFailure value)? createRecipe,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GeneralFailure() when generalFailure != null:
        return generalFailure(_that);
      case ConnectionFailure() when connection != null:
        return connection(_that);
      case AuthFailure() when auth != null:
        return auth(_that);
      case CreateRecipeFailure() when createRecipe != null:
        return createRecipe(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(GeneralFailure value) generalFailure,
    required TResult Function(ConnectionFailure value) connection,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(CreateRecipeFailure value) createRecipe,
  }) {
    final _that = this;
    switch (_that) {
      case GeneralFailure():
        return generalFailure(_that);
      case ConnectionFailure():
        return connection(_that);
      case AuthFailure():
        return auth(_that);
      case CreateRecipeFailure():
        return createRecipe(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneralFailure value)? generalFailure,
    TResult? Function(ConnectionFailure value)? connection,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(CreateRecipeFailure value)? createRecipe,
  }) {
    final _that = this;
    switch (_that) {
      case GeneralFailure() when generalFailure != null:
        return generalFailure(_that);
      case ConnectionFailure() when connection != null:
        return connection(_that);
      case AuthFailure() when auth != null:
        return auth(_that);
      case CreateRecipeFailure() when createRecipe != null:
        return createRecipe(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? generalFailure,
    TResult Function(String? message)? connection,
    TResult Function(AuthError type)? auth,
    TResult Function(CreateRecipeError type)? createRecipe,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GeneralFailure() when generalFailure != null:
        return generalFailure(_that.message);
      case ConnectionFailure() when connection != null:
        return connection(_that.message);
      case AuthFailure() when auth != null:
        return auth(_that.type);
      case CreateRecipeFailure() when createRecipe != null:
        return createRecipe(_that.type);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) generalFailure,
    required TResult Function(String? message) connection,
    required TResult Function(AuthError type) auth,
    required TResult Function(CreateRecipeError type) createRecipe,
  }) {
    final _that = this;
    switch (_that) {
      case GeneralFailure():
        return generalFailure(_that.message);
      case ConnectionFailure():
        return connection(_that.message);
      case AuthFailure():
        return auth(_that.type);
      case CreateRecipeFailure():
        return createRecipe(_that.type);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? generalFailure,
    TResult? Function(String? message)? connection,
    TResult? Function(AuthError type)? auth,
    TResult? Function(CreateRecipeError type)? createRecipe,
  }) {
    final _that = this;
    switch (_that) {
      case GeneralFailure() when generalFailure != null:
        return generalFailure(_that.message);
      case ConnectionFailure() when connection != null:
        return connection(_that.message);
      case AuthFailure() when auth != null:
        return auth(_that.type);
      case CreateRecipeFailure() when createRecipe != null:
        return createRecipe(_that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GeneralFailure implements Failure {
  const GeneralFailure({this.message});

  final String? message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeneralFailureCopyWith<GeneralFailure> get copyWith =>
      _$GeneralFailureCopyWithImpl<GeneralFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeneralFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.generalFailure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GeneralFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $GeneralFailureCopyWith(
          GeneralFailure value, $Res Function(GeneralFailure) _then) =
      _$GeneralFailureCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$GeneralFailureCopyWithImpl<$Res>
    implements $GeneralFailureCopyWith<$Res> {
  _$GeneralFailureCopyWithImpl(this._self, this._then);

  final GeneralFailure _self;
  final $Res Function(GeneralFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(GeneralFailure(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class ConnectionFailure implements Failure {
  const ConnectionFailure({this.message});

  final String? message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConnectionFailureCopyWith<ConnectionFailure> get copyWith =>
      _$ConnectionFailureCopyWithImpl<ConnectionFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConnectionFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.connection(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ConnectionFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ConnectionFailureCopyWith(
          ConnectionFailure value, $Res Function(ConnectionFailure) _then) =
      _$ConnectionFailureCopyWithImpl;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$ConnectionFailureCopyWithImpl<$Res>
    implements $ConnectionFailureCopyWith<$Res> {
  _$ConnectionFailureCopyWithImpl(this._self, this._then);

  final ConnectionFailure _self;
  final $Res Function(ConnectionFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ConnectionFailure(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class AuthFailure implements Failure {
  const AuthFailure({this.type = AuthError.unknown});

  @JsonKey()
  final AuthError type;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthFailure &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'Failure.auth(type: $type)';
  }
}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) _then) =
      _$AuthFailureCopyWithImpl;
  @useResult
  $Res call({AuthError type});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(AuthFailure(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthError,
    ));
  }
}

/// @nodoc

class CreateRecipeFailure implements Failure {
  const CreateRecipeFailure({this.type = CreateRecipeError.unknown});

  @JsonKey()
  final CreateRecipeError type;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateRecipeFailureCopyWith<CreateRecipeFailure> get copyWith =>
      _$CreateRecipeFailureCopyWithImpl<CreateRecipeFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateRecipeFailure &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @override
  String toString() {
    return 'Failure.createRecipe(type: $type)';
  }
}

/// @nodoc
abstract mixin class $CreateRecipeFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $CreateRecipeFailureCopyWith(
          CreateRecipeFailure value, $Res Function(CreateRecipeFailure) _then) =
      _$CreateRecipeFailureCopyWithImpl;
  @useResult
  $Res call({CreateRecipeError type});
}

/// @nodoc
class _$CreateRecipeFailureCopyWithImpl<$Res>
    implements $CreateRecipeFailureCopyWith<$Res> {
  _$CreateRecipeFailureCopyWithImpl(this._self, this._then);

  final CreateRecipeFailure _self;
  final $Res Function(CreateRecipeFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
  }) {
    return _then(CreateRecipeFailure(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CreateRecipeError,
    ));
  }
}

// dart format on

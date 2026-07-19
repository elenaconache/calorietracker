// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_collection_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseCollectionError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseCollectionError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BaseCollectionError()';
}


}

/// @nodoc
class $BaseCollectionErrorCopyWith<$Res>  {
$BaseCollectionErrorCopyWith(BaseCollectionError _, $Res Function(BaseCollectionError) __);
}


/// Adds pattern-matching-related methods to [BaseCollectionError].
extension BaseCollectionErrorPatterns on BaseCollectionError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateFoodApiError value)?  createFood,TResult Function( AddLocalDataApiError value)?  addLocalData,TResult Function( UnknownApiError value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateFoodApiError() when createFood != null:
return createFood(_that);case AddLocalDataApiError() when addLocalData != null:
return addLocalData(_that);case UnknownApiError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateFoodApiError value)  createFood,required TResult Function( AddLocalDataApiError value)  addLocalData,required TResult Function( UnknownApiError value)  unknown,}){
final _that = this;
switch (_that) {
case CreateFoodApiError():
return createFood(_that);case AddLocalDataApiError():
return addLocalData(_that);case UnknownApiError():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateFoodApiError value)?  createFood,TResult? Function( AddLocalDataApiError value)?  addLocalData,TResult? Function( UnknownApiError value)?  unknown,}){
final _that = this;
switch (_that) {
case CreateFoodApiError() when createFood != null:
return createFood(_that);case AddLocalDataApiError() when addLocalData != null:
return addLocalData(_that);case UnknownApiError() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CreateFoodError error)?  createFood,TResult Function( AddLocalDataError error)?  addLocalData,TResult Function( Map<String, dynamic> json)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateFoodApiError() when createFood != null:
return createFood(_that.error);case AddLocalDataApiError() when addLocalData != null:
return addLocalData(_that.error);case UnknownApiError() when unknown != null:
return unknown(_that.json);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CreateFoodError error)  createFood,required TResult Function( AddLocalDataError error)  addLocalData,required TResult Function( Map<String, dynamic> json)  unknown,}) {final _that = this;
switch (_that) {
case CreateFoodApiError():
return createFood(_that.error);case AddLocalDataApiError():
return addLocalData(_that.error);case UnknownApiError():
return unknown(_that.json);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CreateFoodError error)?  createFood,TResult? Function( AddLocalDataError error)?  addLocalData,TResult? Function( Map<String, dynamic> json)?  unknown,}) {final _that = this;
switch (_that) {
case CreateFoodApiError() when createFood != null:
return createFood(_that.error);case AddLocalDataApiError() when addLocalData != null:
return addLocalData(_that.error);case UnknownApiError() when unknown != null:
return unknown(_that.json);case _:
  return null;

}
}

}

/// @nodoc


class CreateFoodApiError implements BaseCollectionError {
  const CreateFoodApiError(this.error);
  

 final  CreateFoodError error;

/// Create a copy of BaseCollectionError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateFoodApiErrorCopyWith<CreateFoodApiError> get copyWith => _$CreateFoodApiErrorCopyWithImpl<CreateFoodApiError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateFoodApiError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BaseCollectionError.createFood(error: $error)';
}


}

/// @nodoc
abstract mixin class $CreateFoodApiErrorCopyWith<$Res> implements $BaseCollectionErrorCopyWith<$Res> {
  factory $CreateFoodApiErrorCopyWith(CreateFoodApiError value, $Res Function(CreateFoodApiError) _then) = _$CreateFoodApiErrorCopyWithImpl;
@useResult
$Res call({
 CreateFoodError error
});




}
/// @nodoc
class _$CreateFoodApiErrorCopyWithImpl<$Res>
    implements $CreateFoodApiErrorCopyWith<$Res> {
  _$CreateFoodApiErrorCopyWithImpl(this._self, this._then);

  final CreateFoodApiError _self;
  final $Res Function(CreateFoodApiError) _then;

/// Create a copy of BaseCollectionError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CreateFoodApiError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as CreateFoodError,
  ));
}


}

/// @nodoc


class AddLocalDataApiError implements BaseCollectionError {
  const AddLocalDataApiError(this.error);
  

 final  AddLocalDataError error;

/// Create a copy of BaseCollectionError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddLocalDataApiErrorCopyWith<AddLocalDataApiError> get copyWith => _$AddLocalDataApiErrorCopyWithImpl<AddLocalDataApiError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddLocalDataApiError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BaseCollectionError.addLocalData(error: $error)';
}


}

/// @nodoc
abstract mixin class $AddLocalDataApiErrorCopyWith<$Res> implements $BaseCollectionErrorCopyWith<$Res> {
  factory $AddLocalDataApiErrorCopyWith(AddLocalDataApiError value, $Res Function(AddLocalDataApiError) _then) = _$AddLocalDataApiErrorCopyWithImpl;
@useResult
$Res call({
 AddLocalDataError error
});




}
/// @nodoc
class _$AddLocalDataApiErrorCopyWithImpl<$Res>
    implements $AddLocalDataApiErrorCopyWith<$Res> {
  _$AddLocalDataApiErrorCopyWithImpl(this._self, this._then);

  final AddLocalDataApiError _self;
  final $Res Function(AddLocalDataApiError) _then;

/// Create a copy of BaseCollectionError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AddLocalDataApiError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AddLocalDataError,
  ));
}


}

/// @nodoc


class UnknownApiError implements BaseCollectionError {
  const UnknownApiError(final  Map<String, dynamic> json): _json = json;
  

 final  Map<String, dynamic> _json;
 Map<String, dynamic> get json {
  if (_json is EqualUnmodifiableMapView) return _json;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_json);
}


/// Create a copy of BaseCollectionError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownApiErrorCopyWith<UnknownApiError> get copyWith => _$UnknownApiErrorCopyWithImpl<UnknownApiError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownApiError&&const DeepCollectionEquality().equals(other._json, _json));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_json));

@override
String toString() {
  return 'BaseCollectionError.unknown(json: $json)';
}


}

/// @nodoc
abstract mixin class $UnknownApiErrorCopyWith<$Res> implements $BaseCollectionErrorCopyWith<$Res> {
  factory $UnknownApiErrorCopyWith(UnknownApiError value, $Res Function(UnknownApiError) _then) = _$UnknownApiErrorCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> json
});




}
/// @nodoc
class _$UnknownApiErrorCopyWithImpl<$Res>
    implements $UnknownApiErrorCopyWith<$Res> {
  _$UnknownApiErrorCopyWithImpl(this._self, this._then);

  final UnknownApiError _self;
  final $Res Function(UnknownApiError) _then;

/// Create a copy of BaseCollectionError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? json = null,}) {
  return _then(UnknownApiError(
null == json ? _self._json : json // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on

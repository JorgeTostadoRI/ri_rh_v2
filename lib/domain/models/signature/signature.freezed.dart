// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Signature {

 int get id; DateTime get createdAt; DateTime get updatedAt; int get usuario;
/// Create a copy of Signature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignatureCopyWith<Signature> get copyWith => _$SignatureCopyWithImpl<Signature>(this as Signature, _$identity);

  /// Serializes this Signature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Signature&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usuario, usuario) || other.usuario == usuario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,usuario);

@override
String toString() {
  return 'Signature(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, usuario: $usuario)';
}


}

/// @nodoc
abstract mixin class $SignatureCopyWith<$Res>  {
  factory $SignatureCopyWith(Signature value, $Res Function(Signature) _then) = _$SignatureCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdAt, DateTime updatedAt, int usuario
});




}
/// @nodoc
class _$SignatureCopyWithImpl<$Res>
    implements $SignatureCopyWith<$Res> {
  _$SignatureCopyWithImpl(this._self, this._then);

  final Signature _self;
  final $Res Function(Signature) _then;

/// Create a copy of Signature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? usuario = null,}) {
  return _then(Signature(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Signature].
extension SignaturePatterns on Signature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Signature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Signature() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Signature value)  $default,){
final _that = this;
switch (_that) {
case _Signature():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Signature value)?  $default,){
final _that = this;
switch (_that) {
case _Signature() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  DateTime updatedAt,  int usuario)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Signature() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.usuario);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  DateTime updatedAt,  int usuario)  $default,) {final _that = this;
switch (_that) {
case _Signature():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.usuario);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdAt,  DateTime updatedAt,  int usuario)?  $default,) {final _that = this;
switch (_that) {
case _Signature() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.usuario);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Signature implements Signature {
  const _Signature({required this.id, required this.createdAt, required this.updatedAt, required this.usuario});
  factory _Signature.fromJson(Map<String, dynamic> json) => _$SignatureFromJson(json);

@override final  int id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int usuario;

/// Create a copy of Signature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignatureCopyWith<_Signature> get copyWith => __$SignatureCopyWithImpl<_Signature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignatureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Signature&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usuario, usuario) || other.usuario == usuario));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,usuario);

@override
String toString() {
  return 'Signature(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, usuario: $usuario)';
}


}

/// @nodoc
abstract mixin class _$SignatureCopyWith<$Res> implements $SignatureCopyWith<$Res> {
  factory _$SignatureCopyWith(_Signature value, $Res Function(_Signature) _then) = __$SignatureCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdAt, DateTime updatedAt, int usuario
});




}
/// @nodoc
class __$SignatureCopyWithImpl<$Res>
    implements _$SignatureCopyWith<$Res> {
  __$SignatureCopyWithImpl(this._self, this._then);

  final _Signature _self;
  final $Res Function(_Signature) _then;

/// Create a copy of Signature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? usuario = null,}) {
  return _then(_Signature(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

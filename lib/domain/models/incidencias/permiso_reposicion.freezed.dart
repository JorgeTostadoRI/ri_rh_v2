// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permiso_reposicion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PermisoReposicion {

 int get id; DateTime get start; DateTime get end; IncidenciaState get state;
/// Create a copy of PermisoReposicion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermisoReposicionCopyWith<PermisoReposicion> get copyWith => _$PermisoReposicionCopyWithImpl<PermisoReposicion>(this as PermisoReposicion, _$identity);

  /// Serializes this PermisoReposicion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermisoReposicion&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,state);

@override
String toString() {
  return 'PermisoReposicion(id: $id, start: $start, end: $end, state: $state)';
}


}

/// @nodoc
abstract mixin class $PermisoReposicionCopyWith<$Res>  {
  factory $PermisoReposicionCopyWith(PermisoReposicion value, $Res Function(PermisoReposicion) _then) = _$PermisoReposicionCopyWithImpl;
@useResult
$Res call({
 int id, DateTime start, DateTime end, IncidenciaState state
});




}
/// @nodoc
class _$PermisoReposicionCopyWithImpl<$Res>
    implements $PermisoReposicionCopyWith<$Res> {
  _$PermisoReposicionCopyWithImpl(this._self, this._then);

  final PermisoReposicion _self;
  final $Res Function(PermisoReposicion) _then;

/// Create a copy of PermisoReposicion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? start = null,Object? end = null,Object? state = null,}) {
  return _then(PermisoReposicion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState,
  ));
}

}


/// Adds pattern-matching-related methods to [PermisoReposicion].
extension PermisoReposicionPatterns on PermisoReposicion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermisoReposicion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermisoReposicion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermisoReposicion value)  $default,){
final _that = this;
switch (_that) {
case _PermisoReposicion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermisoReposicion value)?  $default,){
final _that = this;
switch (_that) {
case _PermisoReposicion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime start,  DateTime end,  IncidenciaState state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermisoReposicion() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime start,  DateTime end,  IncidenciaState state)  $default,) {final _that = this;
switch (_that) {
case _PermisoReposicion():
return $default(_that.id,_that.start,_that.end,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime start,  DateTime end,  IncidenciaState state)?  $default,) {final _that = this;
switch (_that) {
case _PermisoReposicion() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PermisoReposicion implements PermisoReposicion {
  const _PermisoReposicion({required this.id, required this.start, required this.end, required this.state});
  factory _PermisoReposicion.fromJson(Map<String, dynamic> json) => _$PermisoReposicionFromJson(json);

@override final  int id;
@override final  DateTime start;
@override final  DateTime end;
@override final  IncidenciaState state;

/// Create a copy of PermisoReposicion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermisoReposicionCopyWith<_PermisoReposicion> get copyWith => __$PermisoReposicionCopyWithImpl<_PermisoReposicion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermisoReposicionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermisoReposicion&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,start,end,state);

@override
String toString() {
  return 'PermisoReposicion(id: $id, start: $start, end: $end, state: $state)';
}


}

/// @nodoc
abstract mixin class _$PermisoReposicionCopyWith<$Res> implements $PermisoReposicionCopyWith<$Res> {
  factory _$PermisoReposicionCopyWith(_PermisoReposicion value, $Res Function(_PermisoReposicion) _then) = __$PermisoReposicionCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime start, DateTime end, IncidenciaState state
});




}
/// @nodoc
class __$PermisoReposicionCopyWithImpl<$Res>
    implements _$PermisoReposicionCopyWith<$Res> {
  __$PermisoReposicionCopyWithImpl(this._self, this._then);

  final _PermisoReposicion _self;
  final $Res Function(_PermisoReposicion) _then;

/// Create a copy of PermisoReposicion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? state = null,}) {
  return _then(_PermisoReposicion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dia_festivo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaFestivo {

 int? get id; DateTime? get createdAt; DateTime? get updatedAt; DateTime get fecha; String get nombre;
/// Create a copy of DiaFestivo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaFestivoCopyWith<DiaFestivo> get copyWith => _$DiaFestivoCopyWithImpl<DiaFestivo>(this as DiaFestivo, _$identity);

  /// Serializes this DiaFestivo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaFestivo&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.nombre, nombre) || other.nombre == nombre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,fecha,nombre);

@override
String toString() {
  return 'DiaFestivo(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, fecha: $fecha, nombre: $nombre)';
}


}

/// @nodoc
abstract mixin class $DiaFestivoCopyWith<$Res>  {
  factory $DiaFestivoCopyWith(DiaFestivo value, $Res Function(DiaFestivo) _then) = _$DiaFestivoCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, DateTime fecha, String nombre
});




}
/// @nodoc
class _$DiaFestivoCopyWithImpl<$Res>
    implements $DiaFestivoCopyWith<$Res> {
  _$DiaFestivoCopyWithImpl(this._self, this._then);

  final DiaFestivo _self;
  final $Res Function(DiaFestivo) _then;

/// Create a copy of DiaFestivo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? fecha = null,Object? nombre = null,}) {
  return _then(DiaFestivo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaFestivo].
extension DiaFestivoPatterns on DiaFestivo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaFestivo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaFestivo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaFestivo value)  $default,){
final _that = this;
switch (_that) {
case _DiaFestivo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaFestivo value)?  $default,){
final _that = this;
switch (_that) {
case _DiaFestivo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime fecha,  String nombre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaFestivo() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fecha,_that.nombre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime fecha,  String nombre)  $default,) {final _that = this;
switch (_that) {
case _DiaFestivo():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fecha,_that.nombre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime fecha,  String nombre)?  $default,) {final _that = this;
switch (_that) {
case _DiaFestivo() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.fecha,_that.nombre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiaFestivo implements DiaFestivo {
  const _DiaFestivo({this.id, this.createdAt, this.updatedAt, required this.fecha, this.nombre = ''});
  factory _DiaFestivo.fromJson(Map<String, dynamic> json) => _$DiaFestivoFromJson(json);

@override final  int? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime fecha;
@override@JsonKey() final  String nombre;

/// Create a copy of DiaFestivo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaFestivoCopyWith<_DiaFestivo> get copyWith => __$DiaFestivoCopyWithImpl<_DiaFestivo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaFestivoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaFestivo&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.nombre, nombre) || other.nombre == nombre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,fecha,nombre);

@override
String toString() {
  return 'DiaFestivo(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, fecha: $fecha, nombre: $nombre)';
}


}

/// @nodoc
abstract mixin class _$DiaFestivoCopyWith<$Res> implements $DiaFestivoCopyWith<$Res> {
  factory _$DiaFestivoCopyWith(_DiaFestivo value, $Res Function(_DiaFestivo) _then) = __$DiaFestivoCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, DateTime fecha, String nombre
});




}
/// @nodoc
class __$DiaFestivoCopyWithImpl<$Res>
    implements _$DiaFestivoCopyWith<$Res> {
  __$DiaFestivoCopyWithImpl(this._self, this._then);

  final _DiaFestivo _self;
  final $Res Function(_DiaFestivo) _then;

/// Create a copy of DiaFestivo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? fecha = null,Object? nombre = null,}) {
  return _then(_DiaFestivo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

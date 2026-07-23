// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'universidad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Universidad implements DiagnosticableTreeMixin {

 int get id; String get nombre; String get direccion; String get numeroContacto;
/// Create a copy of Universidad
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UniversidadCopyWith<Universidad> get copyWith => _$UniversidadCopyWithImpl<Universidad>(this as Universidad, _$identity);

  /// Serializes this Universidad to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Universidad'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('numeroContacto', numeroContacto));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Universidad&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,direccion,numeroContacto);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Universidad(id: $id, nombre: $nombre, direccion: $direccion, numeroContacto: $numeroContacto)';
}


}

/// @nodoc
abstract mixin class $UniversidadCopyWith<$Res>  {
  factory $UniversidadCopyWith(Universidad value, $Res Function(Universidad) _then) = _$UniversidadCopyWithImpl;
@useResult
$Res call({
 int id, String nombre, String direccion, String numeroContacto
});




}
/// @nodoc
class _$UniversidadCopyWithImpl<$Res>
    implements $UniversidadCopyWith<$Res> {
  _$UniversidadCopyWithImpl(this._self, this._then);

  final Universidad _self;
  final $Res Function(Universidad) _then;

/// Create a copy of Universidad
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? direccion = null,Object? numeroContacto = null,}) {
  return _then(Universidad(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Universidad].
extension UniversidadPatterns on Universidad {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Universidad value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Universidad() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Universidad value)  $default,){
final _that = this;
switch (_that) {
case _Universidad():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Universidad value)?  $default,){
final _that = this;
switch (_that) {
case _Universidad() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nombre,  String direccion,  String numeroContacto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Universidad() when $default != null:
return $default(_that.id,_that.nombre,_that.direccion,_that.numeroContacto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nombre,  String direccion,  String numeroContacto)  $default,) {final _that = this;
switch (_that) {
case _Universidad():
return $default(_that.id,_that.nombre,_that.direccion,_that.numeroContacto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nombre,  String direccion,  String numeroContacto)?  $default,) {final _that = this;
switch (_that) {
case _Universidad() when $default != null:
return $default(_that.id,_that.nombre,_that.direccion,_that.numeroContacto);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Universidad with DiagnosticableTreeMixin implements Universidad {
  const _Universidad({this.id = 0, required this.nombre, required this.direccion, required this.numeroContacto});
  factory _Universidad.fromJson(Map<String, dynamic> json) => _$UniversidadFromJson(json);

@override@JsonKey() final  int id;
@override final  String nombre;
@override final  String direccion;
@override final  String numeroContacto;

/// Create a copy of Universidad
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UniversidadCopyWith<_Universidad> get copyWith => __$UniversidadCopyWithImpl<_Universidad>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UniversidadToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Universidad'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('numeroContacto', numeroContacto));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Universidad&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,direccion,numeroContacto);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Universidad(id: $id, nombre: $nombre, direccion: $direccion, numeroContacto: $numeroContacto)';
}


}

/// @nodoc
abstract mixin class _$UniversidadCopyWith<$Res> implements $UniversidadCopyWith<$Res> {
  factory _$UniversidadCopyWith(_Universidad value, $Res Function(_Universidad) _then) = __$UniversidadCopyWithImpl;
@override @useResult
$Res call({
 int id, String nombre, String direccion, String numeroContacto
});




}
/// @nodoc
class __$UniversidadCopyWithImpl<$Res>
    implements _$UniversidadCopyWith<$Res> {
  __$UniversidadCopyWithImpl(this._self, this._then);

  final _Universidad _self;
  final $Res Function(_Universidad) _then;

/// Create a copy of Universidad
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? direccion = null,Object? numeroContacto = null,}) {
  return _then(_Universidad(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

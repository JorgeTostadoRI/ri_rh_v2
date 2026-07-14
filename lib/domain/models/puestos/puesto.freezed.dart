// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puesto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Puesto implements DiagnosticableTreeMixin {

 int? get id; String get nombre;@JsonKey(name: 'tipos') TipoPuesto get tipo;
/// Create a copy of Puesto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PuestoCopyWith<Puesto> get copyWith => _$PuestoCopyWithImpl<Puesto>(this as Puesto, _$identity);

  /// Serializes this Puesto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Puesto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('tipo', tipo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Puesto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.tipo, tipo) || other.tipo == tipo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,tipo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Puesto(id: $id, nombre: $nombre, tipo: $tipo)';
}


}

/// @nodoc
abstract mixin class $PuestoCopyWith<$Res>  {
  factory $PuestoCopyWith(Puesto value, $Res Function(Puesto) _then) = _$PuestoCopyWithImpl;
@useResult
$Res call({
 int? id, String nombre,@JsonKey(name: 'tipos') TipoPuesto tipo
});




}
/// @nodoc
class _$PuestoCopyWithImpl<$Res>
    implements $PuestoCopyWith<$Res> {
  _$PuestoCopyWithImpl(this._self, this._then);

  final Puesto _self;
  final $Res Function(Puesto) _then;

/// Create a copy of Puesto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nombre = null,Object? tipo = null,}) {
  return _then(Puesto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoPuesto,
  ));
}

}


/// Adds pattern-matching-related methods to [Puesto].
extension PuestoPatterns on Puesto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Puesto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Puesto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Puesto value)  $default,){
final _that = this;
switch (_that) {
case _Puesto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Puesto value)?  $default,){
final _that = this;
switch (_that) {
case _Puesto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String nombre, @JsonKey(name: 'tipos')  TipoPuesto tipo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Puesto() when $default != null:
return $default(_that.id,_that.nombre,_that.tipo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String nombre, @JsonKey(name: 'tipos')  TipoPuesto tipo)  $default,) {final _that = this;
switch (_that) {
case _Puesto():
return $default(_that.id,_that.nombre,_that.tipo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String nombre, @JsonKey(name: 'tipos')  TipoPuesto tipo)?  $default,) {final _that = this;
switch (_that) {
case _Puesto() when $default != null:
return $default(_that.id,_that.nombre,_that.tipo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Puesto with DiagnosticableTreeMixin implements Puesto {
  const _Puesto({this.id, required this.nombre, @JsonKey(name: 'tipos') required this.tipo});
  factory _Puesto.fromJson(Map<String, dynamic> json) => _$PuestoFromJson(json);

@override final  int? id;
@override final  String nombre;
@override@JsonKey(name: 'tipos') final  TipoPuesto tipo;

/// Create a copy of Puesto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PuestoCopyWith<_Puesto> get copyWith => __$PuestoCopyWithImpl<_Puesto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PuestoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Puesto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('tipo', tipo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Puesto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.tipo, tipo) || other.tipo == tipo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,tipo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Puesto(id: $id, nombre: $nombre, tipo: $tipo)';
}


}

/// @nodoc
abstract mixin class _$PuestoCopyWith<$Res> implements $PuestoCopyWith<$Res> {
  factory _$PuestoCopyWith(_Puesto value, $Res Function(_Puesto) _then) = __$PuestoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String nombre,@JsonKey(name: 'tipos') TipoPuesto tipo
});




}
/// @nodoc
class __$PuestoCopyWithImpl<$Res>
    implements _$PuestoCopyWith<$Res> {
  __$PuestoCopyWithImpl(this._self, this._then);

  final _Puesto _self;
  final $Res Function(_Puesto) _then;

/// Create a copy of Puesto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nombre = null,Object? tipo = null,}) {
  return _then(_Puesto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoPuesto,
  ));
}


}

// dart format on

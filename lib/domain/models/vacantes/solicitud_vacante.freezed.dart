// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitud_vacante.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SolicitudVacante {

 int? get id; int get puesto;@JsonKey(name: 'puesto_nombre') String? get puestoNombre; String get rol; int get cantidad; int? get solicitante;@JsonKey(name: 'solicitante_nombre') String? get solicitanteNombre; EstatusVacante get estatus;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of SolicitudVacante
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SolicitudVacanteCopyWith<SolicitudVacante> get copyWith => _$SolicitudVacanteCopyWithImpl<SolicitudVacante>(this as SolicitudVacante, _$identity);

  /// Serializes this SolicitudVacante to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SolicitudVacante&&(identical(other.id, id) || other.id == id)&&(identical(other.puesto, puesto) || other.puesto == puesto)&&(identical(other.puestoNombre, puestoNombre) || other.puestoNombre == puestoNombre)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.solicitante, solicitante) || other.solicitante == solicitante)&&(identical(other.solicitanteNombre, solicitanteNombre) || other.solicitanteNombre == solicitanteNombre)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,puesto,puestoNombre,rol,cantidad,solicitante,solicitanteNombre,estatus,createdAt);

@override
String toString() {
  return 'SolicitudVacante(id: $id, puesto: $puesto, puestoNombre: $puestoNombre, rol: $rol, cantidad: $cantidad, solicitante: $solicitante, solicitanteNombre: $solicitanteNombre, estatus: $estatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SolicitudVacanteCopyWith<$Res>  {
  factory $SolicitudVacanteCopyWith(SolicitudVacante value, $Res Function(SolicitudVacante) _then) = _$SolicitudVacanteCopyWithImpl;
@useResult
$Res call({
 int? id, int puesto,@JsonKey(name: 'puesto_nombre') String? puestoNombre, String rol, int cantidad, int? solicitante,@JsonKey(name: 'solicitante_nombre') String? solicitanteNombre, EstatusVacante estatus,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$SolicitudVacanteCopyWithImpl<$Res>
    implements $SolicitudVacanteCopyWith<$Res> {
  _$SolicitudVacanteCopyWithImpl(this._self, this._then);

  final SolicitudVacante _self;
  final $Res Function(SolicitudVacante) _then;

/// Create a copy of SolicitudVacante
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? puesto = null,Object? puestoNombre = freezed,Object? rol = null,Object? cantidad = null,Object? solicitante = freezed,Object? solicitanteNombre = freezed,Object? estatus = null,Object? createdAt = freezed,}) {
  return _then(SolicitudVacante(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,puesto: null == puesto ? _self.puesto : puesto // ignore: cast_nullable_to_non_nullable
as int,puestoNombre: freezed == puestoNombre ? _self.puestoNombre : puestoNombre // ignore: cast_nullable_to_non_nullable
as String?,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,solicitante: freezed == solicitante ? _self.solicitante : solicitante // ignore: cast_nullable_to_non_nullable
as int?,solicitanteNombre: freezed == solicitanteNombre ? _self.solicitanteNombre : solicitanteNombre // ignore: cast_nullable_to_non_nullable
as String?,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EstatusVacante,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SolicitudVacante].
extension SolicitudVacantePatterns on SolicitudVacante {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SolicitudVacante value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SolicitudVacante() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SolicitudVacante value)  $default,){
final _that = this;
switch (_that) {
case _SolicitudVacante():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SolicitudVacante value)?  $default,){
final _that = this;
switch (_that) {
case _SolicitudVacante() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int puesto, @JsonKey(name: 'puesto_nombre')  String? puestoNombre,  String rol,  int cantidad,  int? solicitante, @JsonKey(name: 'solicitante_nombre')  String? solicitanteNombre,  EstatusVacante estatus, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SolicitudVacante() when $default != null:
return $default(_that.id,_that.puesto,_that.puestoNombre,_that.rol,_that.cantidad,_that.solicitante,_that.solicitanteNombre,_that.estatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int puesto, @JsonKey(name: 'puesto_nombre')  String? puestoNombre,  String rol,  int cantidad,  int? solicitante, @JsonKey(name: 'solicitante_nombre')  String? solicitanteNombre,  EstatusVacante estatus, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SolicitudVacante():
return $default(_that.id,_that.puesto,_that.puestoNombre,_that.rol,_that.cantidad,_that.solicitante,_that.solicitanteNombre,_that.estatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int puesto, @JsonKey(name: 'puesto_nombre')  String? puestoNombre,  String rol,  int cantidad,  int? solicitante, @JsonKey(name: 'solicitante_nombre')  String? solicitanteNombre,  EstatusVacante estatus, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SolicitudVacante() when $default != null:
return $default(_that.id,_that.puesto,_that.puestoNombre,_that.rol,_that.cantidad,_that.solicitante,_that.solicitanteNombre,_that.estatus,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SolicitudVacante implements SolicitudVacante {
  const _SolicitudVacante({this.id, required this.puesto, @JsonKey(name: 'puesto_nombre') this.puestoNombre, required this.rol, required this.cantidad, this.solicitante, @JsonKey(name: 'solicitante_nombre') this.solicitanteNombre, this.estatus = EstatusVacante.pendiente, @JsonKey(name: 'created_at') this.createdAt});
  factory _SolicitudVacante.fromJson(Map<String, dynamic> json) => _$SolicitudVacanteFromJson(json);

@override final  int? id;
@override final  int puesto;
@override@JsonKey(name: 'puesto_nombre') final  String? puestoNombre;
@override final  String rol;
@override final  int cantidad;
@override final  int? solicitante;
@override@JsonKey(name: 'solicitante_nombre') final  String? solicitanteNombre;
@override@JsonKey() final  EstatusVacante estatus;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of SolicitudVacante
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SolicitudVacanteCopyWith<_SolicitudVacante> get copyWith => __$SolicitudVacanteCopyWithImpl<_SolicitudVacante>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SolicitudVacanteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SolicitudVacante&&(identical(other.id, id) || other.id == id)&&(identical(other.puesto, puesto) || other.puesto == puesto)&&(identical(other.puestoNombre, puestoNombre) || other.puestoNombre == puestoNombre)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.solicitante, solicitante) || other.solicitante == solicitante)&&(identical(other.solicitanteNombre, solicitanteNombre) || other.solicitanteNombre == solicitanteNombre)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,puesto,puestoNombre,rol,cantidad,solicitante,solicitanteNombre,estatus,createdAt);

@override
String toString() {
  return 'SolicitudVacante(id: $id, puesto: $puesto, puestoNombre: $puestoNombre, rol: $rol, cantidad: $cantidad, solicitante: $solicitante, solicitanteNombre: $solicitanteNombre, estatus: $estatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SolicitudVacanteCopyWith<$Res> implements $SolicitudVacanteCopyWith<$Res> {
  factory _$SolicitudVacanteCopyWith(_SolicitudVacante value, $Res Function(_SolicitudVacante) _then) = __$SolicitudVacanteCopyWithImpl;
@override @useResult
$Res call({
 int? id, int puesto,@JsonKey(name: 'puesto_nombre') String? puestoNombre, String rol, int cantidad, int? solicitante,@JsonKey(name: 'solicitante_nombre') String? solicitanteNombre, EstatusVacante estatus,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$SolicitudVacanteCopyWithImpl<$Res>
    implements _$SolicitudVacanteCopyWith<$Res> {
  __$SolicitudVacanteCopyWithImpl(this._self, this._then);

  final _SolicitudVacante _self;
  final $Res Function(_SolicitudVacante) _then;

/// Create a copy of SolicitudVacante
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? puesto = null,Object? puestoNombre = freezed,Object? rol = null,Object? cantidad = null,Object? solicitante = freezed,Object? solicitanteNombre = freezed,Object? estatus = null,Object? createdAt = freezed,}) {
  return _then(_SolicitudVacante(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,puesto: null == puesto ? _self.puesto : puesto // ignore: cast_nullable_to_non_nullable
as int,puestoNombre: freezed == puestoNombre ? _self.puestoNombre : puestoNombre // ignore: cast_nullable_to_non_nullable
as String?,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,solicitante: freezed == solicitante ? _self.solicitante : solicitante // ignore: cast_nullable_to_non_nullable
as int?,solicitanteNombre: freezed == solicitanteNombre ? _self.solicitanteNombre : solicitanteNombre // ignore: cast_nullable_to_non_nullable
as String?,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EstatusVacante,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

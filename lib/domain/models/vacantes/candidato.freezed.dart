// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidato.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Candidato {

 int? get id; String get nombre; String get correo; CandidatoEstado get estado;@JsonKey(name: 'fecha_expiracion') DateTime? get fechaExpiracion;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'contrato_solicitado_en') DateTime? get contratoSolicitadoEn;
/// Create a copy of Candidato
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatoCopyWith<Candidato> get copyWith => _$CandidatoCopyWithImpl<Candidato>(this as Candidato, _$identity);

  /// Serializes this Candidato to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Candidato&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.fechaExpiracion, fechaExpiracion) || other.fechaExpiracion == fechaExpiracion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.contratoSolicitadoEn, contratoSolicitadoEn) || other.contratoSolicitadoEn == contratoSolicitadoEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,correo,estado,fechaExpiracion,createdAt,contratoSolicitadoEn);

@override
String toString() {
  return 'Candidato(id: $id, nombre: $nombre, correo: $correo, estado: $estado, fechaExpiracion: $fechaExpiracion, createdAt: $createdAt, contratoSolicitadoEn: $contratoSolicitadoEn)';
}


}

/// @nodoc
abstract mixin class $CandidatoCopyWith<$Res>  {
  factory $CandidatoCopyWith(Candidato value, $Res Function(Candidato) _then) = _$CandidatoCopyWithImpl;
@useResult
$Res call({
 int? id, String nombre, String correo, CandidatoEstado estado,@JsonKey(name: 'fecha_expiracion') DateTime? fechaExpiracion,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'contrato_solicitado_en') DateTime? contratoSolicitadoEn
});




}
/// @nodoc
class _$CandidatoCopyWithImpl<$Res>
    implements $CandidatoCopyWith<$Res> {
  _$CandidatoCopyWithImpl(this._self, this._then);

  final Candidato _self;
  final $Res Function(Candidato) _then;

/// Create a copy of Candidato
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nombre = null,Object? correo = null,Object? estado = null,Object? fechaExpiracion = freezed,Object? createdAt = freezed,Object? contratoSolicitadoEn = freezed,}) {
  return _then(Candidato(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as CandidatoEstado,fechaExpiracion: freezed == fechaExpiracion ? _self.fechaExpiracion : fechaExpiracion // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contratoSolicitadoEn: freezed == contratoSolicitadoEn ? _self.contratoSolicitadoEn : contratoSolicitadoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Candidato].
extension CandidatoPatterns on Candidato {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Candidato value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Candidato() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Candidato value)  $default,){
final _that = this;
switch (_that) {
case _Candidato():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Candidato value)?  $default,){
final _that = this;
switch (_that) {
case _Candidato() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String nombre,  String correo,  CandidatoEstado estado, @JsonKey(name: 'fecha_expiracion')  DateTime? fechaExpiracion, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'contrato_solicitado_en')  DateTime? contratoSolicitadoEn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Candidato() when $default != null:
return $default(_that.id,_that.nombre,_that.correo,_that.estado,_that.fechaExpiracion,_that.createdAt,_that.contratoSolicitadoEn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String nombre,  String correo,  CandidatoEstado estado, @JsonKey(name: 'fecha_expiracion')  DateTime? fechaExpiracion, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'contrato_solicitado_en')  DateTime? contratoSolicitadoEn)  $default,) {final _that = this;
switch (_that) {
case _Candidato():
return $default(_that.id,_that.nombre,_that.correo,_that.estado,_that.fechaExpiracion,_that.createdAt,_that.contratoSolicitadoEn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String nombre,  String correo,  CandidatoEstado estado, @JsonKey(name: 'fecha_expiracion')  DateTime? fechaExpiracion, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'contrato_solicitado_en')  DateTime? contratoSolicitadoEn)?  $default,) {final _that = this;
switch (_that) {
case _Candidato() when $default != null:
return $default(_that.id,_that.nombre,_that.correo,_that.estado,_that.fechaExpiracion,_that.createdAt,_that.contratoSolicitadoEn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Candidato implements Candidato {
  const _Candidato({this.id, required this.nombre, required this.correo, this.estado = CandidatoEstado.iniciado, @JsonKey(name: 'fecha_expiracion') this.fechaExpiracion, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'contrato_solicitado_en') this.contratoSolicitadoEn});
  factory _Candidato.fromJson(Map<String, dynamic> json) => _$CandidatoFromJson(json);

@override final  int? id;
@override final  String nombre;
@override final  String correo;
@override@JsonKey() final  CandidatoEstado estado;
@override@JsonKey(name: 'fecha_expiracion') final  DateTime? fechaExpiracion;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'contrato_solicitado_en') final  DateTime? contratoSolicitadoEn;

/// Create a copy of Candidato
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatoCopyWith<_Candidato> get copyWith => __$CandidatoCopyWithImpl<_Candidato>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidatoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Candidato&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.fechaExpiracion, fechaExpiracion) || other.fechaExpiracion == fechaExpiracion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.contratoSolicitadoEn, contratoSolicitadoEn) || other.contratoSolicitadoEn == contratoSolicitadoEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,correo,estado,fechaExpiracion,createdAt,contratoSolicitadoEn);

@override
String toString() {
  return 'Candidato(id: $id, nombre: $nombre, correo: $correo, estado: $estado, fechaExpiracion: $fechaExpiracion, createdAt: $createdAt, contratoSolicitadoEn: $contratoSolicitadoEn)';
}


}

/// @nodoc
abstract mixin class _$CandidatoCopyWith<$Res> implements $CandidatoCopyWith<$Res> {
  factory _$CandidatoCopyWith(_Candidato value, $Res Function(_Candidato) _then) = __$CandidatoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String nombre, String correo, CandidatoEstado estado,@JsonKey(name: 'fecha_expiracion') DateTime? fechaExpiracion,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'contrato_solicitado_en') DateTime? contratoSolicitadoEn
});




}
/// @nodoc
class __$CandidatoCopyWithImpl<$Res>
    implements _$CandidatoCopyWith<$Res> {
  __$CandidatoCopyWithImpl(this._self, this._then);

  final _Candidato _self;
  final $Res Function(_Candidato) _then;

/// Create a copy of Candidato
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nombre = null,Object? correo = null,Object? estado = null,Object? fechaExpiracion = freezed,Object? createdAt = freezed,Object? contratoSolicitadoEn = freezed,}) {
  return _then(_Candidato(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as CandidatoEstado,fechaExpiracion: freezed == fechaExpiracion ? _self.fechaExpiracion : fechaExpiracion // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contratoSolicitadoEn: freezed == contratoSolicitadoEn ? _self.contratoSolicitadoEn : contratoSolicitadoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidato_detalle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CandidatoBeneficiario {

 int? get id;@JsonKey(name: 'nombre_completo') String get nombreCompleto; String get parentesco; String get direccion; int get porcentaje;
/// Create a copy of CandidatoBeneficiario
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatoBeneficiarioCopyWith<CandidatoBeneficiario> get copyWith => _$CandidatoBeneficiarioCopyWithImpl<CandidatoBeneficiario>(this as CandidatoBeneficiario, _$identity);

  /// Serializes this CandidatoBeneficiario to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatoBeneficiario&&(identical(other.id, id) || other.id == id)&&(identical(other.nombreCompleto, nombreCompleto) || other.nombreCompleto == nombreCompleto)&&(identical(other.parentesco, parentesco) || other.parentesco == parentesco)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.porcentaje, porcentaje) || other.porcentaje == porcentaje));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombreCompleto,parentesco,direccion,porcentaje);

@override
String toString() {
  return 'CandidatoBeneficiario(id: $id, nombreCompleto: $nombreCompleto, parentesco: $parentesco, direccion: $direccion, porcentaje: $porcentaje)';
}


}

/// @nodoc
abstract mixin class $CandidatoBeneficiarioCopyWith<$Res>  {
  factory $CandidatoBeneficiarioCopyWith(CandidatoBeneficiario value, $Res Function(CandidatoBeneficiario) _then) = _$CandidatoBeneficiarioCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'nombre_completo') String nombreCompleto, String parentesco, String direccion, int porcentaje
});




}
/// @nodoc
class _$CandidatoBeneficiarioCopyWithImpl<$Res>
    implements $CandidatoBeneficiarioCopyWith<$Res> {
  _$CandidatoBeneficiarioCopyWithImpl(this._self, this._then);

  final CandidatoBeneficiario _self;
  final $Res Function(CandidatoBeneficiario) _then;

/// Create a copy of CandidatoBeneficiario
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nombreCompleto = null,Object? parentesco = null,Object? direccion = null,Object? porcentaje = null,}) {
  return _then(CandidatoBeneficiario(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombreCompleto: null == nombreCompleto ? _self.nombreCompleto : nombreCompleto // ignore: cast_nullable_to_non_nullable
as String,parentesco: null == parentesco ? _self.parentesco : parentesco // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,porcentaje: null == porcentaje ? _self.porcentaje : porcentaje // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CandidatoBeneficiario].
extension CandidatoBeneficiarioPatterns on CandidatoBeneficiario {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidatoBeneficiario value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidatoBeneficiario() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidatoBeneficiario value)  $default,){
final _that = this;
switch (_that) {
case _CandidatoBeneficiario():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidatoBeneficiario value)?  $default,){
final _that = this;
switch (_that) {
case _CandidatoBeneficiario() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'nombre_completo')  String nombreCompleto,  String parentesco,  String direccion,  int porcentaje)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidatoBeneficiario() when $default != null:
return $default(_that.id,_that.nombreCompleto,_that.parentesco,_that.direccion,_that.porcentaje);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'nombre_completo')  String nombreCompleto,  String parentesco,  String direccion,  int porcentaje)  $default,) {final _that = this;
switch (_that) {
case _CandidatoBeneficiario():
return $default(_that.id,_that.nombreCompleto,_that.parentesco,_that.direccion,_that.porcentaje);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'nombre_completo')  String nombreCompleto,  String parentesco,  String direccion,  int porcentaje)?  $default,) {final _that = this;
switch (_that) {
case _CandidatoBeneficiario() when $default != null:
return $default(_that.id,_that.nombreCompleto,_that.parentesco,_that.direccion,_that.porcentaje);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidatoBeneficiario implements CandidatoBeneficiario {
  const _CandidatoBeneficiario({this.id, @JsonKey(name: 'nombre_completo') required this.nombreCompleto, required this.parentesco, this.direccion = '', this.porcentaje = 0});
  factory _CandidatoBeneficiario.fromJson(Map<String, dynamic> json) => _$CandidatoBeneficiarioFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'nombre_completo') final  String nombreCompleto;
@override final  String parentesco;
@override@JsonKey() final  String direccion;
@override@JsonKey() final  int porcentaje;

/// Create a copy of CandidatoBeneficiario
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatoBeneficiarioCopyWith<_CandidatoBeneficiario> get copyWith => __$CandidatoBeneficiarioCopyWithImpl<_CandidatoBeneficiario>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidatoBeneficiarioToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatoBeneficiario&&(identical(other.id, id) || other.id == id)&&(identical(other.nombreCompleto, nombreCompleto) || other.nombreCompleto == nombreCompleto)&&(identical(other.parentesco, parentesco) || other.parentesco == parentesco)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.porcentaje, porcentaje) || other.porcentaje == porcentaje));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombreCompleto,parentesco,direccion,porcentaje);

@override
String toString() {
  return 'CandidatoBeneficiario(id: $id, nombreCompleto: $nombreCompleto, parentesco: $parentesco, direccion: $direccion, porcentaje: $porcentaje)';
}


}

/// @nodoc
abstract mixin class _$CandidatoBeneficiarioCopyWith<$Res> implements $CandidatoBeneficiarioCopyWith<$Res> {
  factory _$CandidatoBeneficiarioCopyWith(_CandidatoBeneficiario value, $Res Function(_CandidatoBeneficiario) _then) = __$CandidatoBeneficiarioCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'nombre_completo') String nombreCompleto, String parentesco, String direccion, int porcentaje
});




}
/// @nodoc
class __$CandidatoBeneficiarioCopyWithImpl<$Res>
    implements _$CandidatoBeneficiarioCopyWith<$Res> {
  __$CandidatoBeneficiarioCopyWithImpl(this._self, this._then);

  final _CandidatoBeneficiario _self;
  final $Res Function(_CandidatoBeneficiario) _then;

/// Create a copy of CandidatoBeneficiario
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nombreCompleto = null,Object? parentesco = null,Object? direccion = null,Object? porcentaje = null,}) {
  return _then(_CandidatoBeneficiario(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombreCompleto: null == nombreCompleto ? _self.nombreCompleto : nombreCompleto // ignore: cast_nullable_to_non_nullable
as String,parentesco: null == parentesco ? _self.parentesco : parentesco // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,porcentaje: null == porcentaje ? _self.porcentaje : porcentaje // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CandidatoEquipo {

 int? get id; String get descripcion; String get marca; String get modelo;@JsonKey(name: 'numero_serie') String get numeroSerie; String get accesorios;@JsonKey(name: 'condiciones_entrega') String get condicionesEntrega;
/// Create a copy of CandidatoEquipo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatoEquipoCopyWith<CandidatoEquipo> get copyWith => _$CandidatoEquipoCopyWithImpl<CandidatoEquipo>(this as CandidatoEquipo, _$identity);

  /// Serializes this CandidatoEquipo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatoEquipo&&(identical(other.id, id) || other.id == id)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.marca, marca) || other.marca == marca)&&(identical(other.modelo, modelo) || other.modelo == modelo)&&(identical(other.numeroSerie, numeroSerie) || other.numeroSerie == numeroSerie)&&(identical(other.accesorios, accesorios) || other.accesorios == accesorios)&&(identical(other.condicionesEntrega, condicionesEntrega) || other.condicionesEntrega == condicionesEntrega));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,descripcion,marca,modelo,numeroSerie,accesorios,condicionesEntrega);

@override
String toString() {
  return 'CandidatoEquipo(id: $id, descripcion: $descripcion, marca: $marca, modelo: $modelo, numeroSerie: $numeroSerie, accesorios: $accesorios, condicionesEntrega: $condicionesEntrega)';
}


}

/// @nodoc
abstract mixin class $CandidatoEquipoCopyWith<$Res>  {
  factory $CandidatoEquipoCopyWith(CandidatoEquipo value, $Res Function(CandidatoEquipo) _then) = _$CandidatoEquipoCopyWithImpl;
@useResult
$Res call({
 int? id, String descripcion, String marca, String modelo,@JsonKey(name: 'numero_serie') String numeroSerie, String accesorios,@JsonKey(name: 'condiciones_entrega') String condicionesEntrega
});




}
/// @nodoc
class _$CandidatoEquipoCopyWithImpl<$Res>
    implements $CandidatoEquipoCopyWith<$Res> {
  _$CandidatoEquipoCopyWithImpl(this._self, this._then);

  final CandidatoEquipo _self;
  final $Res Function(CandidatoEquipo) _then;

/// Create a copy of CandidatoEquipo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? descripcion = null,Object? marca = null,Object? modelo = null,Object? numeroSerie = null,Object? accesorios = null,Object? condicionesEntrega = null,}) {
  return _then(CandidatoEquipo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,marca: null == marca ? _self.marca : marca // ignore: cast_nullable_to_non_nullable
as String,modelo: null == modelo ? _self.modelo : modelo // ignore: cast_nullable_to_non_nullable
as String,numeroSerie: null == numeroSerie ? _self.numeroSerie : numeroSerie // ignore: cast_nullable_to_non_nullable
as String,accesorios: null == accesorios ? _self.accesorios : accesorios // ignore: cast_nullable_to_non_nullable
as String,condicionesEntrega: null == condicionesEntrega ? _self.condicionesEntrega : condicionesEntrega // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CandidatoEquipo].
extension CandidatoEquipoPatterns on CandidatoEquipo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidatoEquipo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidatoEquipo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidatoEquipo value)  $default,){
final _that = this;
switch (_that) {
case _CandidatoEquipo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidatoEquipo value)?  $default,){
final _that = this;
switch (_that) {
case _CandidatoEquipo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String descripcion,  String marca,  String modelo, @JsonKey(name: 'numero_serie')  String numeroSerie,  String accesorios, @JsonKey(name: 'condiciones_entrega')  String condicionesEntrega)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidatoEquipo() when $default != null:
return $default(_that.id,_that.descripcion,_that.marca,_that.modelo,_that.numeroSerie,_that.accesorios,_that.condicionesEntrega);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String descripcion,  String marca,  String modelo, @JsonKey(name: 'numero_serie')  String numeroSerie,  String accesorios, @JsonKey(name: 'condiciones_entrega')  String condicionesEntrega)  $default,) {final _that = this;
switch (_that) {
case _CandidatoEquipo():
return $default(_that.id,_that.descripcion,_that.marca,_that.modelo,_that.numeroSerie,_that.accesorios,_that.condicionesEntrega);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String descripcion,  String marca,  String modelo, @JsonKey(name: 'numero_serie')  String numeroSerie,  String accesorios, @JsonKey(name: 'condiciones_entrega')  String condicionesEntrega)?  $default,) {final _that = this;
switch (_that) {
case _CandidatoEquipo() when $default != null:
return $default(_that.id,_that.descripcion,_that.marca,_that.modelo,_that.numeroSerie,_that.accesorios,_that.condicionesEntrega);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidatoEquipo implements CandidatoEquipo {
  const _CandidatoEquipo({this.id, required this.descripcion, this.marca = '', this.modelo = '', @JsonKey(name: 'numero_serie') this.numeroSerie = '', this.accesorios = '', @JsonKey(name: 'condiciones_entrega') this.condicionesEntrega = ''});
  factory _CandidatoEquipo.fromJson(Map<String, dynamic> json) => _$CandidatoEquipoFromJson(json);

@override final  int? id;
@override final  String descripcion;
@override@JsonKey() final  String marca;
@override@JsonKey() final  String modelo;
@override@JsonKey(name: 'numero_serie') final  String numeroSerie;
@override@JsonKey() final  String accesorios;
@override@JsonKey(name: 'condiciones_entrega') final  String condicionesEntrega;

/// Create a copy of CandidatoEquipo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatoEquipoCopyWith<_CandidatoEquipo> get copyWith => __$CandidatoEquipoCopyWithImpl<_CandidatoEquipo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidatoEquipoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatoEquipo&&(identical(other.id, id) || other.id == id)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.marca, marca) || other.marca == marca)&&(identical(other.modelo, modelo) || other.modelo == modelo)&&(identical(other.numeroSerie, numeroSerie) || other.numeroSerie == numeroSerie)&&(identical(other.accesorios, accesorios) || other.accesorios == accesorios)&&(identical(other.condicionesEntrega, condicionesEntrega) || other.condicionesEntrega == condicionesEntrega));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,descripcion,marca,modelo,numeroSerie,accesorios,condicionesEntrega);

@override
String toString() {
  return 'CandidatoEquipo(id: $id, descripcion: $descripcion, marca: $marca, modelo: $modelo, numeroSerie: $numeroSerie, accesorios: $accesorios, condicionesEntrega: $condicionesEntrega)';
}


}

/// @nodoc
abstract mixin class _$CandidatoEquipoCopyWith<$Res> implements $CandidatoEquipoCopyWith<$Res> {
  factory _$CandidatoEquipoCopyWith(_CandidatoEquipo value, $Res Function(_CandidatoEquipo) _then) = __$CandidatoEquipoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String descripcion, String marca, String modelo,@JsonKey(name: 'numero_serie') String numeroSerie, String accesorios,@JsonKey(name: 'condiciones_entrega') String condicionesEntrega
});




}
/// @nodoc
class __$CandidatoEquipoCopyWithImpl<$Res>
    implements _$CandidatoEquipoCopyWith<$Res> {
  __$CandidatoEquipoCopyWithImpl(this._self, this._then);

  final _CandidatoEquipo _self;
  final $Res Function(_CandidatoEquipo) _then;

/// Create a copy of CandidatoEquipo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? descripcion = null,Object? marca = null,Object? modelo = null,Object? numeroSerie = null,Object? accesorios = null,Object? condicionesEntrega = null,}) {
  return _then(_CandidatoEquipo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,marca: null == marca ? _self.marca : marca // ignore: cast_nullable_to_non_nullable
as String,modelo: null == modelo ? _self.modelo : modelo // ignore: cast_nullable_to_non_nullable
as String,numeroSerie: null == numeroSerie ? _self.numeroSerie : numeroSerie // ignore: cast_nullable_to_non_nullable
as String,accesorios: null == accesorios ? _self.accesorios : accesorios // ignore: cast_nullable_to_non_nullable
as String,condicionesEntrega: null == condicionesEntrega ? _self.condicionesEntrega : condicionesEntrega // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TurnoSugerido {

@JsonKey(name: 'hora_entrada') String? get horaEntrada;@JsonKey(name: 'hora_comida_inicio') String? get horaComidaInicio;@JsonKey(name: 'hora_comida_fin') String? get horaComidaFin;@JsonKey(name: 'hora_salida') String? get horaSalida;@JsonKey(name: 'dias_laborados') String get diasLaborados;@JsonKey(name: 'dia_descanso') String get diaDescanso;
/// Create a copy of TurnoSugerido
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TurnoSugeridoCopyWith<TurnoSugerido> get copyWith => _$TurnoSugeridoCopyWithImpl<TurnoSugerido>(this as TurnoSugerido, _$identity);

  /// Serializes this TurnoSugerido to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TurnoSugerido&&(identical(other.horaEntrada, horaEntrada) || other.horaEntrada == horaEntrada)&&(identical(other.horaComidaInicio, horaComidaInicio) || other.horaComidaInicio == horaComidaInicio)&&(identical(other.horaComidaFin, horaComidaFin) || other.horaComidaFin == horaComidaFin)&&(identical(other.horaSalida, horaSalida) || other.horaSalida == horaSalida)&&(identical(other.diasLaborados, diasLaborados) || other.diasLaborados == diasLaborados)&&(identical(other.diaDescanso, diaDescanso) || other.diaDescanso == diaDescanso));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,horaEntrada,horaComidaInicio,horaComidaFin,horaSalida,diasLaborados,diaDescanso);

@override
String toString() {
  return 'TurnoSugerido(horaEntrada: $horaEntrada, horaComidaInicio: $horaComidaInicio, horaComidaFin: $horaComidaFin, horaSalida: $horaSalida, diasLaborados: $diasLaborados, diaDescanso: $diaDescanso)';
}


}

/// @nodoc
abstract mixin class $TurnoSugeridoCopyWith<$Res>  {
  factory $TurnoSugeridoCopyWith(TurnoSugerido value, $Res Function(TurnoSugerido) _then) = _$TurnoSugeridoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hora_entrada') String? horaEntrada,@JsonKey(name: 'hora_comida_inicio') String? horaComidaInicio,@JsonKey(name: 'hora_comida_fin') String? horaComidaFin,@JsonKey(name: 'hora_salida') String? horaSalida,@JsonKey(name: 'dias_laborados') String diasLaborados,@JsonKey(name: 'dia_descanso') String diaDescanso
});




}
/// @nodoc
class _$TurnoSugeridoCopyWithImpl<$Res>
    implements $TurnoSugeridoCopyWith<$Res> {
  _$TurnoSugeridoCopyWithImpl(this._self, this._then);

  final TurnoSugerido _self;
  final $Res Function(TurnoSugerido) _then;

/// Create a copy of TurnoSugerido
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? horaEntrada = freezed,Object? horaComidaInicio = freezed,Object? horaComidaFin = freezed,Object? horaSalida = freezed,Object? diasLaborados = null,Object? diaDescanso = null,}) {
  return _then(TurnoSugerido(
horaEntrada: freezed == horaEntrada ? _self.horaEntrada : horaEntrada // ignore: cast_nullable_to_non_nullable
as String?,horaComidaInicio: freezed == horaComidaInicio ? _self.horaComidaInicio : horaComidaInicio // ignore: cast_nullable_to_non_nullable
as String?,horaComidaFin: freezed == horaComidaFin ? _self.horaComidaFin : horaComidaFin // ignore: cast_nullable_to_non_nullable
as String?,horaSalida: freezed == horaSalida ? _self.horaSalida : horaSalida // ignore: cast_nullable_to_non_nullable
as String?,diasLaborados: null == diasLaborados ? _self.diasLaborados : diasLaborados // ignore: cast_nullable_to_non_nullable
as String,diaDescanso: null == diaDescanso ? _self.diaDescanso : diaDescanso // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TurnoSugerido].
extension TurnoSugeridoPatterns on TurnoSugerido {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TurnoSugerido value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TurnoSugerido() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TurnoSugerido value)  $default,){
final _that = this;
switch (_that) {
case _TurnoSugerido():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TurnoSugerido value)?  $default,){
final _that = this;
switch (_that) {
case _TurnoSugerido() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hora_entrada')  String? horaEntrada, @JsonKey(name: 'hora_comida_inicio')  String? horaComidaInicio, @JsonKey(name: 'hora_comida_fin')  String? horaComidaFin, @JsonKey(name: 'hora_salida')  String? horaSalida, @JsonKey(name: 'dias_laborados')  String diasLaborados, @JsonKey(name: 'dia_descanso')  String diaDescanso)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TurnoSugerido() when $default != null:
return $default(_that.horaEntrada,_that.horaComidaInicio,_that.horaComidaFin,_that.horaSalida,_that.diasLaborados,_that.diaDescanso);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hora_entrada')  String? horaEntrada, @JsonKey(name: 'hora_comida_inicio')  String? horaComidaInicio, @JsonKey(name: 'hora_comida_fin')  String? horaComidaFin, @JsonKey(name: 'hora_salida')  String? horaSalida, @JsonKey(name: 'dias_laborados')  String diasLaborados, @JsonKey(name: 'dia_descanso')  String diaDescanso)  $default,) {final _that = this;
switch (_that) {
case _TurnoSugerido():
return $default(_that.horaEntrada,_that.horaComidaInicio,_that.horaComidaFin,_that.horaSalida,_that.diasLaborados,_that.diaDescanso);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hora_entrada')  String? horaEntrada, @JsonKey(name: 'hora_comida_inicio')  String? horaComidaInicio, @JsonKey(name: 'hora_comida_fin')  String? horaComidaFin, @JsonKey(name: 'hora_salida')  String? horaSalida, @JsonKey(name: 'dias_laborados')  String diasLaborados, @JsonKey(name: 'dia_descanso')  String diaDescanso)?  $default,) {final _that = this;
switch (_that) {
case _TurnoSugerido() when $default != null:
return $default(_that.horaEntrada,_that.horaComidaInicio,_that.horaComidaFin,_that.horaSalida,_that.diasLaborados,_that.diaDescanso);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TurnoSugerido implements TurnoSugerido {
  const _TurnoSugerido({@JsonKey(name: 'hora_entrada') this.horaEntrada, @JsonKey(name: 'hora_comida_inicio') this.horaComidaInicio, @JsonKey(name: 'hora_comida_fin') this.horaComidaFin, @JsonKey(name: 'hora_salida') this.horaSalida, @JsonKey(name: 'dias_laborados') this.diasLaborados = '', @JsonKey(name: 'dia_descanso') this.diaDescanso = ''});
  factory _TurnoSugerido.fromJson(Map<String, dynamic> json) => _$TurnoSugeridoFromJson(json);

@override@JsonKey(name: 'hora_entrada') final  String? horaEntrada;
@override@JsonKey(name: 'hora_comida_inicio') final  String? horaComidaInicio;
@override@JsonKey(name: 'hora_comida_fin') final  String? horaComidaFin;
@override@JsonKey(name: 'hora_salida') final  String? horaSalida;
@override@JsonKey(name: 'dias_laborados') final  String diasLaborados;
@override@JsonKey(name: 'dia_descanso') final  String diaDescanso;

/// Create a copy of TurnoSugerido
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TurnoSugeridoCopyWith<_TurnoSugerido> get copyWith => __$TurnoSugeridoCopyWithImpl<_TurnoSugerido>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TurnoSugeridoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnoSugerido&&(identical(other.horaEntrada, horaEntrada) || other.horaEntrada == horaEntrada)&&(identical(other.horaComidaInicio, horaComidaInicio) || other.horaComidaInicio == horaComidaInicio)&&(identical(other.horaComidaFin, horaComidaFin) || other.horaComidaFin == horaComidaFin)&&(identical(other.horaSalida, horaSalida) || other.horaSalida == horaSalida)&&(identical(other.diasLaborados, diasLaborados) || other.diasLaborados == diasLaborados)&&(identical(other.diaDescanso, diaDescanso) || other.diaDescanso == diaDescanso));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,horaEntrada,horaComidaInicio,horaComidaFin,horaSalida,diasLaborados,diaDescanso);

@override
String toString() {
  return 'TurnoSugerido(horaEntrada: $horaEntrada, horaComidaInicio: $horaComidaInicio, horaComidaFin: $horaComidaFin, horaSalida: $horaSalida, diasLaborados: $diasLaborados, diaDescanso: $diaDescanso)';
}


}

/// @nodoc
abstract mixin class _$TurnoSugeridoCopyWith<$Res> implements $TurnoSugeridoCopyWith<$Res> {
  factory _$TurnoSugeridoCopyWith(_TurnoSugerido value, $Res Function(_TurnoSugerido) _then) = __$TurnoSugeridoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hora_entrada') String? horaEntrada,@JsonKey(name: 'hora_comida_inicio') String? horaComidaInicio,@JsonKey(name: 'hora_comida_fin') String? horaComidaFin,@JsonKey(name: 'hora_salida') String? horaSalida,@JsonKey(name: 'dias_laborados') String diasLaborados,@JsonKey(name: 'dia_descanso') String diaDescanso
});




}
/// @nodoc
class __$TurnoSugeridoCopyWithImpl<$Res>
    implements _$TurnoSugeridoCopyWith<$Res> {
  __$TurnoSugeridoCopyWithImpl(this._self, this._then);

  final _TurnoSugerido _self;
  final $Res Function(_TurnoSugerido) _then;

/// Create a copy of TurnoSugerido
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? horaEntrada = freezed,Object? horaComidaInicio = freezed,Object? horaComidaFin = freezed,Object? horaSalida = freezed,Object? diasLaborados = null,Object? diaDescanso = null,}) {
  return _then(_TurnoSugerido(
horaEntrada: freezed == horaEntrada ? _self.horaEntrada : horaEntrada // ignore: cast_nullable_to_non_nullable
as String?,horaComidaInicio: freezed == horaComidaInicio ? _self.horaComidaInicio : horaComidaInicio // ignore: cast_nullable_to_non_nullable
as String?,horaComidaFin: freezed == horaComidaFin ? _self.horaComidaFin : horaComidaFin // ignore: cast_nullable_to_non_nullable
as String?,horaSalida: freezed == horaSalida ? _self.horaSalida : horaSalida // ignore: cast_nullable_to_non_nullable
as String?,diasLaborados: null == diasLaborados ? _self.diasLaborados : diasLaborados // ignore: cast_nullable_to_non_nullable
as String,diaDescanso: null == diaDescanso ? _self.diaDescanso : diaDescanso // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CandidatoDetalle {

 int get id; String get nombre; String get correo; CandidatoEstado get estado;@JsonKey(name: 'fecha_expiracion') DateTime? get fechaExpiracion;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'puesto_nombre') String? get puestoNombre;@JsonKey(name: 'puesto_responsabilidades') String get puestoResponsabilidades; Map<String, String?> get documentos;@JsonKey(name: 'verificado_por_ia') bool get verificadoPorIa;@JsonKey(name: 'motivo_rechazo_rh') String get motivoRechazoRh;@JsonKey(name: 'turno_sugerido') TurnoSugerido? get turnoSugerido;@JsonKey(name: 'apellido_paterno') String get apellidoPaterno;@JsonKey(name: 'apellido_materno') String get apellidoMaterno; String get nombres;@JsonKey(name: 'fecha_nacimiento') DateTime? get fechaNacimiento; String get curp; String get rfc;@JsonKey(name: 'numero_seguro_social') String get numeroSeguroSocial;@JsonKey(name: 'clabe_interbancaria') String get clabeInterbancaria; String get escolaridad; String get telefono;@JsonKey(name: 'contacto_emergencia_nombre') String get contactoEmergenciaNombre;@JsonKey(name: 'contacto_emergencia_telefono') String get contactoEmergenciaTelefono;@JsonKey(name: 'direccion_calle') String get direccionCalle;@JsonKey(name: 'direccion_numero') String get direccionNumero;@JsonKey(name: 'direccion_fraccionamiento') String get direccionFraccionamiento;@JsonKey(name: 'direccion_codigo_postal') String get direccionCodigoPostal;@JsonKey(name: 'direccion_municipio') String get direccionMunicipio;@JsonKey(name: 'direccion_estado') String get direccionEstado;@JsonKey(name: 'direccion_pais') String get direccionPais; String get nacionalidad; String get sexo;@JsonKey(name: 'estado_civil') String get estadoCivil; List<CandidatoBeneficiario> get beneficiarios;@JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson) double? get salarioDiario;@JsonKey(name: 'fecha_ingreso') DateTime? get fechaIngreso;@JsonKey(name: 'tipo_contrato') String get tipoContrato;/// Solo para tipoContrato "determinado": cuántos días dura el contrato.
@JsonKey(name: 'duracion_dias') int? get duracionDias;@JsonKey(name: 'tipo_jornada') String get tipoJornada;@JsonKey(name: 'rotacion_detalle') String get rotacionDetalle;@JsonKey(name: 'dias_laborados') String get diasLaborados;@JsonKey(name: 'dia_descanso') String get diaDescanso;@JsonKey(name: 'hora_entrada') String? get horaEntrada;@JsonKey(name: 'hora_comida_inicio') String? get horaComidaInicio;@JsonKey(name: 'hora_comida_fin') String? get horaComidaFin;@JsonKey(name: 'hora_salida') String? get horaSalida;@JsonKey(name: 'forma_pago') String get formaPago;@JsonKey(name: 'modalidad_pago') String get modalidadPago;@JsonKey(name: 'bono_asistencia') String get bonoAsistencia;@JsonKey(name: 'bono_puntualidad') String get bonoPuntualidad;@JsonKey(name: 'vales_despensa_monedero') bool? get valesDespensaMonedero;@JsonKey(name: 'percibe_comisiones') bool? get percibeComisiones;@JsonKey(name: 'comisiones_detalle') String get comisionesDetalle; String get herramientas;@JsonKey(name: 'entrega_equipo') bool get entregaEquipo;@JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson) double? get montoRetencionInfonavit;@JsonKey(name: 'equipos_entregados') List<CandidatoEquipo> get equiposEntregados;@JsonKey(name: 'contrato_solicitado_en') DateTime? get contratoSolicitadoEn; int? get empleado;
/// Create a copy of CandidatoDetalle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatoDetalleCopyWith<CandidatoDetalle> get copyWith => _$CandidatoDetalleCopyWithImpl<CandidatoDetalle>(this as CandidatoDetalle, _$identity);

  /// Serializes this CandidatoDetalle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatoDetalle&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.fechaExpiracion, fechaExpiracion) || other.fechaExpiracion == fechaExpiracion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.puestoNombre, puestoNombre) || other.puestoNombre == puestoNombre)&&(identical(other.puestoResponsabilidades, puestoResponsabilidades) || other.puestoResponsabilidades == puestoResponsabilidades)&&const DeepCollectionEquality().equals(other.documentos, documentos)&&(identical(other.verificadoPorIa, verificadoPorIa) || other.verificadoPorIa == verificadoPorIa)&&(identical(other.motivoRechazoRh, motivoRechazoRh) || other.motivoRechazoRh == motivoRechazoRh)&&(identical(other.turnoSugerido, turnoSugerido) || other.turnoSugerido == turnoSugerido)&&(identical(other.apellidoPaterno, apellidoPaterno) || other.apellidoPaterno == apellidoPaterno)&&(identical(other.apellidoMaterno, apellidoMaterno) || other.apellidoMaterno == apellidoMaterno)&&(identical(other.nombres, nombres) || other.nombres == nombres)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.numeroSeguroSocial, numeroSeguroSocial) || other.numeroSeguroSocial == numeroSeguroSocial)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.contactoEmergenciaNombre, contactoEmergenciaNombre) || other.contactoEmergenciaNombre == contactoEmergenciaNombre)&&(identical(other.contactoEmergenciaTelefono, contactoEmergenciaTelefono) || other.contactoEmergenciaTelefono == contactoEmergenciaTelefono)&&(identical(other.direccionCalle, direccionCalle) || other.direccionCalle == direccionCalle)&&(identical(other.direccionNumero, direccionNumero) || other.direccionNumero == direccionNumero)&&(identical(other.direccionFraccionamiento, direccionFraccionamiento) || other.direccionFraccionamiento == direccionFraccionamiento)&&(identical(other.direccionCodigoPostal, direccionCodigoPostal) || other.direccionCodigoPostal == direccionCodigoPostal)&&(identical(other.direccionMunicipio, direccionMunicipio) || other.direccionMunicipio == direccionMunicipio)&&(identical(other.direccionEstado, direccionEstado) || other.direccionEstado == direccionEstado)&&(identical(other.direccionPais, direccionPais) || other.direccionPais == direccionPais)&&(identical(other.nacionalidad, nacionalidad) || other.nacionalidad == nacionalidad)&&(identical(other.sexo, sexo) || other.sexo == sexo)&&(identical(other.estadoCivil, estadoCivil) || other.estadoCivil == estadoCivil)&&const DeepCollectionEquality().equals(other.beneficiarios, beneficiarios)&&(identical(other.salarioDiario, salarioDiario) || other.salarioDiario == salarioDiario)&&(identical(other.fechaIngreso, fechaIngreso) || other.fechaIngreso == fechaIngreso)&&(identical(other.tipoContrato, tipoContrato) || other.tipoContrato == tipoContrato)&&(identical(other.duracionDias, duracionDias) || other.duracionDias == duracionDias)&&(identical(other.tipoJornada, tipoJornada) || other.tipoJornada == tipoJornada)&&(identical(other.rotacionDetalle, rotacionDetalle) || other.rotacionDetalle == rotacionDetalle)&&(identical(other.diasLaborados, diasLaborados) || other.diasLaborados == diasLaborados)&&(identical(other.diaDescanso, diaDescanso) || other.diaDescanso == diaDescanso)&&(identical(other.horaEntrada, horaEntrada) || other.horaEntrada == horaEntrada)&&(identical(other.horaComidaInicio, horaComidaInicio) || other.horaComidaInicio == horaComidaInicio)&&(identical(other.horaComidaFin, horaComidaFin) || other.horaComidaFin == horaComidaFin)&&(identical(other.horaSalida, horaSalida) || other.horaSalida == horaSalida)&&(identical(other.formaPago, formaPago) || other.formaPago == formaPago)&&(identical(other.modalidadPago, modalidadPago) || other.modalidadPago == modalidadPago)&&(identical(other.bonoAsistencia, bonoAsistencia) || other.bonoAsistencia == bonoAsistencia)&&(identical(other.bonoPuntualidad, bonoPuntualidad) || other.bonoPuntualidad == bonoPuntualidad)&&(identical(other.valesDespensaMonedero, valesDespensaMonedero) || other.valesDespensaMonedero == valesDespensaMonedero)&&(identical(other.percibeComisiones, percibeComisiones) || other.percibeComisiones == percibeComisiones)&&(identical(other.comisionesDetalle, comisionesDetalle) || other.comisionesDetalle == comisionesDetalle)&&(identical(other.herramientas, herramientas) || other.herramientas == herramientas)&&(identical(other.entregaEquipo, entregaEquipo) || other.entregaEquipo == entregaEquipo)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&const DeepCollectionEquality().equals(other.equiposEntregados, equiposEntregados)&&(identical(other.contratoSolicitadoEn, contratoSolicitadoEn) || other.contratoSolicitadoEn == contratoSolicitadoEn)&&(identical(other.empleado, empleado) || other.empleado == empleado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,nombre,correo,estado,fechaExpiracion,createdAt,puestoNombre,puestoResponsabilidades,const DeepCollectionEquality().hash(documentos),verificadoPorIa,motivoRechazoRh,turnoSugerido,apellidoPaterno,apellidoMaterno,nombres,fechaNacimiento,curp,rfc,numeroSeguroSocial,clabeInterbancaria,escolaridad,telefono,contactoEmergenciaNombre,contactoEmergenciaTelefono,direccionCalle,direccionNumero,direccionFraccionamiento,direccionCodigoPostal,direccionMunicipio,direccionEstado,direccionPais,nacionalidad,sexo,estadoCivil,const DeepCollectionEquality().hash(beneficiarios),salarioDiario,fechaIngreso,tipoContrato,duracionDias,tipoJornada,rotacionDetalle,diasLaborados,diaDescanso,horaEntrada,horaComidaInicio,horaComidaFin,horaSalida,formaPago,modalidadPago,bonoAsistencia,bonoPuntualidad,valesDespensaMonedero,percibeComisiones,comisionesDetalle,herramientas,entregaEquipo,montoRetencionInfonavit,const DeepCollectionEquality().hash(equiposEntregados),contratoSolicitadoEn,empleado]);

@override
String toString() {
  return 'CandidatoDetalle(id: $id, nombre: $nombre, correo: $correo, estado: $estado, fechaExpiracion: $fechaExpiracion, createdAt: $createdAt, puestoNombre: $puestoNombre, puestoResponsabilidades: $puestoResponsabilidades, documentos: $documentos, verificadoPorIa: $verificadoPorIa, motivoRechazoRh: $motivoRechazoRh, turnoSugerido: $turnoSugerido, apellidoPaterno: $apellidoPaterno, apellidoMaterno: $apellidoMaterno, nombres: $nombres, fechaNacimiento: $fechaNacimiento, curp: $curp, rfc: $rfc, numeroSeguroSocial: $numeroSeguroSocial, clabeInterbancaria: $clabeInterbancaria, escolaridad: $escolaridad, telefono: $telefono, contactoEmergenciaNombre: $contactoEmergenciaNombre, contactoEmergenciaTelefono: $contactoEmergenciaTelefono, direccionCalle: $direccionCalle, direccionNumero: $direccionNumero, direccionFraccionamiento: $direccionFraccionamiento, direccionCodigoPostal: $direccionCodigoPostal, direccionMunicipio: $direccionMunicipio, direccionEstado: $direccionEstado, direccionPais: $direccionPais, nacionalidad: $nacionalidad, sexo: $sexo, estadoCivil: $estadoCivil, beneficiarios: $beneficiarios, salarioDiario: $salarioDiario, fechaIngreso: $fechaIngreso, tipoContrato: $tipoContrato, duracionDias: $duracionDias, tipoJornada: $tipoJornada, rotacionDetalle: $rotacionDetalle, diasLaborados: $diasLaborados, diaDescanso: $diaDescanso, horaEntrada: $horaEntrada, horaComidaInicio: $horaComidaInicio, horaComidaFin: $horaComidaFin, horaSalida: $horaSalida, formaPago: $formaPago, modalidadPago: $modalidadPago, bonoAsistencia: $bonoAsistencia, bonoPuntualidad: $bonoPuntualidad, valesDespensaMonedero: $valesDespensaMonedero, percibeComisiones: $percibeComisiones, comisionesDetalle: $comisionesDetalle, herramientas: $herramientas, entregaEquipo: $entregaEquipo, montoRetencionInfonavit: $montoRetencionInfonavit, equiposEntregados: $equiposEntregados, contratoSolicitadoEn: $contratoSolicitadoEn, empleado: $empleado)';
}


}

/// @nodoc
abstract mixin class $CandidatoDetalleCopyWith<$Res>  {
  factory $CandidatoDetalleCopyWith(CandidatoDetalle value, $Res Function(CandidatoDetalle) _then) = _$CandidatoDetalleCopyWithImpl;
@useResult
$Res call({
 int id, String nombre, String correo, CandidatoEstado estado,@JsonKey(name: 'fecha_expiracion') DateTime? fechaExpiracion,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'puesto_nombre') String? puestoNombre,@JsonKey(name: 'puesto_responsabilidades') String puestoResponsabilidades, Map<String, String?> documentos,@JsonKey(name: 'verificado_por_ia') bool verificadoPorIa,@JsonKey(name: 'motivo_rechazo_rh') String motivoRechazoRh,@JsonKey(name: 'turno_sugerido') TurnoSugerido? turnoSugerido,@JsonKey(name: 'apellido_paterno') String apellidoPaterno,@JsonKey(name: 'apellido_materno') String apellidoMaterno, String nombres,@JsonKey(name: 'fecha_nacimiento') DateTime? fechaNacimiento, String curp, String rfc,@JsonKey(name: 'numero_seguro_social') String numeroSeguroSocial,@JsonKey(name: 'clabe_interbancaria') String clabeInterbancaria, String escolaridad, String telefono,@JsonKey(name: 'contacto_emergencia_nombre') String contactoEmergenciaNombre,@JsonKey(name: 'contacto_emergencia_telefono') String contactoEmergenciaTelefono,@JsonKey(name: 'direccion_calle') String direccionCalle,@JsonKey(name: 'direccion_numero') String direccionNumero,@JsonKey(name: 'direccion_fraccionamiento') String direccionFraccionamiento,@JsonKey(name: 'direccion_codigo_postal') String direccionCodigoPostal,@JsonKey(name: 'direccion_municipio') String direccionMunicipio,@JsonKey(name: 'direccion_estado') String direccionEstado,@JsonKey(name: 'direccion_pais') String direccionPais, String nacionalidad, String sexo,@JsonKey(name: 'estado_civil') String estadoCivil, List<CandidatoBeneficiario> beneficiarios,@JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson) double? salarioDiario,@JsonKey(name: 'fecha_ingreso') DateTime? fechaIngreso,@JsonKey(name: 'tipo_contrato') String tipoContrato,@JsonKey(name: 'duracion_dias') int? duracionDias,@JsonKey(name: 'tipo_jornada') String tipoJornada,@JsonKey(name: 'rotacion_detalle') String rotacionDetalle,@JsonKey(name: 'dias_laborados') String diasLaborados,@JsonKey(name: 'dia_descanso') String diaDescanso,@JsonKey(name: 'hora_entrada') String? horaEntrada,@JsonKey(name: 'hora_comida_inicio') String? horaComidaInicio,@JsonKey(name: 'hora_comida_fin') String? horaComidaFin,@JsonKey(name: 'hora_salida') String? horaSalida,@JsonKey(name: 'forma_pago') String formaPago,@JsonKey(name: 'modalidad_pago') String modalidadPago,@JsonKey(name: 'bono_asistencia') String bonoAsistencia,@JsonKey(name: 'bono_puntualidad') String bonoPuntualidad,@JsonKey(name: 'vales_despensa_monedero') bool? valesDespensaMonedero,@JsonKey(name: 'percibe_comisiones') bool? percibeComisiones,@JsonKey(name: 'comisiones_detalle') String comisionesDetalle, String herramientas,@JsonKey(name: 'entrega_equipo') bool entregaEquipo,@JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson) double? montoRetencionInfonavit,@JsonKey(name: 'equipos_entregados') List<CandidatoEquipo> equiposEntregados,@JsonKey(name: 'contrato_solicitado_en') DateTime? contratoSolicitadoEn, int? empleado
});


$TurnoSugeridoCopyWith<$Res>? get turnoSugerido;

}
/// @nodoc
class _$CandidatoDetalleCopyWithImpl<$Res>
    implements $CandidatoDetalleCopyWith<$Res> {
  _$CandidatoDetalleCopyWithImpl(this._self, this._then);

  final CandidatoDetalle _self;
  final $Res Function(CandidatoDetalle) _then;

/// Create a copy of CandidatoDetalle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? correo = null,Object? estado = null,Object? fechaExpiracion = freezed,Object? createdAt = freezed,Object? puestoNombre = freezed,Object? puestoResponsabilidades = null,Object? documentos = null,Object? verificadoPorIa = null,Object? motivoRechazoRh = null,Object? turnoSugerido = freezed,Object? apellidoPaterno = null,Object? apellidoMaterno = null,Object? nombres = null,Object? fechaNacimiento = freezed,Object? curp = null,Object? rfc = null,Object? numeroSeguroSocial = null,Object? clabeInterbancaria = null,Object? escolaridad = null,Object? telefono = null,Object? contactoEmergenciaNombre = null,Object? contactoEmergenciaTelefono = null,Object? direccionCalle = null,Object? direccionNumero = null,Object? direccionFraccionamiento = null,Object? direccionCodigoPostal = null,Object? direccionMunicipio = null,Object? direccionEstado = null,Object? direccionPais = null,Object? nacionalidad = null,Object? sexo = null,Object? estadoCivil = null,Object? beneficiarios = null,Object? salarioDiario = freezed,Object? fechaIngreso = freezed,Object? tipoContrato = null,Object? duracionDias = freezed,Object? tipoJornada = null,Object? rotacionDetalle = null,Object? diasLaborados = null,Object? diaDescanso = null,Object? horaEntrada = freezed,Object? horaComidaInicio = freezed,Object? horaComidaFin = freezed,Object? horaSalida = freezed,Object? formaPago = null,Object? modalidadPago = null,Object? bonoAsistencia = null,Object? bonoPuntualidad = null,Object? valesDespensaMonedero = freezed,Object? percibeComisiones = freezed,Object? comisionesDetalle = null,Object? herramientas = null,Object? entregaEquipo = null,Object? montoRetencionInfonavit = freezed,Object? equiposEntregados = null,Object? contratoSolicitadoEn = freezed,Object? empleado = freezed,}) {
  return _then(CandidatoDetalle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as CandidatoEstado,fechaExpiracion: freezed == fechaExpiracion ? _self.fechaExpiracion : fechaExpiracion // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,puestoNombre: freezed == puestoNombre ? _self.puestoNombre : puestoNombre // ignore: cast_nullable_to_non_nullable
as String?,puestoResponsabilidades: null == puestoResponsabilidades ? _self.puestoResponsabilidades : puestoResponsabilidades // ignore: cast_nullable_to_non_nullable
as String,documentos: null == documentos ? _self.documentos : documentos // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,verificadoPorIa: null == verificadoPorIa ? _self.verificadoPorIa : verificadoPorIa // ignore: cast_nullable_to_non_nullable
as bool,motivoRechazoRh: null == motivoRechazoRh ? _self.motivoRechazoRh : motivoRechazoRh // ignore: cast_nullable_to_non_nullable
as String,turnoSugerido: freezed == turnoSugerido ? _self.turnoSugerido : turnoSugerido // ignore: cast_nullable_to_non_nullable
as TurnoSugerido?,apellidoPaterno: null == apellidoPaterno ? _self.apellidoPaterno : apellidoPaterno // ignore: cast_nullable_to_non_nullable
as String,apellidoMaterno: null == apellidoMaterno ? _self.apellidoMaterno : apellidoMaterno // ignore: cast_nullable_to_non_nullable
as String,nombres: null == nombres ? _self.nombres : nombres // ignore: cast_nullable_to_non_nullable
as String,fechaNacimiento: freezed == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime?,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,numeroSeguroSocial: null == numeroSeguroSocial ? _self.numeroSeguroSocial : numeroSeguroSocial // ignore: cast_nullable_to_non_nullable
as String,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,contactoEmergenciaNombre: null == contactoEmergenciaNombre ? _self.contactoEmergenciaNombre : contactoEmergenciaNombre // ignore: cast_nullable_to_non_nullable
as String,contactoEmergenciaTelefono: null == contactoEmergenciaTelefono ? _self.contactoEmergenciaTelefono : contactoEmergenciaTelefono // ignore: cast_nullable_to_non_nullable
as String,direccionCalle: null == direccionCalle ? _self.direccionCalle : direccionCalle // ignore: cast_nullable_to_non_nullable
as String,direccionNumero: null == direccionNumero ? _self.direccionNumero : direccionNumero // ignore: cast_nullable_to_non_nullable
as String,direccionFraccionamiento: null == direccionFraccionamiento ? _self.direccionFraccionamiento : direccionFraccionamiento // ignore: cast_nullable_to_non_nullable
as String,direccionCodigoPostal: null == direccionCodigoPostal ? _self.direccionCodigoPostal : direccionCodigoPostal // ignore: cast_nullable_to_non_nullable
as String,direccionMunicipio: null == direccionMunicipio ? _self.direccionMunicipio : direccionMunicipio // ignore: cast_nullable_to_non_nullable
as String,direccionEstado: null == direccionEstado ? _self.direccionEstado : direccionEstado // ignore: cast_nullable_to_non_nullable
as String,direccionPais: null == direccionPais ? _self.direccionPais : direccionPais // ignore: cast_nullable_to_non_nullable
as String,nacionalidad: null == nacionalidad ? _self.nacionalidad : nacionalidad // ignore: cast_nullable_to_non_nullable
as String,sexo: null == sexo ? _self.sexo : sexo // ignore: cast_nullable_to_non_nullable
as String,estadoCivil: null == estadoCivil ? _self.estadoCivil : estadoCivil // ignore: cast_nullable_to_non_nullable
as String,beneficiarios: null == beneficiarios ? _self.beneficiarios : beneficiarios // ignore: cast_nullable_to_non_nullable
as List<CandidatoBeneficiario>,salarioDiario: freezed == salarioDiario ? _self.salarioDiario : salarioDiario // ignore: cast_nullable_to_non_nullable
as double?,fechaIngreso: freezed == fechaIngreso ? _self.fechaIngreso : fechaIngreso // ignore: cast_nullable_to_non_nullable
as DateTime?,tipoContrato: null == tipoContrato ? _self.tipoContrato : tipoContrato // ignore: cast_nullable_to_non_nullable
as String,duracionDias: freezed == duracionDias ? _self.duracionDias : duracionDias // ignore: cast_nullable_to_non_nullable
as int?,tipoJornada: null == tipoJornada ? _self.tipoJornada : tipoJornada // ignore: cast_nullable_to_non_nullable
as String,rotacionDetalle: null == rotacionDetalle ? _self.rotacionDetalle : rotacionDetalle // ignore: cast_nullable_to_non_nullable
as String,diasLaborados: null == diasLaborados ? _self.diasLaborados : diasLaborados // ignore: cast_nullable_to_non_nullable
as String,diaDescanso: null == diaDescanso ? _self.diaDescanso : diaDescanso // ignore: cast_nullable_to_non_nullable
as String,horaEntrada: freezed == horaEntrada ? _self.horaEntrada : horaEntrada // ignore: cast_nullable_to_non_nullable
as String?,horaComidaInicio: freezed == horaComidaInicio ? _self.horaComidaInicio : horaComidaInicio // ignore: cast_nullable_to_non_nullable
as String?,horaComidaFin: freezed == horaComidaFin ? _self.horaComidaFin : horaComidaFin // ignore: cast_nullable_to_non_nullable
as String?,horaSalida: freezed == horaSalida ? _self.horaSalida : horaSalida // ignore: cast_nullable_to_non_nullable
as String?,formaPago: null == formaPago ? _self.formaPago : formaPago // ignore: cast_nullable_to_non_nullable
as String,modalidadPago: null == modalidadPago ? _self.modalidadPago : modalidadPago // ignore: cast_nullable_to_non_nullable
as String,bonoAsistencia: null == bonoAsistencia ? _self.bonoAsistencia : bonoAsistencia // ignore: cast_nullable_to_non_nullable
as String,bonoPuntualidad: null == bonoPuntualidad ? _self.bonoPuntualidad : bonoPuntualidad // ignore: cast_nullable_to_non_nullable
as String,valesDespensaMonedero: freezed == valesDespensaMonedero ? _self.valesDespensaMonedero : valesDespensaMonedero // ignore: cast_nullable_to_non_nullable
as bool?,percibeComisiones: freezed == percibeComisiones ? _self.percibeComisiones : percibeComisiones // ignore: cast_nullable_to_non_nullable
as bool?,comisionesDetalle: null == comisionesDetalle ? _self.comisionesDetalle : comisionesDetalle // ignore: cast_nullable_to_non_nullable
as String,herramientas: null == herramientas ? _self.herramientas : herramientas // ignore: cast_nullable_to_non_nullable
as String,entregaEquipo: null == entregaEquipo ? _self.entregaEquipo : entregaEquipo // ignore: cast_nullable_to_non_nullable
as bool,montoRetencionInfonavit: freezed == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double?,equiposEntregados: null == equiposEntregados ? _self.equiposEntregados : equiposEntregados // ignore: cast_nullable_to_non_nullable
as List<CandidatoEquipo>,contratoSolicitadoEn: freezed == contratoSolicitadoEn ? _self.contratoSolicitadoEn : contratoSolicitadoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,empleado: freezed == empleado ? _self.empleado : empleado // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of CandidatoDetalle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TurnoSugeridoCopyWith<$Res>? get turnoSugerido {
    if (_self.turnoSugerido == null) {
    return null;
  }

  return $TurnoSugeridoCopyWith<$Res>(_self.turnoSugerido!, (value) {
    return _then(_self.copyWith(turnoSugerido: value));
  });
}
}


/// Adds pattern-matching-related methods to [CandidatoDetalle].
extension CandidatoDetallePatterns on CandidatoDetalle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidatoDetalle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidatoDetalle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidatoDetalle value)  $default,){
final _that = this;
switch (_that) {
case _CandidatoDetalle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidatoDetalle value)?  $default,){
final _that = this;
switch (_that) {
case _CandidatoDetalle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nombre,  String correo,  CandidatoEstado estado, @JsonKey(name: 'fecha_expiracion')  DateTime? fechaExpiracion, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'puesto_nombre')  String? puestoNombre, @JsonKey(name: 'puesto_responsabilidades')  String puestoResponsabilidades,  Map<String, String?> documentos, @JsonKey(name: 'verificado_por_ia')  bool verificadoPorIa, @JsonKey(name: 'motivo_rechazo_rh')  String motivoRechazoRh, @JsonKey(name: 'turno_sugerido')  TurnoSugerido? turnoSugerido, @JsonKey(name: 'apellido_paterno')  String apellidoPaterno, @JsonKey(name: 'apellido_materno')  String apellidoMaterno,  String nombres, @JsonKey(name: 'fecha_nacimiento')  DateTime? fechaNacimiento,  String curp,  String rfc, @JsonKey(name: 'numero_seguro_social')  String numeroSeguroSocial, @JsonKey(name: 'clabe_interbancaria')  String clabeInterbancaria,  String escolaridad,  String telefono, @JsonKey(name: 'contacto_emergencia_nombre')  String contactoEmergenciaNombre, @JsonKey(name: 'contacto_emergencia_telefono')  String contactoEmergenciaTelefono, @JsonKey(name: 'direccion_calle')  String direccionCalle, @JsonKey(name: 'direccion_numero')  String direccionNumero, @JsonKey(name: 'direccion_fraccionamiento')  String direccionFraccionamiento, @JsonKey(name: 'direccion_codigo_postal')  String direccionCodigoPostal, @JsonKey(name: 'direccion_municipio')  String direccionMunicipio, @JsonKey(name: 'direccion_estado')  String direccionEstado, @JsonKey(name: 'direccion_pais')  String direccionPais,  String nacionalidad,  String sexo, @JsonKey(name: 'estado_civil')  String estadoCivil,  List<CandidatoBeneficiario> beneficiarios, @JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson)  double? salarioDiario, @JsonKey(name: 'fecha_ingreso')  DateTime? fechaIngreso, @JsonKey(name: 'tipo_contrato')  String tipoContrato, @JsonKey(name: 'duracion_dias')  int? duracionDias, @JsonKey(name: 'tipo_jornada')  String tipoJornada, @JsonKey(name: 'rotacion_detalle')  String rotacionDetalle, @JsonKey(name: 'dias_laborados')  String diasLaborados, @JsonKey(name: 'dia_descanso')  String diaDescanso, @JsonKey(name: 'hora_entrada')  String? horaEntrada, @JsonKey(name: 'hora_comida_inicio')  String? horaComidaInicio, @JsonKey(name: 'hora_comida_fin')  String? horaComidaFin, @JsonKey(name: 'hora_salida')  String? horaSalida, @JsonKey(name: 'forma_pago')  String formaPago, @JsonKey(name: 'modalidad_pago')  String modalidadPago, @JsonKey(name: 'bono_asistencia')  String bonoAsistencia, @JsonKey(name: 'bono_puntualidad')  String bonoPuntualidad, @JsonKey(name: 'vales_despensa_monedero')  bool? valesDespensaMonedero, @JsonKey(name: 'percibe_comisiones')  bool? percibeComisiones, @JsonKey(name: 'comisiones_detalle')  String comisionesDetalle,  String herramientas, @JsonKey(name: 'entrega_equipo')  bool entregaEquipo, @JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson)  double? montoRetencionInfonavit, @JsonKey(name: 'equipos_entregados')  List<CandidatoEquipo> equiposEntregados, @JsonKey(name: 'contrato_solicitado_en')  DateTime? contratoSolicitadoEn,  int? empleado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidatoDetalle() when $default != null:
return $default(_that.id,_that.nombre,_that.correo,_that.estado,_that.fechaExpiracion,_that.createdAt,_that.puestoNombre,_that.puestoResponsabilidades,_that.documentos,_that.verificadoPorIa,_that.motivoRechazoRh,_that.turnoSugerido,_that.apellidoPaterno,_that.apellidoMaterno,_that.nombres,_that.fechaNacimiento,_that.curp,_that.rfc,_that.numeroSeguroSocial,_that.clabeInterbancaria,_that.escolaridad,_that.telefono,_that.contactoEmergenciaNombre,_that.contactoEmergenciaTelefono,_that.direccionCalle,_that.direccionNumero,_that.direccionFraccionamiento,_that.direccionCodigoPostal,_that.direccionMunicipio,_that.direccionEstado,_that.direccionPais,_that.nacionalidad,_that.sexo,_that.estadoCivil,_that.beneficiarios,_that.salarioDiario,_that.fechaIngreso,_that.tipoContrato,_that.duracionDias,_that.tipoJornada,_that.rotacionDetalle,_that.diasLaborados,_that.diaDescanso,_that.horaEntrada,_that.horaComidaInicio,_that.horaComidaFin,_that.horaSalida,_that.formaPago,_that.modalidadPago,_that.bonoAsistencia,_that.bonoPuntualidad,_that.valesDespensaMonedero,_that.percibeComisiones,_that.comisionesDetalle,_that.herramientas,_that.entregaEquipo,_that.montoRetencionInfonavit,_that.equiposEntregados,_that.contratoSolicitadoEn,_that.empleado);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nombre,  String correo,  CandidatoEstado estado, @JsonKey(name: 'fecha_expiracion')  DateTime? fechaExpiracion, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'puesto_nombre')  String? puestoNombre, @JsonKey(name: 'puesto_responsabilidades')  String puestoResponsabilidades,  Map<String, String?> documentos, @JsonKey(name: 'verificado_por_ia')  bool verificadoPorIa, @JsonKey(name: 'motivo_rechazo_rh')  String motivoRechazoRh, @JsonKey(name: 'turno_sugerido')  TurnoSugerido? turnoSugerido, @JsonKey(name: 'apellido_paterno')  String apellidoPaterno, @JsonKey(name: 'apellido_materno')  String apellidoMaterno,  String nombres, @JsonKey(name: 'fecha_nacimiento')  DateTime? fechaNacimiento,  String curp,  String rfc, @JsonKey(name: 'numero_seguro_social')  String numeroSeguroSocial, @JsonKey(name: 'clabe_interbancaria')  String clabeInterbancaria,  String escolaridad,  String telefono, @JsonKey(name: 'contacto_emergencia_nombre')  String contactoEmergenciaNombre, @JsonKey(name: 'contacto_emergencia_telefono')  String contactoEmergenciaTelefono, @JsonKey(name: 'direccion_calle')  String direccionCalle, @JsonKey(name: 'direccion_numero')  String direccionNumero, @JsonKey(name: 'direccion_fraccionamiento')  String direccionFraccionamiento, @JsonKey(name: 'direccion_codigo_postal')  String direccionCodigoPostal, @JsonKey(name: 'direccion_municipio')  String direccionMunicipio, @JsonKey(name: 'direccion_estado')  String direccionEstado, @JsonKey(name: 'direccion_pais')  String direccionPais,  String nacionalidad,  String sexo, @JsonKey(name: 'estado_civil')  String estadoCivil,  List<CandidatoBeneficiario> beneficiarios, @JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson)  double? salarioDiario, @JsonKey(name: 'fecha_ingreso')  DateTime? fechaIngreso, @JsonKey(name: 'tipo_contrato')  String tipoContrato, @JsonKey(name: 'duracion_dias')  int? duracionDias, @JsonKey(name: 'tipo_jornada')  String tipoJornada, @JsonKey(name: 'rotacion_detalle')  String rotacionDetalle, @JsonKey(name: 'dias_laborados')  String diasLaborados, @JsonKey(name: 'dia_descanso')  String diaDescanso, @JsonKey(name: 'hora_entrada')  String? horaEntrada, @JsonKey(name: 'hora_comida_inicio')  String? horaComidaInicio, @JsonKey(name: 'hora_comida_fin')  String? horaComidaFin, @JsonKey(name: 'hora_salida')  String? horaSalida, @JsonKey(name: 'forma_pago')  String formaPago, @JsonKey(name: 'modalidad_pago')  String modalidadPago, @JsonKey(name: 'bono_asistencia')  String bonoAsistencia, @JsonKey(name: 'bono_puntualidad')  String bonoPuntualidad, @JsonKey(name: 'vales_despensa_monedero')  bool? valesDespensaMonedero, @JsonKey(name: 'percibe_comisiones')  bool? percibeComisiones, @JsonKey(name: 'comisiones_detalle')  String comisionesDetalle,  String herramientas, @JsonKey(name: 'entrega_equipo')  bool entregaEquipo, @JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson)  double? montoRetencionInfonavit, @JsonKey(name: 'equipos_entregados')  List<CandidatoEquipo> equiposEntregados, @JsonKey(name: 'contrato_solicitado_en')  DateTime? contratoSolicitadoEn,  int? empleado)  $default,) {final _that = this;
switch (_that) {
case _CandidatoDetalle():
return $default(_that.id,_that.nombre,_that.correo,_that.estado,_that.fechaExpiracion,_that.createdAt,_that.puestoNombre,_that.puestoResponsabilidades,_that.documentos,_that.verificadoPorIa,_that.motivoRechazoRh,_that.turnoSugerido,_that.apellidoPaterno,_that.apellidoMaterno,_that.nombres,_that.fechaNacimiento,_that.curp,_that.rfc,_that.numeroSeguroSocial,_that.clabeInterbancaria,_that.escolaridad,_that.telefono,_that.contactoEmergenciaNombre,_that.contactoEmergenciaTelefono,_that.direccionCalle,_that.direccionNumero,_that.direccionFraccionamiento,_that.direccionCodigoPostal,_that.direccionMunicipio,_that.direccionEstado,_that.direccionPais,_that.nacionalidad,_that.sexo,_that.estadoCivil,_that.beneficiarios,_that.salarioDiario,_that.fechaIngreso,_that.tipoContrato,_that.duracionDias,_that.tipoJornada,_that.rotacionDetalle,_that.diasLaborados,_that.diaDescanso,_that.horaEntrada,_that.horaComidaInicio,_that.horaComidaFin,_that.horaSalida,_that.formaPago,_that.modalidadPago,_that.bonoAsistencia,_that.bonoPuntualidad,_that.valesDespensaMonedero,_that.percibeComisiones,_that.comisionesDetalle,_that.herramientas,_that.entregaEquipo,_that.montoRetencionInfonavit,_that.equiposEntregados,_that.contratoSolicitadoEn,_that.empleado);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nombre,  String correo,  CandidatoEstado estado, @JsonKey(name: 'fecha_expiracion')  DateTime? fechaExpiracion, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'puesto_nombre')  String? puestoNombre, @JsonKey(name: 'puesto_responsabilidades')  String puestoResponsabilidades,  Map<String, String?> documentos, @JsonKey(name: 'verificado_por_ia')  bool verificadoPorIa, @JsonKey(name: 'motivo_rechazo_rh')  String motivoRechazoRh, @JsonKey(name: 'turno_sugerido')  TurnoSugerido? turnoSugerido, @JsonKey(name: 'apellido_paterno')  String apellidoPaterno, @JsonKey(name: 'apellido_materno')  String apellidoMaterno,  String nombres, @JsonKey(name: 'fecha_nacimiento')  DateTime? fechaNacimiento,  String curp,  String rfc, @JsonKey(name: 'numero_seguro_social')  String numeroSeguroSocial, @JsonKey(name: 'clabe_interbancaria')  String clabeInterbancaria,  String escolaridad,  String telefono, @JsonKey(name: 'contacto_emergencia_nombre')  String contactoEmergenciaNombre, @JsonKey(name: 'contacto_emergencia_telefono')  String contactoEmergenciaTelefono, @JsonKey(name: 'direccion_calle')  String direccionCalle, @JsonKey(name: 'direccion_numero')  String direccionNumero, @JsonKey(name: 'direccion_fraccionamiento')  String direccionFraccionamiento, @JsonKey(name: 'direccion_codigo_postal')  String direccionCodigoPostal, @JsonKey(name: 'direccion_municipio')  String direccionMunicipio, @JsonKey(name: 'direccion_estado')  String direccionEstado, @JsonKey(name: 'direccion_pais')  String direccionPais,  String nacionalidad,  String sexo, @JsonKey(name: 'estado_civil')  String estadoCivil,  List<CandidatoBeneficiario> beneficiarios, @JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson)  double? salarioDiario, @JsonKey(name: 'fecha_ingreso')  DateTime? fechaIngreso, @JsonKey(name: 'tipo_contrato')  String tipoContrato, @JsonKey(name: 'duracion_dias')  int? duracionDias, @JsonKey(name: 'tipo_jornada')  String tipoJornada, @JsonKey(name: 'rotacion_detalle')  String rotacionDetalle, @JsonKey(name: 'dias_laborados')  String diasLaborados, @JsonKey(name: 'dia_descanso')  String diaDescanso, @JsonKey(name: 'hora_entrada')  String? horaEntrada, @JsonKey(name: 'hora_comida_inicio')  String? horaComidaInicio, @JsonKey(name: 'hora_comida_fin')  String? horaComidaFin, @JsonKey(name: 'hora_salida')  String? horaSalida, @JsonKey(name: 'forma_pago')  String formaPago, @JsonKey(name: 'modalidad_pago')  String modalidadPago, @JsonKey(name: 'bono_asistencia')  String bonoAsistencia, @JsonKey(name: 'bono_puntualidad')  String bonoPuntualidad, @JsonKey(name: 'vales_despensa_monedero')  bool? valesDespensaMonedero, @JsonKey(name: 'percibe_comisiones')  bool? percibeComisiones, @JsonKey(name: 'comisiones_detalle')  String comisionesDetalle,  String herramientas, @JsonKey(name: 'entrega_equipo')  bool entregaEquipo, @JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson)  double? montoRetencionInfonavit, @JsonKey(name: 'equipos_entregados')  List<CandidatoEquipo> equiposEntregados, @JsonKey(name: 'contrato_solicitado_en')  DateTime? contratoSolicitadoEn,  int? empleado)?  $default,) {final _that = this;
switch (_that) {
case _CandidatoDetalle() when $default != null:
return $default(_that.id,_that.nombre,_that.correo,_that.estado,_that.fechaExpiracion,_that.createdAt,_that.puestoNombre,_that.puestoResponsabilidades,_that.documentos,_that.verificadoPorIa,_that.motivoRechazoRh,_that.turnoSugerido,_that.apellidoPaterno,_that.apellidoMaterno,_that.nombres,_that.fechaNacimiento,_that.curp,_that.rfc,_that.numeroSeguroSocial,_that.clabeInterbancaria,_that.escolaridad,_that.telefono,_that.contactoEmergenciaNombre,_that.contactoEmergenciaTelefono,_that.direccionCalle,_that.direccionNumero,_that.direccionFraccionamiento,_that.direccionCodigoPostal,_that.direccionMunicipio,_that.direccionEstado,_that.direccionPais,_that.nacionalidad,_that.sexo,_that.estadoCivil,_that.beneficiarios,_that.salarioDiario,_that.fechaIngreso,_that.tipoContrato,_that.duracionDias,_that.tipoJornada,_that.rotacionDetalle,_that.diasLaborados,_that.diaDescanso,_that.horaEntrada,_that.horaComidaInicio,_that.horaComidaFin,_that.horaSalida,_that.formaPago,_that.modalidadPago,_that.bonoAsistencia,_that.bonoPuntualidad,_that.valesDespensaMonedero,_that.percibeComisiones,_that.comisionesDetalle,_that.herramientas,_that.entregaEquipo,_that.montoRetencionInfonavit,_that.equiposEntregados,_that.contratoSolicitadoEn,_that.empleado);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidatoDetalle implements CandidatoDetalle {
  const _CandidatoDetalle({required this.id, required this.nombre, required this.correo, this.estado = CandidatoEstado.iniciado, @JsonKey(name: 'fecha_expiracion') this.fechaExpiracion, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'puesto_nombre') this.puestoNombre, @JsonKey(name: 'puesto_responsabilidades') this.puestoResponsabilidades = '',  Map<String, String?> documentos = const <String, String?>{}, @JsonKey(name: 'verificado_por_ia') this.verificadoPorIa = false, @JsonKey(name: 'motivo_rechazo_rh') this.motivoRechazoRh = '', @JsonKey(name: 'turno_sugerido') this.turnoSugerido, @JsonKey(name: 'apellido_paterno') this.apellidoPaterno = '', @JsonKey(name: 'apellido_materno') this.apellidoMaterno = '', this.nombres = '', @JsonKey(name: 'fecha_nacimiento') this.fechaNacimiento, this.curp = '', this.rfc = '', @JsonKey(name: 'numero_seguro_social') this.numeroSeguroSocial = '', @JsonKey(name: 'clabe_interbancaria') this.clabeInterbancaria = '', this.escolaridad = '', this.telefono = '', @JsonKey(name: 'contacto_emergencia_nombre') this.contactoEmergenciaNombre = '', @JsonKey(name: 'contacto_emergencia_telefono') this.contactoEmergenciaTelefono = '', @JsonKey(name: 'direccion_calle') this.direccionCalle = '', @JsonKey(name: 'direccion_numero') this.direccionNumero = '', @JsonKey(name: 'direccion_fraccionamiento') this.direccionFraccionamiento = '', @JsonKey(name: 'direccion_codigo_postal') this.direccionCodigoPostal = '', @JsonKey(name: 'direccion_municipio') this.direccionMunicipio = '', @JsonKey(name: 'direccion_estado') this.direccionEstado = '', @JsonKey(name: 'direccion_pais') this.direccionPais = '', this.nacionalidad = '', this.sexo = '', @JsonKey(name: 'estado_civil') this.estadoCivil = '',  List<CandidatoBeneficiario> beneficiarios = const <CandidatoBeneficiario>[], @JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson) this.salarioDiario, @JsonKey(name: 'fecha_ingreso') this.fechaIngreso, @JsonKey(name: 'tipo_contrato') this.tipoContrato = '', @JsonKey(name: 'duracion_dias') this.duracionDias, @JsonKey(name: 'tipo_jornada') this.tipoJornada = '', @JsonKey(name: 'rotacion_detalle') this.rotacionDetalle = '', @JsonKey(name: 'dias_laborados') this.diasLaborados = '', @JsonKey(name: 'dia_descanso') this.diaDescanso = '', @JsonKey(name: 'hora_entrada') this.horaEntrada, @JsonKey(name: 'hora_comida_inicio') this.horaComidaInicio, @JsonKey(name: 'hora_comida_fin') this.horaComidaFin, @JsonKey(name: 'hora_salida') this.horaSalida, @JsonKey(name: 'forma_pago') this.formaPago = '', @JsonKey(name: 'modalidad_pago') this.modalidadPago = '', @JsonKey(name: 'bono_asistencia') this.bonoAsistencia = '', @JsonKey(name: 'bono_puntualidad') this.bonoPuntualidad = '', @JsonKey(name: 'vales_despensa_monedero') this.valesDespensaMonedero, @JsonKey(name: 'percibe_comisiones') this.percibeComisiones, @JsonKey(name: 'comisiones_detalle') this.comisionesDetalle = '', this.herramientas = 'N/A', @JsonKey(name: 'entrega_equipo') this.entregaEquipo = false, @JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson) this.montoRetencionInfonavit, @JsonKey(name: 'equipos_entregados')  List<CandidatoEquipo> equiposEntregados = const <CandidatoEquipo>[], @JsonKey(name: 'contrato_solicitado_en') this.contratoSolicitadoEn, this.empleado}): _documentos = documentos,_beneficiarios = beneficiarios,_equiposEntregados = equiposEntregados;
  factory _CandidatoDetalle.fromJson(Map<String, dynamic> json) => _$CandidatoDetalleFromJson(json);

@override final  int id;
@override final  String nombre;
@override final  String correo;
@override@JsonKey() final  CandidatoEstado estado;
@override@JsonKey(name: 'fecha_expiracion') final  DateTime? fechaExpiracion;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'puesto_nombre') final  String? puestoNombre;
@override@JsonKey(name: 'puesto_responsabilidades') final  String puestoResponsabilidades;
 final  Map<String, String?> _documentos;
@override@JsonKey() Map<String, String?> get documentos {
  if (_documentos is EqualUnmodifiableMapView) return _documentos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_documentos);
}

@override@JsonKey(name: 'verificado_por_ia') final  bool verificadoPorIa;
@override@JsonKey(name: 'motivo_rechazo_rh') final  String motivoRechazoRh;
@override@JsonKey(name: 'turno_sugerido') final  TurnoSugerido? turnoSugerido;
@override@JsonKey(name: 'apellido_paterno') final  String apellidoPaterno;
@override@JsonKey(name: 'apellido_materno') final  String apellidoMaterno;
@override@JsonKey() final  String nombres;
@override@JsonKey(name: 'fecha_nacimiento') final  DateTime? fechaNacimiento;
@override@JsonKey() final  String curp;
@override@JsonKey() final  String rfc;
@override@JsonKey(name: 'numero_seguro_social') final  String numeroSeguroSocial;
@override@JsonKey(name: 'clabe_interbancaria') final  String clabeInterbancaria;
@override@JsonKey() final  String escolaridad;
@override@JsonKey() final  String telefono;
@override@JsonKey(name: 'contacto_emergencia_nombre') final  String contactoEmergenciaNombre;
@override@JsonKey(name: 'contacto_emergencia_telefono') final  String contactoEmergenciaTelefono;
@override@JsonKey(name: 'direccion_calle') final  String direccionCalle;
@override@JsonKey(name: 'direccion_numero') final  String direccionNumero;
@override@JsonKey(name: 'direccion_fraccionamiento') final  String direccionFraccionamiento;
@override@JsonKey(name: 'direccion_codigo_postal') final  String direccionCodigoPostal;
@override@JsonKey(name: 'direccion_municipio') final  String direccionMunicipio;
@override@JsonKey(name: 'direccion_estado') final  String direccionEstado;
@override@JsonKey(name: 'direccion_pais') final  String direccionPais;
@override@JsonKey() final  String nacionalidad;
@override@JsonKey() final  String sexo;
@override@JsonKey(name: 'estado_civil') final  String estadoCivil;
 final  List<CandidatoBeneficiario> _beneficiarios;
@override@JsonKey() List<CandidatoBeneficiario> get beneficiarios {
  if (_beneficiarios is EqualUnmodifiableListView) return _beneficiarios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_beneficiarios);
}

@override@JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson) final  double? salarioDiario;
@override@JsonKey(name: 'fecha_ingreso') final  DateTime? fechaIngreso;
@override@JsonKey(name: 'tipo_contrato') final  String tipoContrato;
/// Solo para tipoContrato "determinado": cuántos días dura el contrato.
@override@JsonKey(name: 'duracion_dias') final  int? duracionDias;
@override@JsonKey(name: 'tipo_jornada') final  String tipoJornada;
@override@JsonKey(name: 'rotacion_detalle') final  String rotacionDetalle;
@override@JsonKey(name: 'dias_laborados') final  String diasLaborados;
@override@JsonKey(name: 'dia_descanso') final  String diaDescanso;
@override@JsonKey(name: 'hora_entrada') final  String? horaEntrada;
@override@JsonKey(name: 'hora_comida_inicio') final  String? horaComidaInicio;
@override@JsonKey(name: 'hora_comida_fin') final  String? horaComidaFin;
@override@JsonKey(name: 'hora_salida') final  String? horaSalida;
@override@JsonKey(name: 'forma_pago') final  String formaPago;
@override@JsonKey(name: 'modalidad_pago') final  String modalidadPago;
@override@JsonKey(name: 'bono_asistencia') final  String bonoAsistencia;
@override@JsonKey(name: 'bono_puntualidad') final  String bonoPuntualidad;
@override@JsonKey(name: 'vales_despensa_monedero') final  bool? valesDespensaMonedero;
@override@JsonKey(name: 'percibe_comisiones') final  bool? percibeComisiones;
@override@JsonKey(name: 'comisiones_detalle') final  String comisionesDetalle;
@override@JsonKey() final  String herramientas;
@override@JsonKey(name: 'entrega_equipo') final  bool entregaEquipo;
@override@JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson) final  double? montoRetencionInfonavit;
 final  List<CandidatoEquipo> _equiposEntregados;
@override@JsonKey(name: 'equipos_entregados') List<CandidatoEquipo> get equiposEntregados {
  if (_equiposEntregados is EqualUnmodifiableListView) return _equiposEntregados;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equiposEntregados);
}

@override@JsonKey(name: 'contrato_solicitado_en') final  DateTime? contratoSolicitadoEn;
@override final  int? empleado;

/// Create a copy of CandidatoDetalle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatoDetalleCopyWith<_CandidatoDetalle> get copyWith => __$CandidatoDetalleCopyWithImpl<_CandidatoDetalle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidatoDetalleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatoDetalle&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.fechaExpiracion, fechaExpiracion) || other.fechaExpiracion == fechaExpiracion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.puestoNombre, puestoNombre) || other.puestoNombre == puestoNombre)&&(identical(other.puestoResponsabilidades, puestoResponsabilidades) || other.puestoResponsabilidades == puestoResponsabilidades)&&const DeepCollectionEquality().equals(other._documentos, _documentos)&&(identical(other.verificadoPorIa, verificadoPorIa) || other.verificadoPorIa == verificadoPorIa)&&(identical(other.motivoRechazoRh, motivoRechazoRh) || other.motivoRechazoRh == motivoRechazoRh)&&(identical(other.turnoSugerido, turnoSugerido) || other.turnoSugerido == turnoSugerido)&&(identical(other.apellidoPaterno, apellidoPaterno) || other.apellidoPaterno == apellidoPaterno)&&(identical(other.apellidoMaterno, apellidoMaterno) || other.apellidoMaterno == apellidoMaterno)&&(identical(other.nombres, nombres) || other.nombres == nombres)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.numeroSeguroSocial, numeroSeguroSocial) || other.numeroSeguroSocial == numeroSeguroSocial)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.contactoEmergenciaNombre, contactoEmergenciaNombre) || other.contactoEmergenciaNombre == contactoEmergenciaNombre)&&(identical(other.contactoEmergenciaTelefono, contactoEmergenciaTelefono) || other.contactoEmergenciaTelefono == contactoEmergenciaTelefono)&&(identical(other.direccionCalle, direccionCalle) || other.direccionCalle == direccionCalle)&&(identical(other.direccionNumero, direccionNumero) || other.direccionNumero == direccionNumero)&&(identical(other.direccionFraccionamiento, direccionFraccionamiento) || other.direccionFraccionamiento == direccionFraccionamiento)&&(identical(other.direccionCodigoPostal, direccionCodigoPostal) || other.direccionCodigoPostal == direccionCodigoPostal)&&(identical(other.direccionMunicipio, direccionMunicipio) || other.direccionMunicipio == direccionMunicipio)&&(identical(other.direccionEstado, direccionEstado) || other.direccionEstado == direccionEstado)&&(identical(other.direccionPais, direccionPais) || other.direccionPais == direccionPais)&&(identical(other.nacionalidad, nacionalidad) || other.nacionalidad == nacionalidad)&&(identical(other.sexo, sexo) || other.sexo == sexo)&&(identical(other.estadoCivil, estadoCivil) || other.estadoCivil == estadoCivil)&&const DeepCollectionEquality().equals(other._beneficiarios, _beneficiarios)&&(identical(other.salarioDiario, salarioDiario) || other.salarioDiario == salarioDiario)&&(identical(other.fechaIngreso, fechaIngreso) || other.fechaIngreso == fechaIngreso)&&(identical(other.tipoContrato, tipoContrato) || other.tipoContrato == tipoContrato)&&(identical(other.duracionDias, duracionDias) || other.duracionDias == duracionDias)&&(identical(other.tipoJornada, tipoJornada) || other.tipoJornada == tipoJornada)&&(identical(other.rotacionDetalle, rotacionDetalle) || other.rotacionDetalle == rotacionDetalle)&&(identical(other.diasLaborados, diasLaborados) || other.diasLaborados == diasLaborados)&&(identical(other.diaDescanso, diaDescanso) || other.diaDescanso == diaDescanso)&&(identical(other.horaEntrada, horaEntrada) || other.horaEntrada == horaEntrada)&&(identical(other.horaComidaInicio, horaComidaInicio) || other.horaComidaInicio == horaComidaInicio)&&(identical(other.horaComidaFin, horaComidaFin) || other.horaComidaFin == horaComidaFin)&&(identical(other.horaSalida, horaSalida) || other.horaSalida == horaSalida)&&(identical(other.formaPago, formaPago) || other.formaPago == formaPago)&&(identical(other.modalidadPago, modalidadPago) || other.modalidadPago == modalidadPago)&&(identical(other.bonoAsistencia, bonoAsistencia) || other.bonoAsistencia == bonoAsistencia)&&(identical(other.bonoPuntualidad, bonoPuntualidad) || other.bonoPuntualidad == bonoPuntualidad)&&(identical(other.valesDespensaMonedero, valesDespensaMonedero) || other.valesDespensaMonedero == valesDespensaMonedero)&&(identical(other.percibeComisiones, percibeComisiones) || other.percibeComisiones == percibeComisiones)&&(identical(other.comisionesDetalle, comisionesDetalle) || other.comisionesDetalle == comisionesDetalle)&&(identical(other.herramientas, herramientas) || other.herramientas == herramientas)&&(identical(other.entregaEquipo, entregaEquipo) || other.entregaEquipo == entregaEquipo)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&const DeepCollectionEquality().equals(other._equiposEntregados, _equiposEntregados)&&(identical(other.contratoSolicitadoEn, contratoSolicitadoEn) || other.contratoSolicitadoEn == contratoSolicitadoEn)&&(identical(other.empleado, empleado) || other.empleado == empleado));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,nombre,correo,estado,fechaExpiracion,createdAt,puestoNombre,puestoResponsabilidades,const DeepCollectionEquality().hash(_documentos),verificadoPorIa,motivoRechazoRh,turnoSugerido,apellidoPaterno,apellidoMaterno,nombres,fechaNacimiento,curp,rfc,numeroSeguroSocial,clabeInterbancaria,escolaridad,telefono,contactoEmergenciaNombre,contactoEmergenciaTelefono,direccionCalle,direccionNumero,direccionFraccionamiento,direccionCodigoPostal,direccionMunicipio,direccionEstado,direccionPais,nacionalidad,sexo,estadoCivil,const DeepCollectionEquality().hash(_beneficiarios),salarioDiario,fechaIngreso,tipoContrato,duracionDias,tipoJornada,rotacionDetalle,diasLaborados,diaDescanso,horaEntrada,horaComidaInicio,horaComidaFin,horaSalida,formaPago,modalidadPago,bonoAsistencia,bonoPuntualidad,valesDespensaMonedero,percibeComisiones,comisionesDetalle,herramientas,entregaEquipo,montoRetencionInfonavit,const DeepCollectionEquality().hash(_equiposEntregados),contratoSolicitadoEn,empleado]);

@override
String toString() {
  return 'CandidatoDetalle(id: $id, nombre: $nombre, correo: $correo, estado: $estado, fechaExpiracion: $fechaExpiracion, createdAt: $createdAt, puestoNombre: $puestoNombre, puestoResponsabilidades: $puestoResponsabilidades, documentos: $documentos, verificadoPorIa: $verificadoPorIa, motivoRechazoRh: $motivoRechazoRh, turnoSugerido: $turnoSugerido, apellidoPaterno: $apellidoPaterno, apellidoMaterno: $apellidoMaterno, nombres: $nombres, fechaNacimiento: $fechaNacimiento, curp: $curp, rfc: $rfc, numeroSeguroSocial: $numeroSeguroSocial, clabeInterbancaria: $clabeInterbancaria, escolaridad: $escolaridad, telefono: $telefono, contactoEmergenciaNombre: $contactoEmergenciaNombre, contactoEmergenciaTelefono: $contactoEmergenciaTelefono, direccionCalle: $direccionCalle, direccionNumero: $direccionNumero, direccionFraccionamiento: $direccionFraccionamiento, direccionCodigoPostal: $direccionCodigoPostal, direccionMunicipio: $direccionMunicipio, direccionEstado: $direccionEstado, direccionPais: $direccionPais, nacionalidad: $nacionalidad, sexo: $sexo, estadoCivil: $estadoCivil, beneficiarios: $beneficiarios, salarioDiario: $salarioDiario, fechaIngreso: $fechaIngreso, tipoContrato: $tipoContrato, duracionDias: $duracionDias, tipoJornada: $tipoJornada, rotacionDetalle: $rotacionDetalle, diasLaborados: $diasLaborados, diaDescanso: $diaDescanso, horaEntrada: $horaEntrada, horaComidaInicio: $horaComidaInicio, horaComidaFin: $horaComidaFin, horaSalida: $horaSalida, formaPago: $formaPago, modalidadPago: $modalidadPago, bonoAsistencia: $bonoAsistencia, bonoPuntualidad: $bonoPuntualidad, valesDespensaMonedero: $valesDespensaMonedero, percibeComisiones: $percibeComisiones, comisionesDetalle: $comisionesDetalle, herramientas: $herramientas, entregaEquipo: $entregaEquipo, montoRetencionInfonavit: $montoRetencionInfonavit, equiposEntregados: $equiposEntregados, contratoSolicitadoEn: $contratoSolicitadoEn, empleado: $empleado)';
}


}

/// @nodoc
abstract mixin class _$CandidatoDetalleCopyWith<$Res> implements $CandidatoDetalleCopyWith<$Res> {
  factory _$CandidatoDetalleCopyWith(_CandidatoDetalle value, $Res Function(_CandidatoDetalle) _then) = __$CandidatoDetalleCopyWithImpl;
@override @useResult
$Res call({
 int id, String nombre, String correo, CandidatoEstado estado,@JsonKey(name: 'fecha_expiracion') DateTime? fechaExpiracion,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'puesto_nombre') String? puestoNombre,@JsonKey(name: 'puesto_responsabilidades') String puestoResponsabilidades, Map<String, String?> documentos,@JsonKey(name: 'verificado_por_ia') bool verificadoPorIa,@JsonKey(name: 'motivo_rechazo_rh') String motivoRechazoRh,@JsonKey(name: 'turno_sugerido') TurnoSugerido? turnoSugerido,@JsonKey(name: 'apellido_paterno') String apellidoPaterno,@JsonKey(name: 'apellido_materno') String apellidoMaterno, String nombres,@JsonKey(name: 'fecha_nacimiento') DateTime? fechaNacimiento, String curp, String rfc,@JsonKey(name: 'numero_seguro_social') String numeroSeguroSocial,@JsonKey(name: 'clabe_interbancaria') String clabeInterbancaria, String escolaridad, String telefono,@JsonKey(name: 'contacto_emergencia_nombre') String contactoEmergenciaNombre,@JsonKey(name: 'contacto_emergencia_telefono') String contactoEmergenciaTelefono,@JsonKey(name: 'direccion_calle') String direccionCalle,@JsonKey(name: 'direccion_numero') String direccionNumero,@JsonKey(name: 'direccion_fraccionamiento') String direccionFraccionamiento,@JsonKey(name: 'direccion_codigo_postal') String direccionCodigoPostal,@JsonKey(name: 'direccion_municipio') String direccionMunicipio,@JsonKey(name: 'direccion_estado') String direccionEstado,@JsonKey(name: 'direccion_pais') String direccionPais, String nacionalidad, String sexo,@JsonKey(name: 'estado_civil') String estadoCivil, List<CandidatoBeneficiario> beneficiarios,@JsonKey(name: 'salario_diario', fromJson: _doubleOrNullFromJson) double? salarioDiario,@JsonKey(name: 'fecha_ingreso') DateTime? fechaIngreso,@JsonKey(name: 'tipo_contrato') String tipoContrato,@JsonKey(name: 'duracion_dias') int? duracionDias,@JsonKey(name: 'tipo_jornada') String tipoJornada,@JsonKey(name: 'rotacion_detalle') String rotacionDetalle,@JsonKey(name: 'dias_laborados') String diasLaborados,@JsonKey(name: 'dia_descanso') String diaDescanso,@JsonKey(name: 'hora_entrada') String? horaEntrada,@JsonKey(name: 'hora_comida_inicio') String? horaComidaInicio,@JsonKey(name: 'hora_comida_fin') String? horaComidaFin,@JsonKey(name: 'hora_salida') String? horaSalida,@JsonKey(name: 'forma_pago') String formaPago,@JsonKey(name: 'modalidad_pago') String modalidadPago,@JsonKey(name: 'bono_asistencia') String bonoAsistencia,@JsonKey(name: 'bono_puntualidad') String bonoPuntualidad,@JsonKey(name: 'vales_despensa_monedero') bool? valesDespensaMonedero,@JsonKey(name: 'percibe_comisiones') bool? percibeComisiones,@JsonKey(name: 'comisiones_detalle') String comisionesDetalle, String herramientas,@JsonKey(name: 'entrega_equipo') bool entregaEquipo,@JsonKey(name: 'monto_retencion_infonavit', fromJson: _doubleOrNullFromJson) double? montoRetencionInfonavit,@JsonKey(name: 'equipos_entregados') List<CandidatoEquipo> equiposEntregados,@JsonKey(name: 'contrato_solicitado_en') DateTime? contratoSolicitadoEn, int? empleado
});


@override $TurnoSugeridoCopyWith<$Res>? get turnoSugerido;

}
/// @nodoc
class __$CandidatoDetalleCopyWithImpl<$Res>
    implements _$CandidatoDetalleCopyWith<$Res> {
  __$CandidatoDetalleCopyWithImpl(this._self, this._then);

  final _CandidatoDetalle _self;
  final $Res Function(_CandidatoDetalle) _then;

/// Create a copy of CandidatoDetalle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? correo = null,Object? estado = null,Object? fechaExpiracion = freezed,Object? createdAt = freezed,Object? puestoNombre = freezed,Object? puestoResponsabilidades = null,Object? documentos = null,Object? verificadoPorIa = null,Object? motivoRechazoRh = null,Object? turnoSugerido = freezed,Object? apellidoPaterno = null,Object? apellidoMaterno = null,Object? nombres = null,Object? fechaNacimiento = freezed,Object? curp = null,Object? rfc = null,Object? numeroSeguroSocial = null,Object? clabeInterbancaria = null,Object? escolaridad = null,Object? telefono = null,Object? contactoEmergenciaNombre = null,Object? contactoEmergenciaTelefono = null,Object? direccionCalle = null,Object? direccionNumero = null,Object? direccionFraccionamiento = null,Object? direccionCodigoPostal = null,Object? direccionMunicipio = null,Object? direccionEstado = null,Object? direccionPais = null,Object? nacionalidad = null,Object? sexo = null,Object? estadoCivil = null,Object? beneficiarios = null,Object? salarioDiario = freezed,Object? fechaIngreso = freezed,Object? tipoContrato = null,Object? duracionDias = freezed,Object? tipoJornada = null,Object? rotacionDetalle = null,Object? diasLaborados = null,Object? diaDescanso = null,Object? horaEntrada = freezed,Object? horaComidaInicio = freezed,Object? horaComidaFin = freezed,Object? horaSalida = freezed,Object? formaPago = null,Object? modalidadPago = null,Object? bonoAsistencia = null,Object? bonoPuntualidad = null,Object? valesDespensaMonedero = freezed,Object? percibeComisiones = freezed,Object? comisionesDetalle = null,Object? herramientas = null,Object? entregaEquipo = null,Object? montoRetencionInfonavit = freezed,Object? equiposEntregados = null,Object? contratoSolicitadoEn = freezed,Object? empleado = freezed,}) {
  return _then(_CandidatoDetalle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as CandidatoEstado,fechaExpiracion: freezed == fechaExpiracion ? _self.fechaExpiracion : fechaExpiracion // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,puestoNombre: freezed == puestoNombre ? _self.puestoNombre : puestoNombre // ignore: cast_nullable_to_non_nullable
as String?,puestoResponsabilidades: null == puestoResponsabilidades ? _self.puestoResponsabilidades : puestoResponsabilidades // ignore: cast_nullable_to_non_nullable
as String,documentos: null == documentos ? _self._documentos : documentos // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,verificadoPorIa: null == verificadoPorIa ? _self.verificadoPorIa : verificadoPorIa // ignore: cast_nullable_to_non_nullable
as bool,motivoRechazoRh: null == motivoRechazoRh ? _self.motivoRechazoRh : motivoRechazoRh // ignore: cast_nullable_to_non_nullable
as String,turnoSugerido: freezed == turnoSugerido ? _self.turnoSugerido : turnoSugerido // ignore: cast_nullable_to_non_nullable
as TurnoSugerido?,apellidoPaterno: null == apellidoPaterno ? _self.apellidoPaterno : apellidoPaterno // ignore: cast_nullable_to_non_nullable
as String,apellidoMaterno: null == apellidoMaterno ? _self.apellidoMaterno : apellidoMaterno // ignore: cast_nullable_to_non_nullable
as String,nombres: null == nombres ? _self.nombres : nombres // ignore: cast_nullable_to_non_nullable
as String,fechaNacimiento: freezed == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime?,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,numeroSeguroSocial: null == numeroSeguroSocial ? _self.numeroSeguroSocial : numeroSeguroSocial // ignore: cast_nullable_to_non_nullable
as String,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,contactoEmergenciaNombre: null == contactoEmergenciaNombre ? _self.contactoEmergenciaNombre : contactoEmergenciaNombre // ignore: cast_nullable_to_non_nullable
as String,contactoEmergenciaTelefono: null == contactoEmergenciaTelefono ? _self.contactoEmergenciaTelefono : contactoEmergenciaTelefono // ignore: cast_nullable_to_non_nullable
as String,direccionCalle: null == direccionCalle ? _self.direccionCalle : direccionCalle // ignore: cast_nullable_to_non_nullable
as String,direccionNumero: null == direccionNumero ? _self.direccionNumero : direccionNumero // ignore: cast_nullable_to_non_nullable
as String,direccionFraccionamiento: null == direccionFraccionamiento ? _self.direccionFraccionamiento : direccionFraccionamiento // ignore: cast_nullable_to_non_nullable
as String,direccionCodigoPostal: null == direccionCodigoPostal ? _self.direccionCodigoPostal : direccionCodigoPostal // ignore: cast_nullable_to_non_nullable
as String,direccionMunicipio: null == direccionMunicipio ? _self.direccionMunicipio : direccionMunicipio // ignore: cast_nullable_to_non_nullable
as String,direccionEstado: null == direccionEstado ? _self.direccionEstado : direccionEstado // ignore: cast_nullable_to_non_nullable
as String,direccionPais: null == direccionPais ? _self.direccionPais : direccionPais // ignore: cast_nullable_to_non_nullable
as String,nacionalidad: null == nacionalidad ? _self.nacionalidad : nacionalidad // ignore: cast_nullable_to_non_nullable
as String,sexo: null == sexo ? _self.sexo : sexo // ignore: cast_nullable_to_non_nullable
as String,estadoCivil: null == estadoCivil ? _self.estadoCivil : estadoCivil // ignore: cast_nullable_to_non_nullable
as String,beneficiarios: null == beneficiarios ? _self._beneficiarios : beneficiarios // ignore: cast_nullable_to_non_nullable
as List<CandidatoBeneficiario>,salarioDiario: freezed == salarioDiario ? _self.salarioDiario : salarioDiario // ignore: cast_nullable_to_non_nullable
as double?,fechaIngreso: freezed == fechaIngreso ? _self.fechaIngreso : fechaIngreso // ignore: cast_nullable_to_non_nullable
as DateTime?,tipoContrato: null == tipoContrato ? _self.tipoContrato : tipoContrato // ignore: cast_nullable_to_non_nullable
as String,duracionDias: freezed == duracionDias ? _self.duracionDias : duracionDias // ignore: cast_nullable_to_non_nullable
as int?,tipoJornada: null == tipoJornada ? _self.tipoJornada : tipoJornada // ignore: cast_nullable_to_non_nullable
as String,rotacionDetalle: null == rotacionDetalle ? _self.rotacionDetalle : rotacionDetalle // ignore: cast_nullable_to_non_nullable
as String,diasLaborados: null == diasLaborados ? _self.diasLaborados : diasLaborados // ignore: cast_nullable_to_non_nullable
as String,diaDescanso: null == diaDescanso ? _self.diaDescanso : diaDescanso // ignore: cast_nullable_to_non_nullable
as String,horaEntrada: freezed == horaEntrada ? _self.horaEntrada : horaEntrada // ignore: cast_nullable_to_non_nullable
as String?,horaComidaInicio: freezed == horaComidaInicio ? _self.horaComidaInicio : horaComidaInicio // ignore: cast_nullable_to_non_nullable
as String?,horaComidaFin: freezed == horaComidaFin ? _self.horaComidaFin : horaComidaFin // ignore: cast_nullable_to_non_nullable
as String?,horaSalida: freezed == horaSalida ? _self.horaSalida : horaSalida // ignore: cast_nullable_to_non_nullable
as String?,formaPago: null == formaPago ? _self.formaPago : formaPago // ignore: cast_nullable_to_non_nullable
as String,modalidadPago: null == modalidadPago ? _self.modalidadPago : modalidadPago // ignore: cast_nullable_to_non_nullable
as String,bonoAsistencia: null == bonoAsistencia ? _self.bonoAsistencia : bonoAsistencia // ignore: cast_nullable_to_non_nullable
as String,bonoPuntualidad: null == bonoPuntualidad ? _self.bonoPuntualidad : bonoPuntualidad // ignore: cast_nullable_to_non_nullable
as String,valesDespensaMonedero: freezed == valesDespensaMonedero ? _self.valesDespensaMonedero : valesDespensaMonedero // ignore: cast_nullable_to_non_nullable
as bool?,percibeComisiones: freezed == percibeComisiones ? _self.percibeComisiones : percibeComisiones // ignore: cast_nullable_to_non_nullable
as bool?,comisionesDetalle: null == comisionesDetalle ? _self.comisionesDetalle : comisionesDetalle // ignore: cast_nullable_to_non_nullable
as String,herramientas: null == herramientas ? _self.herramientas : herramientas // ignore: cast_nullable_to_non_nullable
as String,entregaEquipo: null == entregaEquipo ? _self.entregaEquipo : entregaEquipo // ignore: cast_nullable_to_non_nullable
as bool,montoRetencionInfonavit: freezed == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double?,equiposEntregados: null == equiposEntregados ? _self._equiposEntregados : equiposEntregados // ignore: cast_nullable_to_non_nullable
as List<CandidatoEquipo>,contratoSolicitadoEn: freezed == contratoSolicitadoEn ? _self.contratoSolicitadoEn : contratoSolicitadoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,empleado: freezed == empleado ? _self.empleado : empleado // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of CandidatoDetalle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TurnoSugeridoCopyWith<$Res>? get turnoSugerido {
    if (_self.turnoSugerido == null) {
    return null;
  }

  return $TurnoSugeridoCopyWith<$Res>(_self.turnoSugerido!, (value) {
    return _then(_self.copyWith(turnoSugerido: value));
  });
}
}

// dart format on

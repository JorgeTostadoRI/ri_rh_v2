// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'empleado.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Empleado implements DiagnosticableTreeMixin {

 int? get id; int get usuario;@JsonKey(name: 'nombre_completo') String get nombre; DateTime get fechaNacimiento; Escolaridad get escolaridad; String get clabeInterbancaria; String get numeroContacto; String get contactoEmergencia; String get rfc; String get curp; String get numeroSeguroSocial; String get direccionCompleta; double get montoRetencionInfonavit; int get puesto; EmpleadoEstatus get estatus; double get salarioDiario; int? get antiguedad; int? get diasVacaciones; DateTime? get fechaAlta; DateTime? get fechaBaja; String? get identificacionOficial; String? get actaNacimiento; String? get constanciaEstudio; String? get estadoCuenta; String? get constanciaSituacionFiscal; String? get pdfCurp; String? get comprobanteNss; String? get altaImss; String? get comprobanteDomicilio; String? get avisoRetencionInfonavit; String? get cartaRecomendacion1; String? get cartaRecomendacion2; String? get cartaRecomendacion3; String? get cartaNoAntecedentesPenales; String? get contratoLaboral; String? get curriculumVitae; String? get cartaOferta; String? get examenMedico; String? get cartaRenuncia; String? get finiquitoFirmado; String? get bajaImss; String? get comprobanteTransferenciaFiniquito;
/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmpleadoCopyWith<Empleado> get copyWith => _$EmpleadoCopyWithImpl<Empleado>(this as Empleado, _$identity);

  /// Serializes this Empleado to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Empleado'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('usuario', usuario))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('fechaNacimiento', fechaNacimiento))..add(DiagnosticsProperty('escolaridad', escolaridad))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('numeroSeguroSocial', numeroSeguroSocial))..add(DiagnosticsProperty('direccionCompleta', direccionCompleta))..add(DiagnosticsProperty('montoRetencionInfonavit', montoRetencionInfonavit))..add(DiagnosticsProperty('puesto', puesto))..add(DiagnosticsProperty('estatus', estatus))..add(DiagnosticsProperty('salarioDiario', salarioDiario))..add(DiagnosticsProperty('antiguedad', antiguedad))..add(DiagnosticsProperty('diasVacaciones', diasVacaciones))..add(DiagnosticsProperty('fechaAlta', fechaAlta))..add(DiagnosticsProperty('fechaBaja', fechaBaja))..add(DiagnosticsProperty('identificacionOficial', identificacionOficial))..add(DiagnosticsProperty('actaNacimiento', actaNacimiento))..add(DiagnosticsProperty('constanciaEstudio', constanciaEstudio))..add(DiagnosticsProperty('estadoCuenta', estadoCuenta))..add(DiagnosticsProperty('constanciaSituacionFiscal', constanciaSituacionFiscal))..add(DiagnosticsProperty('pdfCurp', pdfCurp))..add(DiagnosticsProperty('comprobanteNss', comprobanteNss))..add(DiagnosticsProperty('altaImss', altaImss))..add(DiagnosticsProperty('comprobanteDomicilio', comprobanteDomicilio))..add(DiagnosticsProperty('avisoRetencionInfonavit', avisoRetencionInfonavit))..add(DiagnosticsProperty('cartaRecomendacion1', cartaRecomendacion1))..add(DiagnosticsProperty('cartaRecomendacion2', cartaRecomendacion2))..add(DiagnosticsProperty('cartaRecomendacion3', cartaRecomendacion3))..add(DiagnosticsProperty('cartaNoAntecedentesPenales', cartaNoAntecedentesPenales))..add(DiagnosticsProperty('contratoLaboral', contratoLaboral))..add(DiagnosticsProperty('curriculumVitae', curriculumVitae))..add(DiagnosticsProperty('cartaOferta', cartaOferta))..add(DiagnosticsProperty('examenMedico', examenMedico))..add(DiagnosticsProperty('cartaRenuncia', cartaRenuncia))..add(DiagnosticsProperty('finiquitoFirmado', finiquitoFirmado))..add(DiagnosticsProperty('bajaImss', bajaImss))..add(DiagnosticsProperty('comprobanteTransferenciaFiniquito', comprobanteTransferenciaFiniquito));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Empleado&&(identical(other.id, id) || other.id == id)&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.numeroSeguroSocial, numeroSeguroSocial) || other.numeroSeguroSocial == numeroSeguroSocial)&&(identical(other.direccionCompleta, direccionCompleta) || other.direccionCompleta == direccionCompleta)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&(identical(other.puesto, puesto) || other.puesto == puesto)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.salarioDiario, salarioDiario) || other.salarioDiario == salarioDiario)&&(identical(other.antiguedad, antiguedad) || other.antiguedad == antiguedad)&&(identical(other.diasVacaciones, diasVacaciones) || other.diasVacaciones == diasVacaciones)&&(identical(other.fechaAlta, fechaAlta) || other.fechaAlta == fechaAlta)&&(identical(other.fechaBaja, fechaBaja) || other.fechaBaja == fechaBaja)&&(identical(other.identificacionOficial, identificacionOficial) || other.identificacionOficial == identificacionOficial)&&(identical(other.actaNacimiento, actaNacimiento) || other.actaNacimiento == actaNacimiento)&&(identical(other.constanciaEstudio, constanciaEstudio) || other.constanciaEstudio == constanciaEstudio)&&(identical(other.estadoCuenta, estadoCuenta) || other.estadoCuenta == estadoCuenta)&&(identical(other.constanciaSituacionFiscal, constanciaSituacionFiscal) || other.constanciaSituacionFiscal == constanciaSituacionFiscal)&&(identical(other.pdfCurp, pdfCurp) || other.pdfCurp == pdfCurp)&&(identical(other.comprobanteNss, comprobanteNss) || other.comprobanteNss == comprobanteNss)&&(identical(other.altaImss, altaImss) || other.altaImss == altaImss)&&(identical(other.comprobanteDomicilio, comprobanteDomicilio) || other.comprobanteDomicilio == comprobanteDomicilio)&&(identical(other.avisoRetencionInfonavit, avisoRetencionInfonavit) || other.avisoRetencionInfonavit == avisoRetencionInfonavit)&&(identical(other.cartaRecomendacion1, cartaRecomendacion1) || other.cartaRecomendacion1 == cartaRecomendacion1)&&(identical(other.cartaRecomendacion2, cartaRecomendacion2) || other.cartaRecomendacion2 == cartaRecomendacion2)&&(identical(other.cartaRecomendacion3, cartaRecomendacion3) || other.cartaRecomendacion3 == cartaRecomendacion3)&&(identical(other.cartaNoAntecedentesPenales, cartaNoAntecedentesPenales) || other.cartaNoAntecedentesPenales == cartaNoAntecedentesPenales)&&(identical(other.contratoLaboral, contratoLaboral) || other.contratoLaboral == contratoLaboral)&&(identical(other.curriculumVitae, curriculumVitae) || other.curriculumVitae == curriculumVitae)&&(identical(other.cartaOferta, cartaOferta) || other.cartaOferta == cartaOferta)&&(identical(other.examenMedico, examenMedico) || other.examenMedico == examenMedico)&&(identical(other.cartaRenuncia, cartaRenuncia) || other.cartaRenuncia == cartaRenuncia)&&(identical(other.finiquitoFirmado, finiquitoFirmado) || other.finiquitoFirmado == finiquitoFirmado)&&(identical(other.bajaImss, bajaImss) || other.bajaImss == bajaImss)&&(identical(other.comprobanteTransferenciaFiniquito, comprobanteTransferenciaFiniquito) || other.comprobanteTransferenciaFiniquito == comprobanteTransferenciaFiniquito));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,usuario,nombre,fechaNacimiento,escolaridad,clabeInterbancaria,numeroContacto,contactoEmergencia,rfc,curp,numeroSeguroSocial,direccionCompleta,montoRetencionInfonavit,puesto,estatus,salarioDiario,antiguedad,diasVacaciones,fechaAlta,fechaBaja,identificacionOficial,actaNacimiento,constanciaEstudio,estadoCuenta,constanciaSituacionFiscal,pdfCurp,comprobanteNss,altaImss,comprobanteDomicilio,avisoRetencionInfonavit,cartaRecomendacion1,cartaRecomendacion2,cartaRecomendacion3,cartaNoAntecedentesPenales,contratoLaboral,curriculumVitae,cartaOferta,examenMedico,cartaRenuncia,finiquitoFirmado,bajaImss,comprobanteTransferenciaFiniquito]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Empleado(id: $id, usuario: $usuario, nombre: $nombre, fechaNacimiento: $fechaNacimiento, escolaridad: $escolaridad, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, rfc: $rfc, curp: $curp, numeroSeguroSocial: $numeroSeguroSocial, direccionCompleta: $direccionCompleta, montoRetencionInfonavit: $montoRetencionInfonavit, puesto: $puesto, estatus: $estatus, salarioDiario: $salarioDiario, antiguedad: $antiguedad, diasVacaciones: $diasVacaciones, fechaAlta: $fechaAlta, fechaBaja: $fechaBaja, identificacionOficial: $identificacionOficial, actaNacimiento: $actaNacimiento, constanciaEstudio: $constanciaEstudio, estadoCuenta: $estadoCuenta, constanciaSituacionFiscal: $constanciaSituacionFiscal, pdfCurp: $pdfCurp, comprobanteNss: $comprobanteNss, altaImss: $altaImss, comprobanteDomicilio: $comprobanteDomicilio, avisoRetencionInfonavit: $avisoRetencionInfonavit, cartaRecomendacion1: $cartaRecomendacion1, cartaRecomendacion2: $cartaRecomendacion2, cartaRecomendacion3: $cartaRecomendacion3, cartaNoAntecedentesPenales: $cartaNoAntecedentesPenales, contratoLaboral: $contratoLaboral, curriculumVitae: $curriculumVitae, cartaOferta: $cartaOferta, examenMedico: $examenMedico, cartaRenuncia: $cartaRenuncia, finiquitoFirmado: $finiquitoFirmado, bajaImss: $bajaImss, comprobanteTransferenciaFiniquito: $comprobanteTransferenciaFiniquito)';
}


}

/// @nodoc
abstract mixin class $EmpleadoCopyWith<$Res>  {
  factory $EmpleadoCopyWith(Empleado value, $Res Function(Empleado) _then) = _$EmpleadoCopyWithImpl;
@useResult
$Res call({
 int? id, int usuario,@JsonKey(name: 'nombre_completo') String nombre, DateTime fechaNacimiento, Escolaridad escolaridad, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String rfc, String curp, String numeroSeguroSocial, String direccionCompleta, double montoRetencionInfonavit, int puesto, EmpleadoEstatus estatus, double salarioDiario, int? antiguedad, int? diasVacaciones, DateTime? fechaAlta, DateTime? fechaBaja, String? identificacionOficial, String? actaNacimiento, String? constanciaEstudio, String? estadoCuenta, String? constanciaSituacionFiscal, String? pdfCurp, String? comprobanteNss, String? altaImss, String? comprobanteDomicilio, String? avisoRetencionInfonavit, String? cartaRecomendacion1, String? cartaRecomendacion2, String? cartaRecomendacion3, String? cartaNoAntecedentesPenales, String? contratoLaboral, String? curriculumVitae, String? cartaOferta, String? examenMedico, String? cartaRenuncia, String? finiquitoFirmado, String? bajaImss, String? comprobanteTransferenciaFiniquito
});




}
/// @nodoc
class _$EmpleadoCopyWithImpl<$Res>
    implements $EmpleadoCopyWith<$Res> {
  _$EmpleadoCopyWithImpl(this._self, this._then);

  final Empleado _self;
  final $Res Function(Empleado) _then;

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? usuario = null,Object? nombre = null,Object? fechaNacimiento = null,Object? escolaridad = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? rfc = null,Object? curp = null,Object? numeroSeguroSocial = null,Object? direccionCompleta = null,Object? montoRetencionInfonavit = null,Object? puesto = null,Object? estatus = null,Object? salarioDiario = null,Object? antiguedad = freezed,Object? diasVacaciones = freezed,Object? fechaAlta = freezed,Object? fechaBaja = freezed,Object? identificacionOficial = freezed,Object? actaNacimiento = freezed,Object? constanciaEstudio = freezed,Object? estadoCuenta = freezed,Object? constanciaSituacionFiscal = freezed,Object? pdfCurp = freezed,Object? comprobanteNss = freezed,Object? altaImss = freezed,Object? comprobanteDomicilio = freezed,Object? avisoRetencionInfonavit = freezed,Object? cartaRecomendacion1 = freezed,Object? cartaRecomendacion2 = freezed,Object? cartaRecomendacion3 = freezed,Object? cartaNoAntecedentesPenales = freezed,Object? contratoLaboral = freezed,Object? curriculumVitae = freezed,Object? cartaOferta = freezed,Object? examenMedico = freezed,Object? cartaRenuncia = freezed,Object? finiquitoFirmado = freezed,Object? bajaImss = freezed,Object? comprobanteTransferenciaFiniquito = freezed,}) {
  return _then(Empleado(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,fechaNacimiento: null == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as Escolaridad,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,numeroSeguroSocial: null == numeroSeguroSocial ? _self.numeroSeguroSocial : numeroSeguroSocial // ignore: cast_nullable_to_non_nullable
as String,direccionCompleta: null == direccionCompleta ? _self.direccionCompleta : direccionCompleta // ignore: cast_nullable_to_non_nullable
as String,montoRetencionInfonavit: null == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double,puesto: null == puesto ? _self.puesto : puesto // ignore: cast_nullable_to_non_nullable
as int,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EmpleadoEstatus,salarioDiario: null == salarioDiario ? _self.salarioDiario : salarioDiario // ignore: cast_nullable_to_non_nullable
as double,antiguedad: freezed == antiguedad ? _self.antiguedad : antiguedad // ignore: cast_nullable_to_non_nullable
as int?,diasVacaciones: freezed == diasVacaciones ? _self.diasVacaciones : diasVacaciones // ignore: cast_nullable_to_non_nullable
as int?,fechaAlta: freezed == fechaAlta ? _self.fechaAlta : fechaAlta // ignore: cast_nullable_to_non_nullable
as DateTime?,fechaBaja: freezed == fechaBaja ? _self.fechaBaja : fechaBaja // ignore: cast_nullable_to_non_nullable
as DateTime?,identificacionOficial: freezed == identificacionOficial ? _self.identificacionOficial : identificacionOficial // ignore: cast_nullable_to_non_nullable
as String?,actaNacimiento: freezed == actaNacimiento ? _self.actaNacimiento : actaNacimiento // ignore: cast_nullable_to_non_nullable
as String?,constanciaEstudio: freezed == constanciaEstudio ? _self.constanciaEstudio : constanciaEstudio // ignore: cast_nullable_to_non_nullable
as String?,estadoCuenta: freezed == estadoCuenta ? _self.estadoCuenta : estadoCuenta // ignore: cast_nullable_to_non_nullable
as String?,constanciaSituacionFiscal: freezed == constanciaSituacionFiscal ? _self.constanciaSituacionFiscal : constanciaSituacionFiscal // ignore: cast_nullable_to_non_nullable
as String?,pdfCurp: freezed == pdfCurp ? _self.pdfCurp : pdfCurp // ignore: cast_nullable_to_non_nullable
as String?,comprobanteNss: freezed == comprobanteNss ? _self.comprobanteNss : comprobanteNss // ignore: cast_nullable_to_non_nullable
as String?,altaImss: freezed == altaImss ? _self.altaImss : altaImss // ignore: cast_nullable_to_non_nullable
as String?,comprobanteDomicilio: freezed == comprobanteDomicilio ? _self.comprobanteDomicilio : comprobanteDomicilio // ignore: cast_nullable_to_non_nullable
as String?,avisoRetencionInfonavit: freezed == avisoRetencionInfonavit ? _self.avisoRetencionInfonavit : avisoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion1: freezed == cartaRecomendacion1 ? _self.cartaRecomendacion1 : cartaRecomendacion1 // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion2: freezed == cartaRecomendacion2 ? _self.cartaRecomendacion2 : cartaRecomendacion2 // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion3: freezed == cartaRecomendacion3 ? _self.cartaRecomendacion3 : cartaRecomendacion3 // ignore: cast_nullable_to_non_nullable
as String?,cartaNoAntecedentesPenales: freezed == cartaNoAntecedentesPenales ? _self.cartaNoAntecedentesPenales : cartaNoAntecedentesPenales // ignore: cast_nullable_to_non_nullable
as String?,contratoLaboral: freezed == contratoLaboral ? _self.contratoLaboral : contratoLaboral // ignore: cast_nullable_to_non_nullable
as String?,curriculumVitae: freezed == curriculumVitae ? _self.curriculumVitae : curriculumVitae // ignore: cast_nullable_to_non_nullable
as String?,cartaOferta: freezed == cartaOferta ? _self.cartaOferta : cartaOferta // ignore: cast_nullable_to_non_nullable
as String?,examenMedico: freezed == examenMedico ? _self.examenMedico : examenMedico // ignore: cast_nullable_to_non_nullable
as String?,cartaRenuncia: freezed == cartaRenuncia ? _self.cartaRenuncia : cartaRenuncia // ignore: cast_nullable_to_non_nullable
as String?,finiquitoFirmado: freezed == finiquitoFirmado ? _self.finiquitoFirmado : finiquitoFirmado // ignore: cast_nullable_to_non_nullable
as String?,bajaImss: freezed == bajaImss ? _self.bajaImss : bajaImss // ignore: cast_nullable_to_non_nullable
as String?,comprobanteTransferenciaFiniquito: freezed == comprobanteTransferenciaFiniquito ? _self.comprobanteTransferenciaFiniquito : comprobanteTransferenciaFiniquito // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Empleado].
extension EmpleadoPatterns on Empleado {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Empleado value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Empleado() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Empleado value)  $default,){
final _that = this;
switch (_that) {
case _Empleado():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Empleado value)?  $default,){
final _that = this;
switch (_that) {
case _Empleado() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int usuario, @JsonKey(name: 'nombre_completo')  String nombre,  DateTime fechaNacimiento,  Escolaridad escolaridad,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp,  String numeroSeguroSocial,  String direccionCompleta,  double montoRetencionInfonavit,  int puesto,  EmpleadoEstatus estatus,  double salarioDiario,  int? antiguedad,  int? diasVacaciones,  DateTime? fechaAlta,  DateTime? fechaBaja,  String? identificacionOficial,  String? actaNacimiento,  String? constanciaEstudio,  String? estadoCuenta,  String? constanciaSituacionFiscal,  String? pdfCurp,  String? comprobanteNss,  String? altaImss,  String? comprobanteDomicilio,  String? avisoRetencionInfonavit,  String? cartaRecomendacion1,  String? cartaRecomendacion2,  String? cartaRecomendacion3,  String? cartaNoAntecedentesPenales,  String? contratoLaboral,  String? curriculumVitae,  String? cartaOferta,  String? examenMedico,  String? cartaRenuncia,  String? finiquitoFirmado,  String? bajaImss,  String? comprobanteTransferenciaFiniquito)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Empleado() when $default != null:
return $default(_that.id,_that.usuario,_that.nombre,_that.fechaNacimiento,_that.escolaridad,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.numeroSeguroSocial,_that.direccionCompleta,_that.montoRetencionInfonavit,_that.puesto,_that.estatus,_that.salarioDiario,_that.antiguedad,_that.diasVacaciones,_that.fechaAlta,_that.fechaBaja,_that.identificacionOficial,_that.actaNacimiento,_that.constanciaEstudio,_that.estadoCuenta,_that.constanciaSituacionFiscal,_that.pdfCurp,_that.comprobanteNss,_that.altaImss,_that.comprobanteDomicilio,_that.avisoRetencionInfonavit,_that.cartaRecomendacion1,_that.cartaRecomendacion2,_that.cartaRecomendacion3,_that.cartaNoAntecedentesPenales,_that.contratoLaboral,_that.curriculumVitae,_that.cartaOferta,_that.examenMedico,_that.cartaRenuncia,_that.finiquitoFirmado,_that.bajaImss,_that.comprobanteTransferenciaFiniquito);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int usuario, @JsonKey(name: 'nombre_completo')  String nombre,  DateTime fechaNacimiento,  Escolaridad escolaridad,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp,  String numeroSeguroSocial,  String direccionCompleta,  double montoRetencionInfonavit,  int puesto,  EmpleadoEstatus estatus,  double salarioDiario,  int? antiguedad,  int? diasVacaciones,  DateTime? fechaAlta,  DateTime? fechaBaja,  String? identificacionOficial,  String? actaNacimiento,  String? constanciaEstudio,  String? estadoCuenta,  String? constanciaSituacionFiscal,  String? pdfCurp,  String? comprobanteNss,  String? altaImss,  String? comprobanteDomicilio,  String? avisoRetencionInfonavit,  String? cartaRecomendacion1,  String? cartaRecomendacion2,  String? cartaRecomendacion3,  String? cartaNoAntecedentesPenales,  String? contratoLaboral,  String? curriculumVitae,  String? cartaOferta,  String? examenMedico,  String? cartaRenuncia,  String? finiquitoFirmado,  String? bajaImss,  String? comprobanteTransferenciaFiniquito)  $default,) {final _that = this;
switch (_that) {
case _Empleado():
return $default(_that.id,_that.usuario,_that.nombre,_that.fechaNacimiento,_that.escolaridad,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.numeroSeguroSocial,_that.direccionCompleta,_that.montoRetencionInfonavit,_that.puesto,_that.estatus,_that.salarioDiario,_that.antiguedad,_that.diasVacaciones,_that.fechaAlta,_that.fechaBaja,_that.identificacionOficial,_that.actaNacimiento,_that.constanciaEstudio,_that.estadoCuenta,_that.constanciaSituacionFiscal,_that.pdfCurp,_that.comprobanteNss,_that.altaImss,_that.comprobanteDomicilio,_that.avisoRetencionInfonavit,_that.cartaRecomendacion1,_that.cartaRecomendacion2,_that.cartaRecomendacion3,_that.cartaNoAntecedentesPenales,_that.contratoLaboral,_that.curriculumVitae,_that.cartaOferta,_that.examenMedico,_that.cartaRenuncia,_that.finiquitoFirmado,_that.bajaImss,_that.comprobanteTransferenciaFiniquito);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int usuario, @JsonKey(name: 'nombre_completo')  String nombre,  DateTime fechaNacimiento,  Escolaridad escolaridad,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp,  String numeroSeguroSocial,  String direccionCompleta,  double montoRetencionInfonavit,  int puesto,  EmpleadoEstatus estatus,  double salarioDiario,  int? antiguedad,  int? diasVacaciones,  DateTime? fechaAlta,  DateTime? fechaBaja,  String? identificacionOficial,  String? actaNacimiento,  String? constanciaEstudio,  String? estadoCuenta,  String? constanciaSituacionFiscal,  String? pdfCurp,  String? comprobanteNss,  String? altaImss,  String? comprobanteDomicilio,  String? avisoRetencionInfonavit,  String? cartaRecomendacion1,  String? cartaRecomendacion2,  String? cartaRecomendacion3,  String? cartaNoAntecedentesPenales,  String? contratoLaboral,  String? curriculumVitae,  String? cartaOferta,  String? examenMedico,  String? cartaRenuncia,  String? finiquitoFirmado,  String? bajaImss,  String? comprobanteTransferenciaFiniquito)?  $default,) {final _that = this;
switch (_that) {
case _Empleado() when $default != null:
return $default(_that.id,_that.usuario,_that.nombre,_that.fechaNacimiento,_that.escolaridad,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.numeroSeguroSocial,_that.direccionCompleta,_that.montoRetencionInfonavit,_that.puesto,_that.estatus,_that.salarioDiario,_that.antiguedad,_that.diasVacaciones,_that.fechaAlta,_that.fechaBaja,_that.identificacionOficial,_that.actaNacimiento,_that.constanciaEstudio,_that.estadoCuenta,_that.constanciaSituacionFiscal,_that.pdfCurp,_that.comprobanteNss,_that.altaImss,_that.comprobanteDomicilio,_that.avisoRetencionInfonavit,_that.cartaRecomendacion1,_that.cartaRecomendacion2,_that.cartaRecomendacion3,_that.cartaNoAntecedentesPenales,_that.contratoLaboral,_that.curriculumVitae,_that.cartaOferta,_that.examenMedico,_that.cartaRenuncia,_that.finiquitoFirmado,_that.bajaImss,_that.comprobanteTransferenciaFiniquito);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Empleado with DiagnosticableTreeMixin implements Empleado {
  const _Empleado({this.id, required this.usuario, @JsonKey(name: 'nombre_completo') required this.nombre, required this.fechaNacimiento, required this.escolaridad, required this.clabeInterbancaria, required this.numeroContacto, required this.contactoEmergencia, required this.rfc, required this.curp, required this.numeroSeguroSocial, required this.direccionCompleta, required this.montoRetencionInfonavit, required this.puesto, required this.estatus, required this.salarioDiario, this.antiguedad, this.diasVacaciones, this.fechaAlta, this.fechaBaja, this.identificacionOficial, this.actaNacimiento, this.constanciaEstudio, this.estadoCuenta, this.constanciaSituacionFiscal, this.pdfCurp, this.comprobanteNss, this.altaImss, this.comprobanteDomicilio, this.avisoRetencionInfonavit, this.cartaRecomendacion1, this.cartaRecomendacion2, this.cartaRecomendacion3, this.cartaNoAntecedentesPenales, this.contratoLaboral, this.curriculumVitae, this.cartaOferta, this.examenMedico, this.cartaRenuncia, this.finiquitoFirmado, this.bajaImss, this.comprobanteTransferenciaFiniquito});
  factory _Empleado.fromJson(Map<String, dynamic> json) => _$EmpleadoFromJson(json);

@override final  int? id;
@override final  int usuario;
@override@JsonKey(name: 'nombre_completo') final  String nombre;
@override final  DateTime fechaNacimiento;
@override final  Escolaridad escolaridad;
@override final  String clabeInterbancaria;
@override final  String numeroContacto;
@override final  String contactoEmergencia;
@override final  String rfc;
@override final  String curp;
@override final  String numeroSeguroSocial;
@override final  String direccionCompleta;
@override final  double montoRetencionInfonavit;
@override final  int puesto;
@override final  EmpleadoEstatus estatus;
@override final  double salarioDiario;
@override final  int? antiguedad;
@override final  int? diasVacaciones;
@override final  DateTime? fechaAlta;
@override final  DateTime? fechaBaja;
@override final  String? identificacionOficial;
@override final  String? actaNacimiento;
@override final  String? constanciaEstudio;
@override final  String? estadoCuenta;
@override final  String? constanciaSituacionFiscal;
@override final  String? pdfCurp;
@override final  String? comprobanteNss;
@override final  String? altaImss;
@override final  String? comprobanteDomicilio;
@override final  String? avisoRetencionInfonavit;
@override final  String? cartaRecomendacion1;
@override final  String? cartaRecomendacion2;
@override final  String? cartaRecomendacion3;
@override final  String? cartaNoAntecedentesPenales;
@override final  String? contratoLaboral;
@override final  String? curriculumVitae;
@override final  String? cartaOferta;
@override final  String? examenMedico;
@override final  String? cartaRenuncia;
@override final  String? finiquitoFirmado;
@override final  String? bajaImss;
@override final  String? comprobanteTransferenciaFiniquito;

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmpleadoCopyWith<_Empleado> get copyWith => __$EmpleadoCopyWithImpl<_Empleado>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmpleadoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Empleado'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('usuario', usuario))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('fechaNacimiento', fechaNacimiento))..add(DiagnosticsProperty('escolaridad', escolaridad))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('numeroSeguroSocial', numeroSeguroSocial))..add(DiagnosticsProperty('direccionCompleta', direccionCompleta))..add(DiagnosticsProperty('montoRetencionInfonavit', montoRetencionInfonavit))..add(DiagnosticsProperty('puesto', puesto))..add(DiagnosticsProperty('estatus', estatus))..add(DiagnosticsProperty('salarioDiario', salarioDiario))..add(DiagnosticsProperty('antiguedad', antiguedad))..add(DiagnosticsProperty('diasVacaciones', diasVacaciones))..add(DiagnosticsProperty('fechaAlta', fechaAlta))..add(DiagnosticsProperty('fechaBaja', fechaBaja))..add(DiagnosticsProperty('identificacionOficial', identificacionOficial))..add(DiagnosticsProperty('actaNacimiento', actaNacimiento))..add(DiagnosticsProperty('constanciaEstudio', constanciaEstudio))..add(DiagnosticsProperty('estadoCuenta', estadoCuenta))..add(DiagnosticsProperty('constanciaSituacionFiscal', constanciaSituacionFiscal))..add(DiagnosticsProperty('pdfCurp', pdfCurp))..add(DiagnosticsProperty('comprobanteNss', comprobanteNss))..add(DiagnosticsProperty('altaImss', altaImss))..add(DiagnosticsProperty('comprobanteDomicilio', comprobanteDomicilio))..add(DiagnosticsProperty('avisoRetencionInfonavit', avisoRetencionInfonavit))..add(DiagnosticsProperty('cartaRecomendacion1', cartaRecomendacion1))..add(DiagnosticsProperty('cartaRecomendacion2', cartaRecomendacion2))..add(DiagnosticsProperty('cartaRecomendacion3', cartaRecomendacion3))..add(DiagnosticsProperty('cartaNoAntecedentesPenales', cartaNoAntecedentesPenales))..add(DiagnosticsProperty('contratoLaboral', contratoLaboral))..add(DiagnosticsProperty('curriculumVitae', curriculumVitae))..add(DiagnosticsProperty('cartaOferta', cartaOferta))..add(DiagnosticsProperty('examenMedico', examenMedico))..add(DiagnosticsProperty('cartaRenuncia', cartaRenuncia))..add(DiagnosticsProperty('finiquitoFirmado', finiquitoFirmado))..add(DiagnosticsProperty('bajaImss', bajaImss))..add(DiagnosticsProperty('comprobanteTransferenciaFiniquito', comprobanteTransferenciaFiniquito));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empleado&&(identical(other.id, id) || other.id == id)&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.numeroSeguroSocial, numeroSeguroSocial) || other.numeroSeguroSocial == numeroSeguroSocial)&&(identical(other.direccionCompleta, direccionCompleta) || other.direccionCompleta == direccionCompleta)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&(identical(other.puesto, puesto) || other.puesto == puesto)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.salarioDiario, salarioDiario) || other.salarioDiario == salarioDiario)&&(identical(other.antiguedad, antiguedad) || other.antiguedad == antiguedad)&&(identical(other.diasVacaciones, diasVacaciones) || other.diasVacaciones == diasVacaciones)&&(identical(other.fechaAlta, fechaAlta) || other.fechaAlta == fechaAlta)&&(identical(other.fechaBaja, fechaBaja) || other.fechaBaja == fechaBaja)&&(identical(other.identificacionOficial, identificacionOficial) || other.identificacionOficial == identificacionOficial)&&(identical(other.actaNacimiento, actaNacimiento) || other.actaNacimiento == actaNacimiento)&&(identical(other.constanciaEstudio, constanciaEstudio) || other.constanciaEstudio == constanciaEstudio)&&(identical(other.estadoCuenta, estadoCuenta) || other.estadoCuenta == estadoCuenta)&&(identical(other.constanciaSituacionFiscal, constanciaSituacionFiscal) || other.constanciaSituacionFiscal == constanciaSituacionFiscal)&&(identical(other.pdfCurp, pdfCurp) || other.pdfCurp == pdfCurp)&&(identical(other.comprobanteNss, comprobanteNss) || other.comprobanteNss == comprobanteNss)&&(identical(other.altaImss, altaImss) || other.altaImss == altaImss)&&(identical(other.comprobanteDomicilio, comprobanteDomicilio) || other.comprobanteDomicilio == comprobanteDomicilio)&&(identical(other.avisoRetencionInfonavit, avisoRetencionInfonavit) || other.avisoRetencionInfonavit == avisoRetencionInfonavit)&&(identical(other.cartaRecomendacion1, cartaRecomendacion1) || other.cartaRecomendacion1 == cartaRecomendacion1)&&(identical(other.cartaRecomendacion2, cartaRecomendacion2) || other.cartaRecomendacion2 == cartaRecomendacion2)&&(identical(other.cartaRecomendacion3, cartaRecomendacion3) || other.cartaRecomendacion3 == cartaRecomendacion3)&&(identical(other.cartaNoAntecedentesPenales, cartaNoAntecedentesPenales) || other.cartaNoAntecedentesPenales == cartaNoAntecedentesPenales)&&(identical(other.contratoLaboral, contratoLaboral) || other.contratoLaboral == contratoLaboral)&&(identical(other.curriculumVitae, curriculumVitae) || other.curriculumVitae == curriculumVitae)&&(identical(other.cartaOferta, cartaOferta) || other.cartaOferta == cartaOferta)&&(identical(other.examenMedico, examenMedico) || other.examenMedico == examenMedico)&&(identical(other.cartaRenuncia, cartaRenuncia) || other.cartaRenuncia == cartaRenuncia)&&(identical(other.finiquitoFirmado, finiquitoFirmado) || other.finiquitoFirmado == finiquitoFirmado)&&(identical(other.bajaImss, bajaImss) || other.bajaImss == bajaImss)&&(identical(other.comprobanteTransferenciaFiniquito, comprobanteTransferenciaFiniquito) || other.comprobanteTransferenciaFiniquito == comprobanteTransferenciaFiniquito));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,usuario,nombre,fechaNacimiento,escolaridad,clabeInterbancaria,numeroContacto,contactoEmergencia,rfc,curp,numeroSeguroSocial,direccionCompleta,montoRetencionInfonavit,puesto,estatus,salarioDiario,antiguedad,diasVacaciones,fechaAlta,fechaBaja,identificacionOficial,actaNacimiento,constanciaEstudio,estadoCuenta,constanciaSituacionFiscal,pdfCurp,comprobanteNss,altaImss,comprobanteDomicilio,avisoRetencionInfonavit,cartaRecomendacion1,cartaRecomendacion2,cartaRecomendacion3,cartaNoAntecedentesPenales,contratoLaboral,curriculumVitae,cartaOferta,examenMedico,cartaRenuncia,finiquitoFirmado,bajaImss,comprobanteTransferenciaFiniquito]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Empleado(id: $id, usuario: $usuario, nombre: $nombre, fechaNacimiento: $fechaNacimiento, escolaridad: $escolaridad, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, rfc: $rfc, curp: $curp, numeroSeguroSocial: $numeroSeguroSocial, direccionCompleta: $direccionCompleta, montoRetencionInfonavit: $montoRetencionInfonavit, puesto: $puesto, estatus: $estatus, salarioDiario: $salarioDiario, antiguedad: $antiguedad, diasVacaciones: $diasVacaciones, fechaAlta: $fechaAlta, fechaBaja: $fechaBaja, identificacionOficial: $identificacionOficial, actaNacimiento: $actaNacimiento, constanciaEstudio: $constanciaEstudio, estadoCuenta: $estadoCuenta, constanciaSituacionFiscal: $constanciaSituacionFiscal, pdfCurp: $pdfCurp, comprobanteNss: $comprobanteNss, altaImss: $altaImss, comprobanteDomicilio: $comprobanteDomicilio, avisoRetencionInfonavit: $avisoRetencionInfonavit, cartaRecomendacion1: $cartaRecomendacion1, cartaRecomendacion2: $cartaRecomendacion2, cartaRecomendacion3: $cartaRecomendacion3, cartaNoAntecedentesPenales: $cartaNoAntecedentesPenales, contratoLaboral: $contratoLaboral, curriculumVitae: $curriculumVitae, cartaOferta: $cartaOferta, examenMedico: $examenMedico, cartaRenuncia: $cartaRenuncia, finiquitoFirmado: $finiquitoFirmado, bajaImss: $bajaImss, comprobanteTransferenciaFiniquito: $comprobanteTransferenciaFiniquito)';
}


}

/// @nodoc
abstract mixin class _$EmpleadoCopyWith<$Res> implements $EmpleadoCopyWith<$Res> {
  factory _$EmpleadoCopyWith(_Empleado value, $Res Function(_Empleado) _then) = __$EmpleadoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int usuario,@JsonKey(name: 'nombre_completo') String nombre, DateTime fechaNacimiento, Escolaridad escolaridad, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String rfc, String curp, String numeroSeguroSocial, String direccionCompleta, double montoRetencionInfonavit, int puesto, EmpleadoEstatus estatus, double salarioDiario, int? antiguedad, int? diasVacaciones, DateTime? fechaAlta, DateTime? fechaBaja, String? identificacionOficial, String? actaNacimiento, String? constanciaEstudio, String? estadoCuenta, String? constanciaSituacionFiscal, String? pdfCurp, String? comprobanteNss, String? altaImss, String? comprobanteDomicilio, String? avisoRetencionInfonavit, String? cartaRecomendacion1, String? cartaRecomendacion2, String? cartaRecomendacion3, String? cartaNoAntecedentesPenales, String? contratoLaboral, String? curriculumVitae, String? cartaOferta, String? examenMedico, String? cartaRenuncia, String? finiquitoFirmado, String? bajaImss, String? comprobanteTransferenciaFiniquito
});




}
/// @nodoc
class __$EmpleadoCopyWithImpl<$Res>
    implements _$EmpleadoCopyWith<$Res> {
  __$EmpleadoCopyWithImpl(this._self, this._then);

  final _Empleado _self;
  final $Res Function(_Empleado) _then;

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? usuario = null,Object? nombre = null,Object? fechaNacimiento = null,Object? escolaridad = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? rfc = null,Object? curp = null,Object? numeroSeguroSocial = null,Object? direccionCompleta = null,Object? montoRetencionInfonavit = null,Object? puesto = null,Object? estatus = null,Object? salarioDiario = null,Object? antiguedad = freezed,Object? diasVacaciones = freezed,Object? fechaAlta = freezed,Object? fechaBaja = freezed,Object? identificacionOficial = freezed,Object? actaNacimiento = freezed,Object? constanciaEstudio = freezed,Object? estadoCuenta = freezed,Object? constanciaSituacionFiscal = freezed,Object? pdfCurp = freezed,Object? comprobanteNss = freezed,Object? altaImss = freezed,Object? comprobanteDomicilio = freezed,Object? avisoRetencionInfonavit = freezed,Object? cartaRecomendacion1 = freezed,Object? cartaRecomendacion2 = freezed,Object? cartaRecomendacion3 = freezed,Object? cartaNoAntecedentesPenales = freezed,Object? contratoLaboral = freezed,Object? curriculumVitae = freezed,Object? cartaOferta = freezed,Object? examenMedico = freezed,Object? cartaRenuncia = freezed,Object? finiquitoFirmado = freezed,Object? bajaImss = freezed,Object? comprobanteTransferenciaFiniquito = freezed,}) {
  return _then(_Empleado(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,fechaNacimiento: null == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as Escolaridad,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,numeroSeguroSocial: null == numeroSeguroSocial ? _self.numeroSeguroSocial : numeroSeguroSocial // ignore: cast_nullable_to_non_nullable
as String,direccionCompleta: null == direccionCompleta ? _self.direccionCompleta : direccionCompleta // ignore: cast_nullable_to_non_nullable
as String,montoRetencionInfonavit: null == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double,puesto: null == puesto ? _self.puesto : puesto // ignore: cast_nullable_to_non_nullable
as int,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EmpleadoEstatus,salarioDiario: null == salarioDiario ? _self.salarioDiario : salarioDiario // ignore: cast_nullable_to_non_nullable
as double,antiguedad: freezed == antiguedad ? _self.antiguedad : antiguedad // ignore: cast_nullable_to_non_nullable
as int?,diasVacaciones: freezed == diasVacaciones ? _self.diasVacaciones : diasVacaciones // ignore: cast_nullable_to_non_nullable
as int?,fechaAlta: freezed == fechaAlta ? _self.fechaAlta : fechaAlta // ignore: cast_nullable_to_non_nullable
as DateTime?,fechaBaja: freezed == fechaBaja ? _self.fechaBaja : fechaBaja // ignore: cast_nullable_to_non_nullable
as DateTime?,identificacionOficial: freezed == identificacionOficial ? _self.identificacionOficial : identificacionOficial // ignore: cast_nullable_to_non_nullable
as String?,actaNacimiento: freezed == actaNacimiento ? _self.actaNacimiento : actaNacimiento // ignore: cast_nullable_to_non_nullable
as String?,constanciaEstudio: freezed == constanciaEstudio ? _self.constanciaEstudio : constanciaEstudio // ignore: cast_nullable_to_non_nullable
as String?,estadoCuenta: freezed == estadoCuenta ? _self.estadoCuenta : estadoCuenta // ignore: cast_nullable_to_non_nullable
as String?,constanciaSituacionFiscal: freezed == constanciaSituacionFiscal ? _self.constanciaSituacionFiscal : constanciaSituacionFiscal // ignore: cast_nullable_to_non_nullable
as String?,pdfCurp: freezed == pdfCurp ? _self.pdfCurp : pdfCurp // ignore: cast_nullable_to_non_nullable
as String?,comprobanteNss: freezed == comprobanteNss ? _self.comprobanteNss : comprobanteNss // ignore: cast_nullable_to_non_nullable
as String?,altaImss: freezed == altaImss ? _self.altaImss : altaImss // ignore: cast_nullable_to_non_nullable
as String?,comprobanteDomicilio: freezed == comprobanteDomicilio ? _self.comprobanteDomicilio : comprobanteDomicilio // ignore: cast_nullable_to_non_nullable
as String?,avisoRetencionInfonavit: freezed == avisoRetencionInfonavit ? _self.avisoRetencionInfonavit : avisoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion1: freezed == cartaRecomendacion1 ? _self.cartaRecomendacion1 : cartaRecomendacion1 // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion2: freezed == cartaRecomendacion2 ? _self.cartaRecomendacion2 : cartaRecomendacion2 // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion3: freezed == cartaRecomendacion3 ? _self.cartaRecomendacion3 : cartaRecomendacion3 // ignore: cast_nullable_to_non_nullable
as String?,cartaNoAntecedentesPenales: freezed == cartaNoAntecedentesPenales ? _self.cartaNoAntecedentesPenales : cartaNoAntecedentesPenales // ignore: cast_nullable_to_non_nullable
as String?,contratoLaboral: freezed == contratoLaboral ? _self.contratoLaboral : contratoLaboral // ignore: cast_nullable_to_non_nullable
as String?,curriculumVitae: freezed == curriculumVitae ? _self.curriculumVitae : curriculumVitae // ignore: cast_nullable_to_non_nullable
as String?,cartaOferta: freezed == cartaOferta ? _self.cartaOferta : cartaOferta // ignore: cast_nullable_to_non_nullable
as String?,examenMedico: freezed == examenMedico ? _self.examenMedico : examenMedico // ignore: cast_nullable_to_non_nullable
as String?,cartaRenuncia: freezed == cartaRenuncia ? _self.cartaRenuncia : cartaRenuncia // ignore: cast_nullable_to_non_nullable
as String?,finiquitoFirmado: freezed == finiquitoFirmado ? _self.finiquitoFirmado : finiquitoFirmado // ignore: cast_nullable_to_non_nullable
as String?,bajaImss: freezed == bajaImss ? _self.bajaImss : bajaImss // ignore: cast_nullable_to_non_nullable
as String?,comprobanteTransferenciaFiniquito: freezed == comprobanteTransferenciaFiniquito ? _self.comprobanteTransferenciaFiniquito : comprobanteTransferenciaFiniquito // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

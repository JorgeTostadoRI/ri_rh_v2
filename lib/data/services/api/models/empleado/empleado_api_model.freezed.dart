// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'empleado_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmpleadoApiModel implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'usuario', defaultValue: 0) int get userRef;@JsonKey(name: 'jefe', defaultValue: 0) int get jefeRef;@JsonKey(name: 'nombre_completo') String get nombre; DateTime get fechaNacimiento; Escolaridad get escolaridad; String get clabeInterbancaria; String get numeroContacto; String get contactoEmergencia; String get rfc; String get curp;@JsonKey(name: 'numero_seguro_social') String get nss;@JsonKey(name: 'direccion_completa') String get direccion;@JsonKey(fromJson: _doubleFromJson) double get montoRetencionInfonavit;@JsonKey(name: 'puesto') int get puestoRef; EmpleadoEstatus get estatus;@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) double get salario; int? get antiguedad; int? get diasVacaciones; bool get hasSignature;@JsonKey(name: 'fecha_alta') DateTime? get registeredAt;@JsonKey(name: 'fecha_baja') DateTime? get terminatedAt;@JsonKey(name: 'identificacion_oficial') String? get ineUrl;@JsonKey(name: 'acta_nacimiento') String? get actaNacimientoUrl;@JsonKey(name: 'constancia_estudio') String? get constanciaEstudioUrl;@JsonKey(name: 'estado_cuenta') String? get estadoCuentaUrl;@JsonKey(name: 'constancia_situacion_fiscal') String? get constanciaSituacionFiscalUrl;@JsonKey(name: 'pdf_curp') String? get curpUrl;@JsonKey(name: 'comprobante_nss') String? get nssUrl;@JsonKey(name: 'alta_imss') String? get altaImssUrl;@JsonKey(name: 'comprobante_domicilio') String? get comprobanteDomicilioUrl;@JsonKey(name: 'aviso_retencion_infonavit') String? get avisoInfonavitUrl;@JsonKey(name: 'carta_recomendacion_1') String? get cartaRecomendacion1Url;@JsonKey(name: 'carta_recomendacion_2') String? get cartaRecomendacion2Url;@JsonKey(name: 'carta_recomendacion_3') String? get cartaRecomendacion3Url;@JsonKey(name: 'carta_no_antecedentes_penales') String? get cartaNoAntecedentesPenalesUrl;@JsonKey(name: 'contrato_laboral') String? get contratoLaboralUrl;@JsonKey(name: 'curriculum_vitae') String? get cvUrl;@JsonKey(name: 'carta_oferta') String? get cartaOfertaUrl;@JsonKey(name: 'examen_medico') String? get examenMedicoUrl;@JsonKey(name: 'carta_renuncia') String? get cartaRenunciaUrl;@JsonKey(name: 'finiquito_firmado') String? get finiquitoUrl;@JsonKey(name: 'baja_imss') String? get bajaImssUrl;@JsonKey(name: 'comprobante_transferencia_finiquito') String? get comprobanteFiniquitoUrl;
/// Create a copy of EmpleadoApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmpleadoApiModelCopyWith<EmpleadoApiModel> get copyWith => _$EmpleadoApiModelCopyWithImpl<EmpleadoApiModel>(this as EmpleadoApiModel, _$identity);

  /// Serializes this EmpleadoApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'EmpleadoApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userRef', userRef))..add(DiagnosticsProperty('jefeRef', jefeRef))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('fechaNacimiento', fechaNacimiento))..add(DiagnosticsProperty('escolaridad', escolaridad))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('nss', nss))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('montoRetencionInfonavit', montoRetencionInfonavit))..add(DiagnosticsProperty('puestoRef', puestoRef))..add(DiagnosticsProperty('estatus', estatus))..add(DiagnosticsProperty('salario', salario))..add(DiagnosticsProperty('antiguedad', antiguedad))..add(DiagnosticsProperty('diasVacaciones', diasVacaciones))..add(DiagnosticsProperty('hasSignature', hasSignature))..add(DiagnosticsProperty('registeredAt', registeredAt))..add(DiagnosticsProperty('terminatedAt', terminatedAt))..add(DiagnosticsProperty('ineUrl', ineUrl))..add(DiagnosticsProperty('actaNacimientoUrl', actaNacimientoUrl))..add(DiagnosticsProperty('constanciaEstudioUrl', constanciaEstudioUrl))..add(DiagnosticsProperty('estadoCuentaUrl', estadoCuentaUrl))..add(DiagnosticsProperty('constanciaSituacionFiscalUrl', constanciaSituacionFiscalUrl))..add(DiagnosticsProperty('curpUrl', curpUrl))..add(DiagnosticsProperty('nssUrl', nssUrl))..add(DiagnosticsProperty('altaImssUrl', altaImssUrl))..add(DiagnosticsProperty('comprobanteDomicilioUrl', comprobanteDomicilioUrl))..add(DiagnosticsProperty('avisoInfonavitUrl', avisoInfonavitUrl))..add(DiagnosticsProperty('cartaRecomendacion1Url', cartaRecomendacion1Url))..add(DiagnosticsProperty('cartaRecomendacion2Url', cartaRecomendacion2Url))..add(DiagnosticsProperty('cartaRecomendacion3Url', cartaRecomendacion3Url))..add(DiagnosticsProperty('cartaNoAntecedentesPenalesUrl', cartaNoAntecedentesPenalesUrl))..add(DiagnosticsProperty('contratoLaboralUrl', contratoLaboralUrl))..add(DiagnosticsProperty('cvUrl', cvUrl))..add(DiagnosticsProperty('cartaOfertaUrl', cartaOfertaUrl))..add(DiagnosticsProperty('examenMedicoUrl', examenMedicoUrl))..add(DiagnosticsProperty('cartaRenunciaUrl', cartaRenunciaUrl))..add(DiagnosticsProperty('finiquitoUrl', finiquitoUrl))..add(DiagnosticsProperty('bajaImssUrl', bajaImssUrl))..add(DiagnosticsProperty('comprobanteFiniquitoUrl', comprobanteFiniquitoUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmpleadoApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userRef, userRef) || other.userRef == userRef)&&(identical(other.jefeRef, jefeRef) || other.jefeRef == jefeRef)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.nss, nss) || other.nss == nss)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&(identical(other.puestoRef, puestoRef) || other.puestoRef == puestoRef)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.salario, salario) || other.salario == salario)&&(identical(other.antiguedad, antiguedad) || other.antiguedad == antiguedad)&&(identical(other.diasVacaciones, diasVacaciones) || other.diasVacaciones == diasVacaciones)&&(identical(other.hasSignature, hasSignature) || other.hasSignature == hasSignature)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.terminatedAt, terminatedAt) || other.terminatedAt == terminatedAt)&&(identical(other.ineUrl, ineUrl) || other.ineUrl == ineUrl)&&(identical(other.actaNacimientoUrl, actaNacimientoUrl) || other.actaNacimientoUrl == actaNacimientoUrl)&&(identical(other.constanciaEstudioUrl, constanciaEstudioUrl) || other.constanciaEstudioUrl == constanciaEstudioUrl)&&(identical(other.estadoCuentaUrl, estadoCuentaUrl) || other.estadoCuentaUrl == estadoCuentaUrl)&&(identical(other.constanciaSituacionFiscalUrl, constanciaSituacionFiscalUrl) || other.constanciaSituacionFiscalUrl == constanciaSituacionFiscalUrl)&&(identical(other.curpUrl, curpUrl) || other.curpUrl == curpUrl)&&(identical(other.nssUrl, nssUrl) || other.nssUrl == nssUrl)&&(identical(other.altaImssUrl, altaImssUrl) || other.altaImssUrl == altaImssUrl)&&(identical(other.comprobanteDomicilioUrl, comprobanteDomicilioUrl) || other.comprobanteDomicilioUrl == comprobanteDomicilioUrl)&&(identical(other.avisoInfonavitUrl, avisoInfonavitUrl) || other.avisoInfonavitUrl == avisoInfonavitUrl)&&(identical(other.cartaRecomendacion1Url, cartaRecomendacion1Url) || other.cartaRecomendacion1Url == cartaRecomendacion1Url)&&(identical(other.cartaRecomendacion2Url, cartaRecomendacion2Url) || other.cartaRecomendacion2Url == cartaRecomendacion2Url)&&(identical(other.cartaRecomendacion3Url, cartaRecomendacion3Url) || other.cartaRecomendacion3Url == cartaRecomendacion3Url)&&(identical(other.cartaNoAntecedentesPenalesUrl, cartaNoAntecedentesPenalesUrl) || other.cartaNoAntecedentesPenalesUrl == cartaNoAntecedentesPenalesUrl)&&(identical(other.contratoLaboralUrl, contratoLaboralUrl) || other.contratoLaboralUrl == contratoLaboralUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl)&&(identical(other.cartaOfertaUrl, cartaOfertaUrl) || other.cartaOfertaUrl == cartaOfertaUrl)&&(identical(other.examenMedicoUrl, examenMedicoUrl) || other.examenMedicoUrl == examenMedicoUrl)&&(identical(other.cartaRenunciaUrl, cartaRenunciaUrl) || other.cartaRenunciaUrl == cartaRenunciaUrl)&&(identical(other.finiquitoUrl, finiquitoUrl) || other.finiquitoUrl == finiquitoUrl)&&(identical(other.bajaImssUrl, bajaImssUrl) || other.bajaImssUrl == bajaImssUrl)&&(identical(other.comprobanteFiniquitoUrl, comprobanteFiniquitoUrl) || other.comprobanteFiniquitoUrl == comprobanteFiniquitoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userRef,jefeRef,nombre,fechaNacimiento,escolaridad,clabeInterbancaria,numeroContacto,contactoEmergencia,rfc,curp,nss,direccion,montoRetencionInfonavit,puestoRef,estatus,salario,antiguedad,diasVacaciones,hasSignature,registeredAt,terminatedAt,ineUrl,actaNacimientoUrl,constanciaEstudioUrl,estadoCuentaUrl,constanciaSituacionFiscalUrl,curpUrl,nssUrl,altaImssUrl,comprobanteDomicilioUrl,avisoInfonavitUrl,cartaRecomendacion1Url,cartaRecomendacion2Url,cartaRecomendacion3Url,cartaNoAntecedentesPenalesUrl,contratoLaboralUrl,cvUrl,cartaOfertaUrl,examenMedicoUrl,cartaRenunciaUrl,finiquitoUrl,bajaImssUrl,comprobanteFiniquitoUrl]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'EmpleadoApiModel(id: $id, userRef: $userRef, jefeRef: $jefeRef, nombre: $nombre, fechaNacimiento: $fechaNacimiento, escolaridad: $escolaridad, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, rfc: $rfc, curp: $curp, nss: $nss, direccion: $direccion, montoRetencionInfonavit: $montoRetencionInfonavit, puestoRef: $puestoRef, estatus: $estatus, salario: $salario, antiguedad: $antiguedad, diasVacaciones: $diasVacaciones, hasSignature: $hasSignature, registeredAt: $registeredAt, terminatedAt: $terminatedAt, ineUrl: $ineUrl, actaNacimientoUrl: $actaNacimientoUrl, constanciaEstudioUrl: $constanciaEstudioUrl, estadoCuentaUrl: $estadoCuentaUrl, constanciaSituacionFiscalUrl: $constanciaSituacionFiscalUrl, curpUrl: $curpUrl, nssUrl: $nssUrl, altaImssUrl: $altaImssUrl, comprobanteDomicilioUrl: $comprobanteDomicilioUrl, avisoInfonavitUrl: $avisoInfonavitUrl, cartaRecomendacion1Url: $cartaRecomendacion1Url, cartaRecomendacion2Url: $cartaRecomendacion2Url, cartaRecomendacion3Url: $cartaRecomendacion3Url, cartaNoAntecedentesPenalesUrl: $cartaNoAntecedentesPenalesUrl, contratoLaboralUrl: $contratoLaboralUrl, cvUrl: $cvUrl, cartaOfertaUrl: $cartaOfertaUrl, examenMedicoUrl: $examenMedicoUrl, cartaRenunciaUrl: $cartaRenunciaUrl, finiquitoUrl: $finiquitoUrl, bajaImssUrl: $bajaImssUrl, comprobanteFiniquitoUrl: $comprobanteFiniquitoUrl)';
}


}

/// @nodoc
abstract mixin class $EmpleadoApiModelCopyWith<$Res>  {
  factory $EmpleadoApiModelCopyWith(EmpleadoApiModel value, $Res Function(EmpleadoApiModel) _then) = _$EmpleadoApiModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'usuario', defaultValue: 0) int userRef,@JsonKey(name: 'jefe', defaultValue: 0) int jefeRef,@JsonKey(name: 'nombre_completo') String nombre, DateTime fechaNacimiento, Escolaridad escolaridad, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String rfc, String curp,@JsonKey(name: 'numero_seguro_social') String nss,@JsonKey(name: 'direccion_completa') String direccion,@JsonKey(fromJson: _doubleFromJson) double montoRetencionInfonavit,@JsonKey(name: 'puesto') int puestoRef, EmpleadoEstatus estatus,@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) double salario, int? antiguedad, int? diasVacaciones, bool hasSignature,@JsonKey(name: 'fecha_alta') DateTime? registeredAt,@JsonKey(name: 'fecha_baja') DateTime? terminatedAt,@JsonKey(name: 'identificacion_oficial') String? ineUrl,@JsonKey(name: 'acta_nacimiento') String? actaNacimientoUrl,@JsonKey(name: 'constancia_estudio') String? constanciaEstudioUrl,@JsonKey(name: 'estado_cuenta') String? estadoCuentaUrl,@JsonKey(name: 'constancia_situacion_fiscal') String? constanciaSituacionFiscalUrl,@JsonKey(name: 'pdf_curp') String? curpUrl,@JsonKey(name: 'comprobante_nss') String? nssUrl,@JsonKey(name: 'alta_imss') String? altaImssUrl,@JsonKey(name: 'comprobante_domicilio') String? comprobanteDomicilioUrl,@JsonKey(name: 'aviso_retencion_infonavit') String? avisoInfonavitUrl,@JsonKey(name: 'carta_recomendacion_1') String? cartaRecomendacion1Url,@JsonKey(name: 'carta_recomendacion_2') String? cartaRecomendacion2Url,@JsonKey(name: 'carta_recomendacion_3') String? cartaRecomendacion3Url,@JsonKey(name: 'carta_no_antecedentes_penales') String? cartaNoAntecedentesPenalesUrl,@JsonKey(name: 'contrato_laboral') String? contratoLaboralUrl,@JsonKey(name: 'curriculum_vitae') String? cvUrl,@JsonKey(name: 'carta_oferta') String? cartaOfertaUrl,@JsonKey(name: 'examen_medico') String? examenMedicoUrl,@JsonKey(name: 'carta_renuncia') String? cartaRenunciaUrl,@JsonKey(name: 'finiquito_firmado') String? finiquitoUrl,@JsonKey(name: 'baja_imss') String? bajaImssUrl,@JsonKey(name: 'comprobante_transferencia_finiquito') String? comprobanteFiniquitoUrl
});




}
/// @nodoc
class _$EmpleadoApiModelCopyWithImpl<$Res>
    implements $EmpleadoApiModelCopyWith<$Res> {
  _$EmpleadoApiModelCopyWithImpl(this._self, this._then);

  final EmpleadoApiModel _self;
  final $Res Function(EmpleadoApiModel) _then;

/// Create a copy of EmpleadoApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userRef = null,Object? jefeRef = null,Object? nombre = null,Object? fechaNacimiento = null,Object? escolaridad = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? rfc = null,Object? curp = null,Object? nss = null,Object? direccion = null,Object? montoRetencionInfonavit = null,Object? puestoRef = null,Object? estatus = null,Object? salario = null,Object? antiguedad = freezed,Object? diasVacaciones = freezed,Object? hasSignature = null,Object? registeredAt = freezed,Object? terminatedAt = freezed,Object? ineUrl = freezed,Object? actaNacimientoUrl = freezed,Object? constanciaEstudioUrl = freezed,Object? estadoCuentaUrl = freezed,Object? constanciaSituacionFiscalUrl = freezed,Object? curpUrl = freezed,Object? nssUrl = freezed,Object? altaImssUrl = freezed,Object? comprobanteDomicilioUrl = freezed,Object? avisoInfonavitUrl = freezed,Object? cartaRecomendacion1Url = freezed,Object? cartaRecomendacion2Url = freezed,Object? cartaRecomendacion3Url = freezed,Object? cartaNoAntecedentesPenalesUrl = freezed,Object? contratoLaboralUrl = freezed,Object? cvUrl = freezed,Object? cartaOfertaUrl = freezed,Object? examenMedicoUrl = freezed,Object? cartaRenunciaUrl = freezed,Object? finiquitoUrl = freezed,Object? bajaImssUrl = freezed,Object? comprobanteFiniquitoUrl = freezed,}) {
  return _then(EmpleadoApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as int,jefeRef: null == jefeRef ? _self.jefeRef : jefeRef // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,fechaNacimiento: null == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as Escolaridad,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,nss: null == nss ? _self.nss : nss // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,montoRetencionInfonavit: null == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double,puestoRef: null == puestoRef ? _self.puestoRef : puestoRef // ignore: cast_nullable_to_non_nullable
as int,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EmpleadoEstatus,salario: null == salario ? _self.salario : salario // ignore: cast_nullable_to_non_nullable
as double,antiguedad: freezed == antiguedad ? _self.antiguedad : antiguedad // ignore: cast_nullable_to_non_nullable
as int?,diasVacaciones: freezed == diasVacaciones ? _self.diasVacaciones : diasVacaciones // ignore: cast_nullable_to_non_nullable
as int?,hasSignature: null == hasSignature ? _self.hasSignature : hasSignature // ignore: cast_nullable_to_non_nullable
as bool,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,terminatedAt: freezed == terminatedAt ? _self.terminatedAt : terminatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ineUrl: freezed == ineUrl ? _self.ineUrl : ineUrl // ignore: cast_nullable_to_non_nullable
as String?,actaNacimientoUrl: freezed == actaNacimientoUrl ? _self.actaNacimientoUrl : actaNacimientoUrl // ignore: cast_nullable_to_non_nullable
as String?,constanciaEstudioUrl: freezed == constanciaEstudioUrl ? _self.constanciaEstudioUrl : constanciaEstudioUrl // ignore: cast_nullable_to_non_nullable
as String?,estadoCuentaUrl: freezed == estadoCuentaUrl ? _self.estadoCuentaUrl : estadoCuentaUrl // ignore: cast_nullable_to_non_nullable
as String?,constanciaSituacionFiscalUrl: freezed == constanciaSituacionFiscalUrl ? _self.constanciaSituacionFiscalUrl : constanciaSituacionFiscalUrl // ignore: cast_nullable_to_non_nullable
as String?,curpUrl: freezed == curpUrl ? _self.curpUrl : curpUrl // ignore: cast_nullable_to_non_nullable
as String?,nssUrl: freezed == nssUrl ? _self.nssUrl : nssUrl // ignore: cast_nullable_to_non_nullable
as String?,altaImssUrl: freezed == altaImssUrl ? _self.altaImssUrl : altaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,comprobanteDomicilioUrl: freezed == comprobanteDomicilioUrl ? _self.comprobanteDomicilioUrl : comprobanteDomicilioUrl // ignore: cast_nullable_to_non_nullable
as String?,avisoInfonavitUrl: freezed == avisoInfonavitUrl ? _self.avisoInfonavitUrl : avisoInfonavitUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion1Url: freezed == cartaRecomendacion1Url ? _self.cartaRecomendacion1Url : cartaRecomendacion1Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion2Url: freezed == cartaRecomendacion2Url ? _self.cartaRecomendacion2Url : cartaRecomendacion2Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion3Url: freezed == cartaRecomendacion3Url ? _self.cartaRecomendacion3Url : cartaRecomendacion3Url // ignore: cast_nullable_to_non_nullable
as String?,cartaNoAntecedentesPenalesUrl: freezed == cartaNoAntecedentesPenalesUrl ? _self.cartaNoAntecedentesPenalesUrl : cartaNoAntecedentesPenalesUrl // ignore: cast_nullable_to_non_nullable
as String?,contratoLaboralUrl: freezed == contratoLaboralUrl ? _self.contratoLaboralUrl : contratoLaboralUrl // ignore: cast_nullable_to_non_nullable
as String?,cvUrl: freezed == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaOfertaUrl: freezed == cartaOfertaUrl ? _self.cartaOfertaUrl : cartaOfertaUrl // ignore: cast_nullable_to_non_nullable
as String?,examenMedicoUrl: freezed == examenMedicoUrl ? _self.examenMedicoUrl : examenMedicoUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaRenunciaUrl: freezed == cartaRenunciaUrl ? _self.cartaRenunciaUrl : cartaRenunciaUrl // ignore: cast_nullable_to_non_nullable
as String?,finiquitoUrl: freezed == finiquitoUrl ? _self.finiquitoUrl : finiquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,bajaImssUrl: freezed == bajaImssUrl ? _self.bajaImssUrl : bajaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,comprobanteFiniquitoUrl: freezed == comprobanteFiniquitoUrl ? _self.comprobanteFiniquitoUrl : comprobanteFiniquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmpleadoApiModel].
extension EmpleadoApiModelPatterns on EmpleadoApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmpleadoApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmpleadoApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmpleadoApiModel value)  $default,){
final _that = this;
switch (_that) {
case _EmpleadoApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmpleadoApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmpleadoApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'usuario', defaultValue: 0)  int userRef, @JsonKey(name: 'jefe', defaultValue: 0)  int jefeRef, @JsonKey(name: 'nombre_completo')  String nombre,  DateTime fechaNacimiento,  Escolaridad escolaridad,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp, @JsonKey(name: 'numero_seguro_social')  String nss, @JsonKey(name: 'direccion_completa')  String direccion, @JsonKey(fromJson: _doubleFromJson)  double montoRetencionInfonavit, @JsonKey(name: 'puesto')  int puestoRef,  EmpleadoEstatus estatus, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)  double salario,  int? antiguedad,  int? diasVacaciones,  bool hasSignature, @JsonKey(name: 'fecha_alta')  DateTime? registeredAt, @JsonKey(name: 'fecha_baja')  DateTime? terminatedAt, @JsonKey(name: 'identificacion_oficial')  String? ineUrl, @JsonKey(name: 'acta_nacimiento')  String? actaNacimientoUrl, @JsonKey(name: 'constancia_estudio')  String? constanciaEstudioUrl, @JsonKey(name: 'estado_cuenta')  String? estadoCuentaUrl, @JsonKey(name: 'constancia_situacion_fiscal')  String? constanciaSituacionFiscalUrl, @JsonKey(name: 'pdf_curp')  String? curpUrl, @JsonKey(name: 'comprobante_nss')  String? nssUrl, @JsonKey(name: 'alta_imss')  String? altaImssUrl, @JsonKey(name: 'comprobante_domicilio')  String? comprobanteDomicilioUrl, @JsonKey(name: 'aviso_retencion_infonavit')  String? avisoInfonavitUrl, @JsonKey(name: 'carta_recomendacion_1')  String? cartaRecomendacion1Url, @JsonKey(name: 'carta_recomendacion_2')  String? cartaRecomendacion2Url, @JsonKey(name: 'carta_recomendacion_3')  String? cartaRecomendacion3Url, @JsonKey(name: 'carta_no_antecedentes_penales')  String? cartaNoAntecedentesPenalesUrl, @JsonKey(name: 'contrato_laboral')  String? contratoLaboralUrl, @JsonKey(name: 'curriculum_vitae')  String? cvUrl, @JsonKey(name: 'carta_oferta')  String? cartaOfertaUrl, @JsonKey(name: 'examen_medico')  String? examenMedicoUrl, @JsonKey(name: 'carta_renuncia')  String? cartaRenunciaUrl, @JsonKey(name: 'finiquito_firmado')  String? finiquitoUrl, @JsonKey(name: 'baja_imss')  String? bajaImssUrl, @JsonKey(name: 'comprobante_transferencia_finiquito')  String? comprobanteFiniquitoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmpleadoApiModel() when $default != null:
return $default(_that.id,_that.userRef,_that.jefeRef,_that.nombre,_that.fechaNacimiento,_that.escolaridad,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.nss,_that.direccion,_that.montoRetencionInfonavit,_that.puestoRef,_that.estatus,_that.salario,_that.antiguedad,_that.diasVacaciones,_that.hasSignature,_that.registeredAt,_that.terminatedAt,_that.ineUrl,_that.actaNacimientoUrl,_that.constanciaEstudioUrl,_that.estadoCuentaUrl,_that.constanciaSituacionFiscalUrl,_that.curpUrl,_that.nssUrl,_that.altaImssUrl,_that.comprobanteDomicilioUrl,_that.avisoInfonavitUrl,_that.cartaRecomendacion1Url,_that.cartaRecomendacion2Url,_that.cartaRecomendacion3Url,_that.cartaNoAntecedentesPenalesUrl,_that.contratoLaboralUrl,_that.cvUrl,_that.cartaOfertaUrl,_that.examenMedicoUrl,_that.cartaRenunciaUrl,_that.finiquitoUrl,_that.bajaImssUrl,_that.comprobanteFiniquitoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'usuario', defaultValue: 0)  int userRef, @JsonKey(name: 'jefe', defaultValue: 0)  int jefeRef, @JsonKey(name: 'nombre_completo')  String nombre,  DateTime fechaNacimiento,  Escolaridad escolaridad,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp, @JsonKey(name: 'numero_seguro_social')  String nss, @JsonKey(name: 'direccion_completa')  String direccion, @JsonKey(fromJson: _doubleFromJson)  double montoRetencionInfonavit, @JsonKey(name: 'puesto')  int puestoRef,  EmpleadoEstatus estatus, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)  double salario,  int? antiguedad,  int? diasVacaciones,  bool hasSignature, @JsonKey(name: 'fecha_alta')  DateTime? registeredAt, @JsonKey(name: 'fecha_baja')  DateTime? terminatedAt, @JsonKey(name: 'identificacion_oficial')  String? ineUrl, @JsonKey(name: 'acta_nacimiento')  String? actaNacimientoUrl, @JsonKey(name: 'constancia_estudio')  String? constanciaEstudioUrl, @JsonKey(name: 'estado_cuenta')  String? estadoCuentaUrl, @JsonKey(name: 'constancia_situacion_fiscal')  String? constanciaSituacionFiscalUrl, @JsonKey(name: 'pdf_curp')  String? curpUrl, @JsonKey(name: 'comprobante_nss')  String? nssUrl, @JsonKey(name: 'alta_imss')  String? altaImssUrl, @JsonKey(name: 'comprobante_domicilio')  String? comprobanteDomicilioUrl, @JsonKey(name: 'aviso_retencion_infonavit')  String? avisoInfonavitUrl, @JsonKey(name: 'carta_recomendacion_1')  String? cartaRecomendacion1Url, @JsonKey(name: 'carta_recomendacion_2')  String? cartaRecomendacion2Url, @JsonKey(name: 'carta_recomendacion_3')  String? cartaRecomendacion3Url, @JsonKey(name: 'carta_no_antecedentes_penales')  String? cartaNoAntecedentesPenalesUrl, @JsonKey(name: 'contrato_laboral')  String? contratoLaboralUrl, @JsonKey(name: 'curriculum_vitae')  String? cvUrl, @JsonKey(name: 'carta_oferta')  String? cartaOfertaUrl, @JsonKey(name: 'examen_medico')  String? examenMedicoUrl, @JsonKey(name: 'carta_renuncia')  String? cartaRenunciaUrl, @JsonKey(name: 'finiquito_firmado')  String? finiquitoUrl, @JsonKey(name: 'baja_imss')  String? bajaImssUrl, @JsonKey(name: 'comprobante_transferencia_finiquito')  String? comprobanteFiniquitoUrl)  $default,) {final _that = this;
switch (_that) {
case _EmpleadoApiModel():
return $default(_that.id,_that.userRef,_that.jefeRef,_that.nombre,_that.fechaNacimiento,_that.escolaridad,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.nss,_that.direccion,_that.montoRetencionInfonavit,_that.puestoRef,_that.estatus,_that.salario,_that.antiguedad,_that.diasVacaciones,_that.hasSignature,_that.registeredAt,_that.terminatedAt,_that.ineUrl,_that.actaNacimientoUrl,_that.constanciaEstudioUrl,_that.estadoCuentaUrl,_that.constanciaSituacionFiscalUrl,_that.curpUrl,_that.nssUrl,_that.altaImssUrl,_that.comprobanteDomicilioUrl,_that.avisoInfonavitUrl,_that.cartaRecomendacion1Url,_that.cartaRecomendacion2Url,_that.cartaRecomendacion3Url,_that.cartaNoAntecedentesPenalesUrl,_that.contratoLaboralUrl,_that.cvUrl,_that.cartaOfertaUrl,_that.examenMedicoUrl,_that.cartaRenunciaUrl,_that.finiquitoUrl,_that.bajaImssUrl,_that.comprobanteFiniquitoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'usuario', defaultValue: 0)  int userRef, @JsonKey(name: 'jefe', defaultValue: 0)  int jefeRef, @JsonKey(name: 'nombre_completo')  String nombre,  DateTime fechaNacimiento,  Escolaridad escolaridad,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp, @JsonKey(name: 'numero_seguro_social')  String nss, @JsonKey(name: 'direccion_completa')  String direccion, @JsonKey(fromJson: _doubleFromJson)  double montoRetencionInfonavit, @JsonKey(name: 'puesto')  int puestoRef,  EmpleadoEstatus estatus, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)  double salario,  int? antiguedad,  int? diasVacaciones,  bool hasSignature, @JsonKey(name: 'fecha_alta')  DateTime? registeredAt, @JsonKey(name: 'fecha_baja')  DateTime? terminatedAt, @JsonKey(name: 'identificacion_oficial')  String? ineUrl, @JsonKey(name: 'acta_nacimiento')  String? actaNacimientoUrl, @JsonKey(name: 'constancia_estudio')  String? constanciaEstudioUrl, @JsonKey(name: 'estado_cuenta')  String? estadoCuentaUrl, @JsonKey(name: 'constancia_situacion_fiscal')  String? constanciaSituacionFiscalUrl, @JsonKey(name: 'pdf_curp')  String? curpUrl, @JsonKey(name: 'comprobante_nss')  String? nssUrl, @JsonKey(name: 'alta_imss')  String? altaImssUrl, @JsonKey(name: 'comprobante_domicilio')  String? comprobanteDomicilioUrl, @JsonKey(name: 'aviso_retencion_infonavit')  String? avisoInfonavitUrl, @JsonKey(name: 'carta_recomendacion_1')  String? cartaRecomendacion1Url, @JsonKey(name: 'carta_recomendacion_2')  String? cartaRecomendacion2Url, @JsonKey(name: 'carta_recomendacion_3')  String? cartaRecomendacion3Url, @JsonKey(name: 'carta_no_antecedentes_penales')  String? cartaNoAntecedentesPenalesUrl, @JsonKey(name: 'contrato_laboral')  String? contratoLaboralUrl, @JsonKey(name: 'curriculum_vitae')  String? cvUrl, @JsonKey(name: 'carta_oferta')  String? cartaOfertaUrl, @JsonKey(name: 'examen_medico')  String? examenMedicoUrl, @JsonKey(name: 'carta_renuncia')  String? cartaRenunciaUrl, @JsonKey(name: 'finiquito_firmado')  String? finiquitoUrl, @JsonKey(name: 'baja_imss')  String? bajaImssUrl, @JsonKey(name: 'comprobante_transferencia_finiquito')  String? comprobanteFiniquitoUrl)?  $default,) {final _that = this;
switch (_that) {
case _EmpleadoApiModel() when $default != null:
return $default(_that.id,_that.userRef,_that.jefeRef,_that.nombre,_that.fechaNacimiento,_that.escolaridad,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.nss,_that.direccion,_that.montoRetencionInfonavit,_that.puestoRef,_that.estatus,_that.salario,_that.antiguedad,_that.diasVacaciones,_that.hasSignature,_that.registeredAt,_that.terminatedAt,_that.ineUrl,_that.actaNacimientoUrl,_that.constanciaEstudioUrl,_that.estadoCuentaUrl,_that.constanciaSituacionFiscalUrl,_that.curpUrl,_that.nssUrl,_that.altaImssUrl,_that.comprobanteDomicilioUrl,_that.avisoInfonavitUrl,_that.cartaRecomendacion1Url,_that.cartaRecomendacion2Url,_that.cartaRecomendacion3Url,_that.cartaNoAntecedentesPenalesUrl,_that.contratoLaboralUrl,_that.cvUrl,_that.cartaOfertaUrl,_that.examenMedicoUrl,_that.cartaRenunciaUrl,_that.finiquitoUrl,_that.bajaImssUrl,_that.comprobanteFiniquitoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmpleadoApiModel with DiagnosticableTreeMixin implements EmpleadoApiModel {
  const _EmpleadoApiModel({this.id = 0, @JsonKey(name: 'usuario', defaultValue: 0) required this.userRef, @JsonKey(name: 'jefe', defaultValue: 0) required this.jefeRef, @JsonKey(name: 'nombre_completo') required this.nombre, required this.fechaNacimiento, required this.escolaridad, required this.clabeInterbancaria, required this.numeroContacto, required this.contactoEmergencia, required this.rfc, required this.curp, @JsonKey(name: 'numero_seguro_social') required this.nss, @JsonKey(name: 'direccion_completa') required this.direccion, @JsonKey(fromJson: _doubleFromJson) required this.montoRetencionInfonavit, @JsonKey(name: 'puesto') required this.puestoRef, required this.estatus, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) required this.salario, this.antiguedad, this.diasVacaciones, required this.hasSignature, @JsonKey(name: 'fecha_alta') this.registeredAt, @JsonKey(name: 'fecha_baja') this.terminatedAt, @JsonKey(name: 'identificacion_oficial') this.ineUrl, @JsonKey(name: 'acta_nacimiento') this.actaNacimientoUrl, @JsonKey(name: 'constancia_estudio') this.constanciaEstudioUrl, @JsonKey(name: 'estado_cuenta') this.estadoCuentaUrl, @JsonKey(name: 'constancia_situacion_fiscal') this.constanciaSituacionFiscalUrl, @JsonKey(name: 'pdf_curp') this.curpUrl, @JsonKey(name: 'comprobante_nss') this.nssUrl, @JsonKey(name: 'alta_imss') this.altaImssUrl, @JsonKey(name: 'comprobante_domicilio') this.comprobanteDomicilioUrl, @JsonKey(name: 'aviso_retencion_infonavit') this.avisoInfonavitUrl, @JsonKey(name: 'carta_recomendacion_1') this.cartaRecomendacion1Url, @JsonKey(name: 'carta_recomendacion_2') this.cartaRecomendacion2Url, @JsonKey(name: 'carta_recomendacion_3') this.cartaRecomendacion3Url, @JsonKey(name: 'carta_no_antecedentes_penales') this.cartaNoAntecedentesPenalesUrl, @JsonKey(name: 'contrato_laboral') this.contratoLaboralUrl, @JsonKey(name: 'curriculum_vitae') this.cvUrl, @JsonKey(name: 'carta_oferta') this.cartaOfertaUrl, @JsonKey(name: 'examen_medico') this.examenMedicoUrl, @JsonKey(name: 'carta_renuncia') this.cartaRenunciaUrl, @JsonKey(name: 'finiquito_firmado') this.finiquitoUrl, @JsonKey(name: 'baja_imss') this.bajaImssUrl, @JsonKey(name: 'comprobante_transferencia_finiquito') this.comprobanteFiniquitoUrl});
  factory _EmpleadoApiModel.fromJson(Map<String, dynamic> json) => _$EmpleadoApiModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'usuario', defaultValue: 0) final  int userRef;
@override@JsonKey(name: 'jefe', defaultValue: 0) final  int jefeRef;
@override@JsonKey(name: 'nombre_completo') final  String nombre;
@override final  DateTime fechaNacimiento;
@override final  Escolaridad escolaridad;
@override final  String clabeInterbancaria;
@override final  String numeroContacto;
@override final  String contactoEmergencia;
@override final  String rfc;
@override final  String curp;
@override@JsonKey(name: 'numero_seguro_social') final  String nss;
@override@JsonKey(name: 'direccion_completa') final  String direccion;
@override@JsonKey(fromJson: _doubleFromJson) final  double montoRetencionInfonavit;
@override@JsonKey(name: 'puesto') final  int puestoRef;
@override final  EmpleadoEstatus estatus;
@override@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) final  double salario;
@override final  int? antiguedad;
@override final  int? diasVacaciones;
@override final  bool hasSignature;
@override@JsonKey(name: 'fecha_alta') final  DateTime? registeredAt;
@override@JsonKey(name: 'fecha_baja') final  DateTime? terminatedAt;
@override@JsonKey(name: 'identificacion_oficial') final  String? ineUrl;
@override@JsonKey(name: 'acta_nacimiento') final  String? actaNacimientoUrl;
@override@JsonKey(name: 'constancia_estudio') final  String? constanciaEstudioUrl;
@override@JsonKey(name: 'estado_cuenta') final  String? estadoCuentaUrl;
@override@JsonKey(name: 'constancia_situacion_fiscal') final  String? constanciaSituacionFiscalUrl;
@override@JsonKey(name: 'pdf_curp') final  String? curpUrl;
@override@JsonKey(name: 'comprobante_nss') final  String? nssUrl;
@override@JsonKey(name: 'alta_imss') final  String? altaImssUrl;
@override@JsonKey(name: 'comprobante_domicilio') final  String? comprobanteDomicilioUrl;
@override@JsonKey(name: 'aviso_retencion_infonavit') final  String? avisoInfonavitUrl;
@override@JsonKey(name: 'carta_recomendacion_1') final  String? cartaRecomendacion1Url;
@override@JsonKey(name: 'carta_recomendacion_2') final  String? cartaRecomendacion2Url;
@override@JsonKey(name: 'carta_recomendacion_3') final  String? cartaRecomendacion3Url;
@override@JsonKey(name: 'carta_no_antecedentes_penales') final  String? cartaNoAntecedentesPenalesUrl;
@override@JsonKey(name: 'contrato_laboral') final  String? contratoLaboralUrl;
@override@JsonKey(name: 'curriculum_vitae') final  String? cvUrl;
@override@JsonKey(name: 'carta_oferta') final  String? cartaOfertaUrl;
@override@JsonKey(name: 'examen_medico') final  String? examenMedicoUrl;
@override@JsonKey(name: 'carta_renuncia') final  String? cartaRenunciaUrl;
@override@JsonKey(name: 'finiquito_firmado') final  String? finiquitoUrl;
@override@JsonKey(name: 'baja_imss') final  String? bajaImssUrl;
@override@JsonKey(name: 'comprobante_transferencia_finiquito') final  String? comprobanteFiniquitoUrl;

/// Create a copy of EmpleadoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmpleadoApiModelCopyWith<_EmpleadoApiModel> get copyWith => __$EmpleadoApiModelCopyWithImpl<_EmpleadoApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmpleadoApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'EmpleadoApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userRef', userRef))..add(DiagnosticsProperty('jefeRef', jefeRef))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('fechaNacimiento', fechaNacimiento))..add(DiagnosticsProperty('escolaridad', escolaridad))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('nss', nss))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('montoRetencionInfonavit', montoRetencionInfonavit))..add(DiagnosticsProperty('puestoRef', puestoRef))..add(DiagnosticsProperty('estatus', estatus))..add(DiagnosticsProperty('salario', salario))..add(DiagnosticsProperty('antiguedad', antiguedad))..add(DiagnosticsProperty('diasVacaciones', diasVacaciones))..add(DiagnosticsProperty('hasSignature', hasSignature))..add(DiagnosticsProperty('registeredAt', registeredAt))..add(DiagnosticsProperty('terminatedAt', terminatedAt))..add(DiagnosticsProperty('ineUrl', ineUrl))..add(DiagnosticsProperty('actaNacimientoUrl', actaNacimientoUrl))..add(DiagnosticsProperty('constanciaEstudioUrl', constanciaEstudioUrl))..add(DiagnosticsProperty('estadoCuentaUrl', estadoCuentaUrl))..add(DiagnosticsProperty('constanciaSituacionFiscalUrl', constanciaSituacionFiscalUrl))..add(DiagnosticsProperty('curpUrl', curpUrl))..add(DiagnosticsProperty('nssUrl', nssUrl))..add(DiagnosticsProperty('altaImssUrl', altaImssUrl))..add(DiagnosticsProperty('comprobanteDomicilioUrl', comprobanteDomicilioUrl))..add(DiagnosticsProperty('avisoInfonavitUrl', avisoInfonavitUrl))..add(DiagnosticsProperty('cartaRecomendacion1Url', cartaRecomendacion1Url))..add(DiagnosticsProperty('cartaRecomendacion2Url', cartaRecomendacion2Url))..add(DiagnosticsProperty('cartaRecomendacion3Url', cartaRecomendacion3Url))..add(DiagnosticsProperty('cartaNoAntecedentesPenalesUrl', cartaNoAntecedentesPenalesUrl))..add(DiagnosticsProperty('contratoLaboralUrl', contratoLaboralUrl))..add(DiagnosticsProperty('cvUrl', cvUrl))..add(DiagnosticsProperty('cartaOfertaUrl', cartaOfertaUrl))..add(DiagnosticsProperty('examenMedicoUrl', examenMedicoUrl))..add(DiagnosticsProperty('cartaRenunciaUrl', cartaRenunciaUrl))..add(DiagnosticsProperty('finiquitoUrl', finiquitoUrl))..add(DiagnosticsProperty('bajaImssUrl', bajaImssUrl))..add(DiagnosticsProperty('comprobanteFiniquitoUrl', comprobanteFiniquitoUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmpleadoApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userRef, userRef) || other.userRef == userRef)&&(identical(other.jefeRef, jefeRef) || other.jefeRef == jefeRef)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.nss, nss) || other.nss == nss)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&(identical(other.puestoRef, puestoRef) || other.puestoRef == puestoRef)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.salario, salario) || other.salario == salario)&&(identical(other.antiguedad, antiguedad) || other.antiguedad == antiguedad)&&(identical(other.diasVacaciones, diasVacaciones) || other.diasVacaciones == diasVacaciones)&&(identical(other.hasSignature, hasSignature) || other.hasSignature == hasSignature)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.terminatedAt, terminatedAt) || other.terminatedAt == terminatedAt)&&(identical(other.ineUrl, ineUrl) || other.ineUrl == ineUrl)&&(identical(other.actaNacimientoUrl, actaNacimientoUrl) || other.actaNacimientoUrl == actaNacimientoUrl)&&(identical(other.constanciaEstudioUrl, constanciaEstudioUrl) || other.constanciaEstudioUrl == constanciaEstudioUrl)&&(identical(other.estadoCuentaUrl, estadoCuentaUrl) || other.estadoCuentaUrl == estadoCuentaUrl)&&(identical(other.constanciaSituacionFiscalUrl, constanciaSituacionFiscalUrl) || other.constanciaSituacionFiscalUrl == constanciaSituacionFiscalUrl)&&(identical(other.curpUrl, curpUrl) || other.curpUrl == curpUrl)&&(identical(other.nssUrl, nssUrl) || other.nssUrl == nssUrl)&&(identical(other.altaImssUrl, altaImssUrl) || other.altaImssUrl == altaImssUrl)&&(identical(other.comprobanteDomicilioUrl, comprobanteDomicilioUrl) || other.comprobanteDomicilioUrl == comprobanteDomicilioUrl)&&(identical(other.avisoInfonavitUrl, avisoInfonavitUrl) || other.avisoInfonavitUrl == avisoInfonavitUrl)&&(identical(other.cartaRecomendacion1Url, cartaRecomendacion1Url) || other.cartaRecomendacion1Url == cartaRecomendacion1Url)&&(identical(other.cartaRecomendacion2Url, cartaRecomendacion2Url) || other.cartaRecomendacion2Url == cartaRecomendacion2Url)&&(identical(other.cartaRecomendacion3Url, cartaRecomendacion3Url) || other.cartaRecomendacion3Url == cartaRecomendacion3Url)&&(identical(other.cartaNoAntecedentesPenalesUrl, cartaNoAntecedentesPenalesUrl) || other.cartaNoAntecedentesPenalesUrl == cartaNoAntecedentesPenalesUrl)&&(identical(other.contratoLaboralUrl, contratoLaboralUrl) || other.contratoLaboralUrl == contratoLaboralUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl)&&(identical(other.cartaOfertaUrl, cartaOfertaUrl) || other.cartaOfertaUrl == cartaOfertaUrl)&&(identical(other.examenMedicoUrl, examenMedicoUrl) || other.examenMedicoUrl == examenMedicoUrl)&&(identical(other.cartaRenunciaUrl, cartaRenunciaUrl) || other.cartaRenunciaUrl == cartaRenunciaUrl)&&(identical(other.finiquitoUrl, finiquitoUrl) || other.finiquitoUrl == finiquitoUrl)&&(identical(other.bajaImssUrl, bajaImssUrl) || other.bajaImssUrl == bajaImssUrl)&&(identical(other.comprobanteFiniquitoUrl, comprobanteFiniquitoUrl) || other.comprobanteFiniquitoUrl == comprobanteFiniquitoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userRef,jefeRef,nombre,fechaNacimiento,escolaridad,clabeInterbancaria,numeroContacto,contactoEmergencia,rfc,curp,nss,direccion,montoRetencionInfonavit,puestoRef,estatus,salario,antiguedad,diasVacaciones,hasSignature,registeredAt,terminatedAt,ineUrl,actaNacimientoUrl,constanciaEstudioUrl,estadoCuentaUrl,constanciaSituacionFiscalUrl,curpUrl,nssUrl,altaImssUrl,comprobanteDomicilioUrl,avisoInfonavitUrl,cartaRecomendacion1Url,cartaRecomendacion2Url,cartaRecomendacion3Url,cartaNoAntecedentesPenalesUrl,contratoLaboralUrl,cvUrl,cartaOfertaUrl,examenMedicoUrl,cartaRenunciaUrl,finiquitoUrl,bajaImssUrl,comprobanteFiniquitoUrl]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'EmpleadoApiModel(id: $id, userRef: $userRef, jefeRef: $jefeRef, nombre: $nombre, fechaNacimiento: $fechaNacimiento, escolaridad: $escolaridad, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, rfc: $rfc, curp: $curp, nss: $nss, direccion: $direccion, montoRetencionInfonavit: $montoRetencionInfonavit, puestoRef: $puestoRef, estatus: $estatus, salario: $salario, antiguedad: $antiguedad, diasVacaciones: $diasVacaciones, hasSignature: $hasSignature, registeredAt: $registeredAt, terminatedAt: $terminatedAt, ineUrl: $ineUrl, actaNacimientoUrl: $actaNacimientoUrl, constanciaEstudioUrl: $constanciaEstudioUrl, estadoCuentaUrl: $estadoCuentaUrl, constanciaSituacionFiscalUrl: $constanciaSituacionFiscalUrl, curpUrl: $curpUrl, nssUrl: $nssUrl, altaImssUrl: $altaImssUrl, comprobanteDomicilioUrl: $comprobanteDomicilioUrl, avisoInfonavitUrl: $avisoInfonavitUrl, cartaRecomendacion1Url: $cartaRecomendacion1Url, cartaRecomendacion2Url: $cartaRecomendacion2Url, cartaRecomendacion3Url: $cartaRecomendacion3Url, cartaNoAntecedentesPenalesUrl: $cartaNoAntecedentesPenalesUrl, contratoLaboralUrl: $contratoLaboralUrl, cvUrl: $cvUrl, cartaOfertaUrl: $cartaOfertaUrl, examenMedicoUrl: $examenMedicoUrl, cartaRenunciaUrl: $cartaRenunciaUrl, finiquitoUrl: $finiquitoUrl, bajaImssUrl: $bajaImssUrl, comprobanteFiniquitoUrl: $comprobanteFiniquitoUrl)';
}


}

/// @nodoc
abstract mixin class _$EmpleadoApiModelCopyWith<$Res> implements $EmpleadoApiModelCopyWith<$Res> {
  factory _$EmpleadoApiModelCopyWith(_EmpleadoApiModel value, $Res Function(_EmpleadoApiModel) _then) = __$EmpleadoApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'usuario', defaultValue: 0) int userRef,@JsonKey(name: 'jefe', defaultValue: 0) int jefeRef,@JsonKey(name: 'nombre_completo') String nombre, DateTime fechaNacimiento, Escolaridad escolaridad, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String rfc, String curp,@JsonKey(name: 'numero_seguro_social') String nss,@JsonKey(name: 'direccion_completa') String direccion,@JsonKey(fromJson: _doubleFromJson) double montoRetencionInfonavit,@JsonKey(name: 'puesto') int puestoRef, EmpleadoEstatus estatus,@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) double salario, int? antiguedad, int? diasVacaciones, bool hasSignature,@JsonKey(name: 'fecha_alta') DateTime? registeredAt,@JsonKey(name: 'fecha_baja') DateTime? terminatedAt,@JsonKey(name: 'identificacion_oficial') String? ineUrl,@JsonKey(name: 'acta_nacimiento') String? actaNacimientoUrl,@JsonKey(name: 'constancia_estudio') String? constanciaEstudioUrl,@JsonKey(name: 'estado_cuenta') String? estadoCuentaUrl,@JsonKey(name: 'constancia_situacion_fiscal') String? constanciaSituacionFiscalUrl,@JsonKey(name: 'pdf_curp') String? curpUrl,@JsonKey(name: 'comprobante_nss') String? nssUrl,@JsonKey(name: 'alta_imss') String? altaImssUrl,@JsonKey(name: 'comprobante_domicilio') String? comprobanteDomicilioUrl,@JsonKey(name: 'aviso_retencion_infonavit') String? avisoInfonavitUrl,@JsonKey(name: 'carta_recomendacion_1') String? cartaRecomendacion1Url,@JsonKey(name: 'carta_recomendacion_2') String? cartaRecomendacion2Url,@JsonKey(name: 'carta_recomendacion_3') String? cartaRecomendacion3Url,@JsonKey(name: 'carta_no_antecedentes_penales') String? cartaNoAntecedentesPenalesUrl,@JsonKey(name: 'contrato_laboral') String? contratoLaboralUrl,@JsonKey(name: 'curriculum_vitae') String? cvUrl,@JsonKey(name: 'carta_oferta') String? cartaOfertaUrl,@JsonKey(name: 'examen_medico') String? examenMedicoUrl,@JsonKey(name: 'carta_renuncia') String? cartaRenunciaUrl,@JsonKey(name: 'finiquito_firmado') String? finiquitoUrl,@JsonKey(name: 'baja_imss') String? bajaImssUrl,@JsonKey(name: 'comprobante_transferencia_finiquito') String? comprobanteFiniquitoUrl
});




}
/// @nodoc
class __$EmpleadoApiModelCopyWithImpl<$Res>
    implements _$EmpleadoApiModelCopyWith<$Res> {
  __$EmpleadoApiModelCopyWithImpl(this._self, this._then);

  final _EmpleadoApiModel _self;
  final $Res Function(_EmpleadoApiModel) _then;

/// Create a copy of EmpleadoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userRef = null,Object? jefeRef = null,Object? nombre = null,Object? fechaNacimiento = null,Object? escolaridad = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? rfc = null,Object? curp = null,Object? nss = null,Object? direccion = null,Object? montoRetencionInfonavit = null,Object? puestoRef = null,Object? estatus = null,Object? salario = null,Object? antiguedad = freezed,Object? diasVacaciones = freezed,Object? hasSignature = null,Object? registeredAt = freezed,Object? terminatedAt = freezed,Object? ineUrl = freezed,Object? actaNacimientoUrl = freezed,Object? constanciaEstudioUrl = freezed,Object? estadoCuentaUrl = freezed,Object? constanciaSituacionFiscalUrl = freezed,Object? curpUrl = freezed,Object? nssUrl = freezed,Object? altaImssUrl = freezed,Object? comprobanteDomicilioUrl = freezed,Object? avisoInfonavitUrl = freezed,Object? cartaRecomendacion1Url = freezed,Object? cartaRecomendacion2Url = freezed,Object? cartaRecomendacion3Url = freezed,Object? cartaNoAntecedentesPenalesUrl = freezed,Object? contratoLaboralUrl = freezed,Object? cvUrl = freezed,Object? cartaOfertaUrl = freezed,Object? examenMedicoUrl = freezed,Object? cartaRenunciaUrl = freezed,Object? finiquitoUrl = freezed,Object? bajaImssUrl = freezed,Object? comprobanteFiniquitoUrl = freezed,}) {
  return _then(_EmpleadoApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as int,jefeRef: null == jefeRef ? _self.jefeRef : jefeRef // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,fechaNacimiento: null == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as Escolaridad,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,nss: null == nss ? _self.nss : nss // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,montoRetencionInfonavit: null == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double,puestoRef: null == puestoRef ? _self.puestoRef : puestoRef // ignore: cast_nullable_to_non_nullable
as int,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EmpleadoEstatus,salario: null == salario ? _self.salario : salario // ignore: cast_nullable_to_non_nullable
as double,antiguedad: freezed == antiguedad ? _self.antiguedad : antiguedad // ignore: cast_nullable_to_non_nullable
as int?,diasVacaciones: freezed == diasVacaciones ? _self.diasVacaciones : diasVacaciones // ignore: cast_nullable_to_non_nullable
as int?,hasSignature: null == hasSignature ? _self.hasSignature : hasSignature // ignore: cast_nullable_to_non_nullable
as bool,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,terminatedAt: freezed == terminatedAt ? _self.terminatedAt : terminatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ineUrl: freezed == ineUrl ? _self.ineUrl : ineUrl // ignore: cast_nullable_to_non_nullable
as String?,actaNacimientoUrl: freezed == actaNacimientoUrl ? _self.actaNacimientoUrl : actaNacimientoUrl // ignore: cast_nullable_to_non_nullable
as String?,constanciaEstudioUrl: freezed == constanciaEstudioUrl ? _self.constanciaEstudioUrl : constanciaEstudioUrl // ignore: cast_nullable_to_non_nullable
as String?,estadoCuentaUrl: freezed == estadoCuentaUrl ? _self.estadoCuentaUrl : estadoCuentaUrl // ignore: cast_nullable_to_non_nullable
as String?,constanciaSituacionFiscalUrl: freezed == constanciaSituacionFiscalUrl ? _self.constanciaSituacionFiscalUrl : constanciaSituacionFiscalUrl // ignore: cast_nullable_to_non_nullable
as String?,curpUrl: freezed == curpUrl ? _self.curpUrl : curpUrl // ignore: cast_nullable_to_non_nullable
as String?,nssUrl: freezed == nssUrl ? _self.nssUrl : nssUrl // ignore: cast_nullable_to_non_nullable
as String?,altaImssUrl: freezed == altaImssUrl ? _self.altaImssUrl : altaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,comprobanteDomicilioUrl: freezed == comprobanteDomicilioUrl ? _self.comprobanteDomicilioUrl : comprobanteDomicilioUrl // ignore: cast_nullable_to_non_nullable
as String?,avisoInfonavitUrl: freezed == avisoInfonavitUrl ? _self.avisoInfonavitUrl : avisoInfonavitUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion1Url: freezed == cartaRecomendacion1Url ? _self.cartaRecomendacion1Url : cartaRecomendacion1Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion2Url: freezed == cartaRecomendacion2Url ? _self.cartaRecomendacion2Url : cartaRecomendacion2Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion3Url: freezed == cartaRecomendacion3Url ? _self.cartaRecomendacion3Url : cartaRecomendacion3Url // ignore: cast_nullable_to_non_nullable
as String?,cartaNoAntecedentesPenalesUrl: freezed == cartaNoAntecedentesPenalesUrl ? _self.cartaNoAntecedentesPenalesUrl : cartaNoAntecedentesPenalesUrl // ignore: cast_nullable_to_non_nullable
as String?,contratoLaboralUrl: freezed == contratoLaboralUrl ? _self.contratoLaboralUrl : contratoLaboralUrl // ignore: cast_nullable_to_non_nullable
as String?,cvUrl: freezed == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaOfertaUrl: freezed == cartaOfertaUrl ? _self.cartaOfertaUrl : cartaOfertaUrl // ignore: cast_nullable_to_non_nullable
as String?,examenMedicoUrl: freezed == examenMedicoUrl ? _self.examenMedicoUrl : examenMedicoUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaRenunciaUrl: freezed == cartaRenunciaUrl ? _self.cartaRenunciaUrl : cartaRenunciaUrl // ignore: cast_nullable_to_non_nullable
as String?,finiquitoUrl: freezed == finiquitoUrl ? _self.finiquitoUrl : finiquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,bajaImssUrl: freezed == bajaImssUrl ? _self.bajaImssUrl : bajaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,comprobanteFiniquitoUrl: freezed == comprobanteFiniquitoUrl ? _self.comprobanteFiniquitoUrl : comprobanteFiniquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

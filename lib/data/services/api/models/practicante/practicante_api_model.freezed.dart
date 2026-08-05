// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practicante_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PracticanteApiModel implements DiagnosticableTreeMixin {

 int get id;@JsonKey(name: 'estado') StatusPracticante? get status;@JsonKey(name: 'tipo') TypePracticante get type;@JsonKey(name: 'nombre_completo') String get name;@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) double get salary;@JsonKey(name: 'universidad') int get universityRef;@JsonKey(name: 'puesto') int get puestoRef; DateTime get fechaNacimiento; String get clabeInterbancaria; String get numeroContacto; String get contactoEmergencia; String get curp; String get rfc;@JsonKey(name: 'numero_seguro_social') String get nss;@JsonKey(name: 'direccion_completa') String get direccion;@JsonKey(defaultValue: 0, name: 'usuario') int get userRef;@JsonKey(defaultValue: 0, name: 'jefe') int get jefeRef;@JsonKey(name: 'identificacion_oficial') String? get ineUrl;@JsonKey(name: 'acta_nacimiento') String? get actaNacimientoUrl;@JsonKey(name: 'estado_cuenta') String? get estadoCuentaUrl;@JsonKey(name: 'pdf_curp') String? get curpUrl;@JsonKey(name: 'pdf_rfc') String? get rfcUrl;@JsonKey(name: 'pdf_numero_seguro_social') String? get nssUrl;@JsonKey(name: 'comprobante_domicilio') String? get domicilioUrl;@JsonKey(name: 'carta_presentacion') String? get cartaPresentacionUrl;@JsonKey(name: 'curriculum_vitae') String? get cvUrl;@JsonKey(name: 'fecha_alta') DateTime? get registeredAt;@JsonKey(name: 'fecha_baja') DateTime? get terminatedAt;
/// Create a copy of PracticanteApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PracticanteApiModelCopyWith<PracticanteApiModel> get copyWith => _$PracticanteApiModelCopyWithImpl<PracticanteApiModel>(this as PracticanteApiModel, _$identity);

  /// Serializes this PracticanteApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PracticanteApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('salary', salary))..add(DiagnosticsProperty('universityRef', universityRef))..add(DiagnosticsProperty('puestoRef', puestoRef))..add(DiagnosticsProperty('fechaNacimiento', fechaNacimiento))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('nss', nss))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('userRef', userRef))..add(DiagnosticsProperty('jefeRef', jefeRef))..add(DiagnosticsProperty('ineUrl', ineUrl))..add(DiagnosticsProperty('actaNacimientoUrl', actaNacimientoUrl))..add(DiagnosticsProperty('estadoCuentaUrl', estadoCuentaUrl))..add(DiagnosticsProperty('curpUrl', curpUrl))..add(DiagnosticsProperty('rfcUrl', rfcUrl))..add(DiagnosticsProperty('nssUrl', nssUrl))..add(DiagnosticsProperty('domicilioUrl', domicilioUrl))..add(DiagnosticsProperty('cartaPresentacionUrl', cartaPresentacionUrl))..add(DiagnosticsProperty('cvUrl', cvUrl))..add(DiagnosticsProperty('registeredAt', registeredAt))..add(DiagnosticsProperty('terminatedAt', terminatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PracticanteApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.universityRef, universityRef) || other.universityRef == universityRef)&&(identical(other.puestoRef, puestoRef) || other.puestoRef == puestoRef)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.nss, nss) || other.nss == nss)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.userRef, userRef) || other.userRef == userRef)&&(identical(other.jefeRef, jefeRef) || other.jefeRef == jefeRef)&&(identical(other.ineUrl, ineUrl) || other.ineUrl == ineUrl)&&(identical(other.actaNacimientoUrl, actaNacimientoUrl) || other.actaNacimientoUrl == actaNacimientoUrl)&&(identical(other.estadoCuentaUrl, estadoCuentaUrl) || other.estadoCuentaUrl == estadoCuentaUrl)&&(identical(other.curpUrl, curpUrl) || other.curpUrl == curpUrl)&&(identical(other.rfcUrl, rfcUrl) || other.rfcUrl == rfcUrl)&&(identical(other.nssUrl, nssUrl) || other.nssUrl == nssUrl)&&(identical(other.domicilioUrl, domicilioUrl) || other.domicilioUrl == domicilioUrl)&&(identical(other.cartaPresentacionUrl, cartaPresentacionUrl) || other.cartaPresentacionUrl == cartaPresentacionUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.terminatedAt, terminatedAt) || other.terminatedAt == terminatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,type,name,salary,universityRef,puestoRef,fechaNacimiento,clabeInterbancaria,numeroContacto,contactoEmergencia,curp,rfc,nss,direccion,userRef,jefeRef,ineUrl,actaNacimientoUrl,estadoCuentaUrl,curpUrl,rfcUrl,nssUrl,domicilioUrl,cartaPresentacionUrl,cvUrl,registeredAt,terminatedAt]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PracticanteApiModel(id: $id, status: $status, type: $type, name: $name, salary: $salary, universityRef: $universityRef, puestoRef: $puestoRef, fechaNacimiento: $fechaNacimiento, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, curp: $curp, rfc: $rfc, nss: $nss, direccion: $direccion, userRef: $userRef, jefeRef: $jefeRef, ineUrl: $ineUrl, actaNacimientoUrl: $actaNacimientoUrl, estadoCuentaUrl: $estadoCuentaUrl, curpUrl: $curpUrl, rfcUrl: $rfcUrl, nssUrl: $nssUrl, domicilioUrl: $domicilioUrl, cartaPresentacionUrl: $cartaPresentacionUrl, cvUrl: $cvUrl, registeredAt: $registeredAt, terminatedAt: $terminatedAt)';
}


}

/// @nodoc
abstract mixin class $PracticanteApiModelCopyWith<$Res>  {
  factory $PracticanteApiModelCopyWith(PracticanteApiModel value, $Res Function(PracticanteApiModel) _then) = _$PracticanteApiModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'estado') StatusPracticante? status,@JsonKey(name: 'tipo') TypePracticante type,@JsonKey(name: 'nombre_completo') String name,@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) double salary,@JsonKey(name: 'universidad') int universityRef,@JsonKey(name: 'puesto') int puestoRef, DateTime fechaNacimiento, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String curp, String rfc,@JsonKey(name: 'numero_seguro_social') String nss,@JsonKey(name: 'direccion_completa') String direccion,@JsonKey(defaultValue: 0, name: 'usuario') int userRef,@JsonKey(defaultValue: 0, name: 'jefe') int jefeRef,@JsonKey(name: 'identificacion_oficial') String? ineUrl,@JsonKey(name: 'acta_nacimiento') String? actaNacimientoUrl,@JsonKey(name: 'estado_cuenta') String? estadoCuentaUrl,@JsonKey(name: 'pdf_curp') String? curpUrl,@JsonKey(name: 'pdf_rfc') String? rfcUrl,@JsonKey(name: 'pdf_numero_seguro_social') String? nssUrl,@JsonKey(name: 'comprobante_domicilio') String? domicilioUrl,@JsonKey(name: 'carta_presentacion') String? cartaPresentacionUrl,@JsonKey(name: 'curriculum_vitae') String? cvUrl,@JsonKey(name: 'fecha_alta') DateTime? registeredAt,@JsonKey(name: 'fecha_baja') DateTime? terminatedAt
});




}
/// @nodoc
class _$PracticanteApiModelCopyWithImpl<$Res>
    implements $PracticanteApiModelCopyWith<$Res> {
  _$PracticanteApiModelCopyWithImpl(this._self, this._then);

  final PracticanteApiModel _self;
  final $Res Function(PracticanteApiModel) _then;

/// Create a copy of PracticanteApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = freezed,Object? type = null,Object? name = null,Object? salary = null,Object? universityRef = null,Object? puestoRef = null,Object? fechaNacimiento = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? curp = null,Object? rfc = null,Object? nss = null,Object? direccion = null,Object? userRef = null,Object? jefeRef = null,Object? ineUrl = freezed,Object? actaNacimientoUrl = freezed,Object? estadoCuentaUrl = freezed,Object? curpUrl = freezed,Object? rfcUrl = freezed,Object? nssUrl = freezed,Object? domicilioUrl = freezed,Object? cartaPresentacionUrl = freezed,Object? cvUrl = freezed,Object? registeredAt = freezed,Object? terminatedAt = freezed,}) {
  return _then(PracticanteApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusPracticante?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypePracticante,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as double,universityRef: null == universityRef ? _self.universityRef : universityRef // ignore: cast_nullable_to_non_nullable
as int,puestoRef: null == puestoRef ? _self.puestoRef : puestoRef // ignore: cast_nullable_to_non_nullable
as int,fechaNacimiento: null == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,nss: null == nss ? _self.nss : nss // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as int,jefeRef: null == jefeRef ? _self.jefeRef : jefeRef // ignore: cast_nullable_to_non_nullable
as int,ineUrl: freezed == ineUrl ? _self.ineUrl : ineUrl // ignore: cast_nullable_to_non_nullable
as String?,actaNacimientoUrl: freezed == actaNacimientoUrl ? _self.actaNacimientoUrl : actaNacimientoUrl // ignore: cast_nullable_to_non_nullable
as String?,estadoCuentaUrl: freezed == estadoCuentaUrl ? _self.estadoCuentaUrl : estadoCuentaUrl // ignore: cast_nullable_to_non_nullable
as String?,curpUrl: freezed == curpUrl ? _self.curpUrl : curpUrl // ignore: cast_nullable_to_non_nullable
as String?,rfcUrl: freezed == rfcUrl ? _self.rfcUrl : rfcUrl // ignore: cast_nullable_to_non_nullable
as String?,nssUrl: freezed == nssUrl ? _self.nssUrl : nssUrl // ignore: cast_nullable_to_non_nullable
as String?,domicilioUrl: freezed == domicilioUrl ? _self.domicilioUrl : domicilioUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaPresentacionUrl: freezed == cartaPresentacionUrl ? _self.cartaPresentacionUrl : cartaPresentacionUrl // ignore: cast_nullable_to_non_nullable
as String?,cvUrl: freezed == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String?,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,terminatedAt: freezed == terminatedAt ? _self.terminatedAt : terminatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PracticanteApiModel].
extension PracticanteApiModelPatterns on PracticanteApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PracticanteApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PracticanteApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PracticanteApiModel value)  $default,){
final _that = this;
switch (_that) {
case _PracticanteApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PracticanteApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _PracticanteApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'estado')  StatusPracticante? status, @JsonKey(name: 'tipo')  TypePracticante type, @JsonKey(name: 'nombre_completo')  String name, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)  double salary, @JsonKey(name: 'universidad')  int universityRef, @JsonKey(name: 'puesto')  int puestoRef,  DateTime fechaNacimiento,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String curp,  String rfc, @JsonKey(name: 'numero_seguro_social')  String nss, @JsonKey(name: 'direccion_completa')  String direccion, @JsonKey(defaultValue: 0, name: 'usuario')  int userRef, @JsonKey(defaultValue: 0, name: 'jefe')  int jefeRef, @JsonKey(name: 'identificacion_oficial')  String? ineUrl, @JsonKey(name: 'acta_nacimiento')  String? actaNacimientoUrl, @JsonKey(name: 'estado_cuenta')  String? estadoCuentaUrl, @JsonKey(name: 'pdf_curp')  String? curpUrl, @JsonKey(name: 'pdf_rfc')  String? rfcUrl, @JsonKey(name: 'pdf_numero_seguro_social')  String? nssUrl, @JsonKey(name: 'comprobante_domicilio')  String? domicilioUrl, @JsonKey(name: 'carta_presentacion')  String? cartaPresentacionUrl, @JsonKey(name: 'curriculum_vitae')  String? cvUrl, @JsonKey(name: 'fecha_alta')  DateTime? registeredAt, @JsonKey(name: 'fecha_baja')  DateTime? terminatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PracticanteApiModel() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.name,_that.salary,_that.universityRef,_that.puestoRef,_that.fechaNacimiento,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.curp,_that.rfc,_that.nss,_that.direccion,_that.userRef,_that.jefeRef,_that.ineUrl,_that.actaNacimientoUrl,_that.estadoCuentaUrl,_that.curpUrl,_that.rfcUrl,_that.nssUrl,_that.domicilioUrl,_that.cartaPresentacionUrl,_that.cvUrl,_that.registeredAt,_that.terminatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'estado')  StatusPracticante? status, @JsonKey(name: 'tipo')  TypePracticante type, @JsonKey(name: 'nombre_completo')  String name, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)  double salary, @JsonKey(name: 'universidad')  int universityRef, @JsonKey(name: 'puesto')  int puestoRef,  DateTime fechaNacimiento,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String curp,  String rfc, @JsonKey(name: 'numero_seguro_social')  String nss, @JsonKey(name: 'direccion_completa')  String direccion, @JsonKey(defaultValue: 0, name: 'usuario')  int userRef, @JsonKey(defaultValue: 0, name: 'jefe')  int jefeRef, @JsonKey(name: 'identificacion_oficial')  String? ineUrl, @JsonKey(name: 'acta_nacimiento')  String? actaNacimientoUrl, @JsonKey(name: 'estado_cuenta')  String? estadoCuentaUrl, @JsonKey(name: 'pdf_curp')  String? curpUrl, @JsonKey(name: 'pdf_rfc')  String? rfcUrl, @JsonKey(name: 'pdf_numero_seguro_social')  String? nssUrl, @JsonKey(name: 'comprobante_domicilio')  String? domicilioUrl, @JsonKey(name: 'carta_presentacion')  String? cartaPresentacionUrl, @JsonKey(name: 'curriculum_vitae')  String? cvUrl, @JsonKey(name: 'fecha_alta')  DateTime? registeredAt, @JsonKey(name: 'fecha_baja')  DateTime? terminatedAt)  $default,) {final _that = this;
switch (_that) {
case _PracticanteApiModel():
return $default(_that.id,_that.status,_that.type,_that.name,_that.salary,_that.universityRef,_that.puestoRef,_that.fechaNacimiento,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.curp,_that.rfc,_that.nss,_that.direccion,_that.userRef,_that.jefeRef,_that.ineUrl,_that.actaNacimientoUrl,_that.estadoCuentaUrl,_that.curpUrl,_that.rfcUrl,_that.nssUrl,_that.domicilioUrl,_that.cartaPresentacionUrl,_that.cvUrl,_that.registeredAt,_that.terminatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'estado')  StatusPracticante? status, @JsonKey(name: 'tipo')  TypePracticante type, @JsonKey(name: 'nombre_completo')  String name, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson)  double salary, @JsonKey(name: 'universidad')  int universityRef, @JsonKey(name: 'puesto')  int puestoRef,  DateTime fechaNacimiento,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String curp,  String rfc, @JsonKey(name: 'numero_seguro_social')  String nss, @JsonKey(name: 'direccion_completa')  String direccion, @JsonKey(defaultValue: 0, name: 'usuario')  int userRef, @JsonKey(defaultValue: 0, name: 'jefe')  int jefeRef, @JsonKey(name: 'identificacion_oficial')  String? ineUrl, @JsonKey(name: 'acta_nacimiento')  String? actaNacimientoUrl, @JsonKey(name: 'estado_cuenta')  String? estadoCuentaUrl, @JsonKey(name: 'pdf_curp')  String? curpUrl, @JsonKey(name: 'pdf_rfc')  String? rfcUrl, @JsonKey(name: 'pdf_numero_seguro_social')  String? nssUrl, @JsonKey(name: 'comprobante_domicilio')  String? domicilioUrl, @JsonKey(name: 'carta_presentacion')  String? cartaPresentacionUrl, @JsonKey(name: 'curriculum_vitae')  String? cvUrl, @JsonKey(name: 'fecha_alta')  DateTime? registeredAt, @JsonKey(name: 'fecha_baja')  DateTime? terminatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PracticanteApiModel() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.name,_that.salary,_that.universityRef,_that.puestoRef,_that.fechaNacimiento,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.curp,_that.rfc,_that.nss,_that.direccion,_that.userRef,_that.jefeRef,_that.ineUrl,_that.actaNacimientoUrl,_that.estadoCuentaUrl,_that.curpUrl,_that.rfcUrl,_that.nssUrl,_that.domicilioUrl,_that.cartaPresentacionUrl,_that.cvUrl,_that.registeredAt,_that.terminatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PracticanteApiModel with DiagnosticableTreeMixin implements PracticanteApiModel {
  const _PracticanteApiModel({this.id = 0, @JsonKey(name: 'estado') this.status, @JsonKey(name: 'tipo') required this.type, @JsonKey(name: 'nombre_completo') required this.name, @JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) required this.salary, @JsonKey(name: 'universidad') required this.universityRef, @JsonKey(name: 'puesto') required this.puestoRef, required this.fechaNacimiento, required this.clabeInterbancaria, required this.numeroContacto, required this.contactoEmergencia, required this.curp, required this.rfc, @JsonKey(name: 'numero_seguro_social') required this.nss, @JsonKey(name: 'direccion_completa') required this.direccion, @JsonKey(defaultValue: 0, name: 'usuario') required this.userRef, @JsonKey(defaultValue: 0, name: 'jefe') required this.jefeRef, @JsonKey(name: 'identificacion_oficial') this.ineUrl, @JsonKey(name: 'acta_nacimiento') this.actaNacimientoUrl, @JsonKey(name: 'estado_cuenta') this.estadoCuentaUrl, @JsonKey(name: 'pdf_curp') this.curpUrl, @JsonKey(name: 'pdf_rfc') this.rfcUrl, @JsonKey(name: 'pdf_numero_seguro_social') this.nssUrl, @JsonKey(name: 'comprobante_domicilio') this.domicilioUrl, @JsonKey(name: 'carta_presentacion') this.cartaPresentacionUrl, @JsonKey(name: 'curriculum_vitae') this.cvUrl, @JsonKey(name: 'fecha_alta') this.registeredAt, @JsonKey(name: 'fecha_baja') this.terminatedAt});
  factory _PracticanteApiModel.fromJson(Map<String, dynamic> json) => _$PracticanteApiModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'estado') final  StatusPracticante? status;
@override@JsonKey(name: 'tipo') final  TypePracticante type;
@override@JsonKey(name: 'nombre_completo') final  String name;
@override@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) final  double salary;
@override@JsonKey(name: 'universidad') final  int universityRef;
@override@JsonKey(name: 'puesto') final  int puestoRef;
@override final  DateTime fechaNacimiento;
@override final  String clabeInterbancaria;
@override final  String numeroContacto;
@override final  String contactoEmergencia;
@override final  String curp;
@override final  String rfc;
@override@JsonKey(name: 'numero_seguro_social') final  String nss;
@override@JsonKey(name: 'direccion_completa') final  String direccion;
@override@JsonKey(defaultValue: 0, name: 'usuario') final  int userRef;
@override@JsonKey(defaultValue: 0, name: 'jefe') final  int jefeRef;
@override@JsonKey(name: 'identificacion_oficial') final  String? ineUrl;
@override@JsonKey(name: 'acta_nacimiento') final  String? actaNacimientoUrl;
@override@JsonKey(name: 'estado_cuenta') final  String? estadoCuentaUrl;
@override@JsonKey(name: 'pdf_curp') final  String? curpUrl;
@override@JsonKey(name: 'pdf_rfc') final  String? rfcUrl;
@override@JsonKey(name: 'pdf_numero_seguro_social') final  String? nssUrl;
@override@JsonKey(name: 'comprobante_domicilio') final  String? domicilioUrl;
@override@JsonKey(name: 'carta_presentacion') final  String? cartaPresentacionUrl;
@override@JsonKey(name: 'curriculum_vitae') final  String? cvUrl;
@override@JsonKey(name: 'fecha_alta') final  DateTime? registeredAt;
@override@JsonKey(name: 'fecha_baja') final  DateTime? terminatedAt;

/// Create a copy of PracticanteApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PracticanteApiModelCopyWith<_PracticanteApiModel> get copyWith => __$PracticanteApiModelCopyWithImpl<_PracticanteApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PracticanteApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PracticanteApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('salary', salary))..add(DiagnosticsProperty('universityRef', universityRef))..add(DiagnosticsProperty('puestoRef', puestoRef))..add(DiagnosticsProperty('fechaNacimiento', fechaNacimiento))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('nss', nss))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('userRef', userRef))..add(DiagnosticsProperty('jefeRef', jefeRef))..add(DiagnosticsProperty('ineUrl', ineUrl))..add(DiagnosticsProperty('actaNacimientoUrl', actaNacimientoUrl))..add(DiagnosticsProperty('estadoCuentaUrl', estadoCuentaUrl))..add(DiagnosticsProperty('curpUrl', curpUrl))..add(DiagnosticsProperty('rfcUrl', rfcUrl))..add(DiagnosticsProperty('nssUrl', nssUrl))..add(DiagnosticsProperty('domicilioUrl', domicilioUrl))..add(DiagnosticsProperty('cartaPresentacionUrl', cartaPresentacionUrl))..add(DiagnosticsProperty('cvUrl', cvUrl))..add(DiagnosticsProperty('registeredAt', registeredAt))..add(DiagnosticsProperty('terminatedAt', terminatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PracticanteApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.universityRef, universityRef) || other.universityRef == universityRef)&&(identical(other.puestoRef, puestoRef) || other.puestoRef == puestoRef)&&(identical(other.fechaNacimiento, fechaNacimiento) || other.fechaNacimiento == fechaNacimiento)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.nss, nss) || other.nss == nss)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.userRef, userRef) || other.userRef == userRef)&&(identical(other.jefeRef, jefeRef) || other.jefeRef == jefeRef)&&(identical(other.ineUrl, ineUrl) || other.ineUrl == ineUrl)&&(identical(other.actaNacimientoUrl, actaNacimientoUrl) || other.actaNacimientoUrl == actaNacimientoUrl)&&(identical(other.estadoCuentaUrl, estadoCuentaUrl) || other.estadoCuentaUrl == estadoCuentaUrl)&&(identical(other.curpUrl, curpUrl) || other.curpUrl == curpUrl)&&(identical(other.rfcUrl, rfcUrl) || other.rfcUrl == rfcUrl)&&(identical(other.nssUrl, nssUrl) || other.nssUrl == nssUrl)&&(identical(other.domicilioUrl, domicilioUrl) || other.domicilioUrl == domicilioUrl)&&(identical(other.cartaPresentacionUrl, cartaPresentacionUrl) || other.cartaPresentacionUrl == cartaPresentacionUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.terminatedAt, terminatedAt) || other.terminatedAt == terminatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,type,name,salary,universityRef,puestoRef,fechaNacimiento,clabeInterbancaria,numeroContacto,contactoEmergencia,curp,rfc,nss,direccion,userRef,jefeRef,ineUrl,actaNacimientoUrl,estadoCuentaUrl,curpUrl,rfcUrl,nssUrl,domicilioUrl,cartaPresentacionUrl,cvUrl,registeredAt,terminatedAt]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PracticanteApiModel(id: $id, status: $status, type: $type, name: $name, salary: $salary, universityRef: $universityRef, puestoRef: $puestoRef, fechaNacimiento: $fechaNacimiento, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, curp: $curp, rfc: $rfc, nss: $nss, direccion: $direccion, userRef: $userRef, jefeRef: $jefeRef, ineUrl: $ineUrl, actaNacimientoUrl: $actaNacimientoUrl, estadoCuentaUrl: $estadoCuentaUrl, curpUrl: $curpUrl, rfcUrl: $rfcUrl, nssUrl: $nssUrl, domicilioUrl: $domicilioUrl, cartaPresentacionUrl: $cartaPresentacionUrl, cvUrl: $cvUrl, registeredAt: $registeredAt, terminatedAt: $terminatedAt)';
}


}

/// @nodoc
abstract mixin class _$PracticanteApiModelCopyWith<$Res> implements $PracticanteApiModelCopyWith<$Res> {
  factory _$PracticanteApiModelCopyWith(_PracticanteApiModel value, $Res Function(_PracticanteApiModel) _then) = __$PracticanteApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'estado') StatusPracticante? status,@JsonKey(name: 'tipo') TypePracticante type,@JsonKey(name: 'nombre_completo') String name,@JsonKey(name: 'salario_diario', fromJson: _doubleFromJson) double salary,@JsonKey(name: 'universidad') int universityRef,@JsonKey(name: 'puesto') int puestoRef, DateTime fechaNacimiento, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String curp, String rfc,@JsonKey(name: 'numero_seguro_social') String nss,@JsonKey(name: 'direccion_completa') String direccion,@JsonKey(defaultValue: 0, name: 'usuario') int userRef,@JsonKey(defaultValue: 0, name: 'jefe') int jefeRef,@JsonKey(name: 'identificacion_oficial') String? ineUrl,@JsonKey(name: 'acta_nacimiento') String? actaNacimientoUrl,@JsonKey(name: 'estado_cuenta') String? estadoCuentaUrl,@JsonKey(name: 'pdf_curp') String? curpUrl,@JsonKey(name: 'pdf_rfc') String? rfcUrl,@JsonKey(name: 'pdf_numero_seguro_social') String? nssUrl,@JsonKey(name: 'comprobante_domicilio') String? domicilioUrl,@JsonKey(name: 'carta_presentacion') String? cartaPresentacionUrl,@JsonKey(name: 'curriculum_vitae') String? cvUrl,@JsonKey(name: 'fecha_alta') DateTime? registeredAt,@JsonKey(name: 'fecha_baja') DateTime? terminatedAt
});




}
/// @nodoc
class __$PracticanteApiModelCopyWithImpl<$Res>
    implements _$PracticanteApiModelCopyWith<$Res> {
  __$PracticanteApiModelCopyWithImpl(this._self, this._then);

  final _PracticanteApiModel _self;
  final $Res Function(_PracticanteApiModel) _then;

/// Create a copy of PracticanteApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = freezed,Object? type = null,Object? name = null,Object? salary = null,Object? universityRef = null,Object? puestoRef = null,Object? fechaNacimiento = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? curp = null,Object? rfc = null,Object? nss = null,Object? direccion = null,Object? userRef = null,Object? jefeRef = null,Object? ineUrl = freezed,Object? actaNacimientoUrl = freezed,Object? estadoCuentaUrl = freezed,Object? curpUrl = freezed,Object? rfcUrl = freezed,Object? nssUrl = freezed,Object? domicilioUrl = freezed,Object? cartaPresentacionUrl = freezed,Object? cvUrl = freezed,Object? registeredAt = freezed,Object? terminatedAt = freezed,}) {
  return _then(_PracticanteApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusPracticante?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypePracticante,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,salary: null == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as double,universityRef: null == universityRef ? _self.universityRef : universityRef // ignore: cast_nullable_to_non_nullable
as int,puestoRef: null == puestoRef ? _self.puestoRef : puestoRef // ignore: cast_nullable_to_non_nullable
as int,fechaNacimiento: null == fechaNacimiento ? _self.fechaNacimiento : fechaNacimiento // ignore: cast_nullable_to_non_nullable
as DateTime,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,nss: null == nss ? _self.nss : nss // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as int,jefeRef: null == jefeRef ? _self.jefeRef : jefeRef // ignore: cast_nullable_to_non_nullable
as int,ineUrl: freezed == ineUrl ? _self.ineUrl : ineUrl // ignore: cast_nullable_to_non_nullable
as String?,actaNacimientoUrl: freezed == actaNacimientoUrl ? _self.actaNacimientoUrl : actaNacimientoUrl // ignore: cast_nullable_to_non_nullable
as String?,estadoCuentaUrl: freezed == estadoCuentaUrl ? _self.estadoCuentaUrl : estadoCuentaUrl // ignore: cast_nullable_to_non_nullable
as String?,curpUrl: freezed == curpUrl ? _self.curpUrl : curpUrl // ignore: cast_nullable_to_non_nullable
as String?,rfcUrl: freezed == rfcUrl ? _self.rfcUrl : rfcUrl // ignore: cast_nullable_to_non_nullable
as String?,nssUrl: freezed == nssUrl ? _self.nssUrl : nssUrl // ignore: cast_nullable_to_non_nullable
as String?,domicilioUrl: freezed == domicilioUrl ? _self.domicilioUrl : domicilioUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaPresentacionUrl: freezed == cartaPresentacionUrl ? _self.cartaPresentacionUrl : cartaPresentacionUrl // ignore: cast_nullable_to_non_nullable
as String?,cvUrl: freezed == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String?,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,terminatedAt: freezed == terminatedAt ? _self.terminatedAt : terminatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

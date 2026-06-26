// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departamento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Departamento implements DiagnosticableTreeMixin {

 int get id; String get nombre; String get descripcion; double get presupuesto; Divisa get divisa; Lider? get lider;
/// Create a copy of Departamento
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartamentoCopyWith<Departamento> get copyWith => _$DepartamentoCopyWithImpl<Departamento>(this as Departamento, _$identity);

  /// Serializes this Departamento to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Departamento'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('descripcion', descripcion))..add(DiagnosticsProperty('presupuesto', presupuesto))..add(DiagnosticsProperty('divisa', divisa))..add(DiagnosticsProperty('lider', lider));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Departamento&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.presupuesto, presupuesto) || other.presupuesto == presupuesto)&&(identical(other.divisa, divisa) || other.divisa == divisa)&&(identical(other.lider, lider) || other.lider == lider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,presupuesto,divisa,lider);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Departamento(id: $id, nombre: $nombre, descripcion: $descripcion, presupuesto: $presupuesto, divisa: $divisa, lider: $lider)';
}


}

/// @nodoc
abstract mixin class $DepartamentoCopyWith<$Res>  {
  factory $DepartamentoCopyWith(Departamento value, $Res Function(Departamento) _then) = _$DepartamentoCopyWithImpl;
@useResult
$Res call({
 int id, String nombre, String descripcion, double presupuesto, Divisa divisa, Lider? lider
});


$LiderCopyWith<$Res>? get lider;

}
/// @nodoc
class _$DepartamentoCopyWithImpl<$Res>
    implements $DepartamentoCopyWith<$Res> {
  _$DepartamentoCopyWithImpl(this._self, this._then);

  final Departamento _self;
  final $Res Function(Departamento) _then;

/// Create a copy of Departamento
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? presupuesto = null,Object? divisa = null,Object? lider = freezed,}) {
  return _then(Departamento(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,presupuesto: null == presupuesto ? _self.presupuesto : presupuesto // ignore: cast_nullable_to_non_nullable
as double,divisa: null == divisa ? _self.divisa : divisa // ignore: cast_nullable_to_non_nullable
as Divisa,lider: freezed == lider ? _self.lider : lider // ignore: cast_nullable_to_non_nullable
as Lider?,
  ));
}
/// Create a copy of Departamento
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiderCopyWith<$Res>? get lider {
    if (_self.lider == null) {
    return null;
  }

  return $LiderCopyWith<$Res>(_self.lider!, (value) {
    return _then(_self.copyWith(lider: value));
  });
}
}


/// Adds pattern-matching-related methods to [Departamento].
extension DepartamentoPatterns on Departamento {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Departamento value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Departamento() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Departamento value)  $default,){
final _that = this;
switch (_that) {
case _Departamento():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Departamento value)?  $default,){
final _that = this;
switch (_that) {
case _Departamento() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nombre,  String descripcion,  double presupuesto,  Divisa divisa,  Lider? lider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Departamento() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.presupuesto,_that.divisa,_that.lider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nombre,  String descripcion,  double presupuesto,  Divisa divisa,  Lider? lider)  $default,) {final _that = this;
switch (_that) {
case _Departamento():
return $default(_that.id,_that.nombre,_that.descripcion,_that.presupuesto,_that.divisa,_that.lider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nombre,  String descripcion,  double presupuesto,  Divisa divisa,  Lider? lider)?  $default,) {final _that = this;
switch (_that) {
case _Departamento() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.presupuesto,_that.divisa,_that.lider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Departamento with DiagnosticableTreeMixin implements Departamento {
  const _Departamento({required this.id, required this.nombre, required this.descripcion, required this.presupuesto, required this.divisa, this.lider});
  factory _Departamento.fromJson(Map<String, dynamic> json) => _$DepartamentoFromJson(json);

@override final  int id;
@override final  String nombre;
@override final  String descripcion;
@override final  double presupuesto;
@override final  Divisa divisa;
@override final  Lider? lider;

/// Create a copy of Departamento
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartamentoCopyWith<_Departamento> get copyWith => __$DepartamentoCopyWithImpl<_Departamento>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartamentoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Departamento'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('descripcion', descripcion))..add(DiagnosticsProperty('presupuesto', presupuesto))..add(DiagnosticsProperty('divisa', divisa))..add(DiagnosticsProperty('lider', lider));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Departamento&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.presupuesto, presupuesto) || other.presupuesto == presupuesto)&&(identical(other.divisa, divisa) || other.divisa == divisa)&&(identical(other.lider, lider) || other.lider == lider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,presupuesto,divisa,lider);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Departamento(id: $id, nombre: $nombre, descripcion: $descripcion, presupuesto: $presupuesto, divisa: $divisa, lider: $lider)';
}


}

/// @nodoc
abstract mixin class _$DepartamentoCopyWith<$Res> implements $DepartamentoCopyWith<$Res> {
  factory _$DepartamentoCopyWith(_Departamento value, $Res Function(_Departamento) _then) = __$DepartamentoCopyWithImpl;
@override @useResult
$Res call({
 int id, String nombre, String descripcion, double presupuesto, Divisa divisa, Lider? lider
});


@override $LiderCopyWith<$Res>? get lider;

}
/// @nodoc
class __$DepartamentoCopyWithImpl<$Res>
    implements _$DepartamentoCopyWith<$Res> {
  __$DepartamentoCopyWithImpl(this._self, this._then);

  final _Departamento _self;
  final $Res Function(_Departamento) _then;

/// Create a copy of Departamento
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? presupuesto = null,Object? divisa = null,Object? lider = freezed,}) {
  return _then(_Departamento(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,presupuesto: null == presupuesto ? _self.presupuesto : presupuesto // ignore: cast_nullable_to_non_nullable
as double,divisa: null == divisa ? _self.divisa : divisa // ignore: cast_nullable_to_non_nullable
as Divisa,lider: freezed == lider ? _self.lider : lider // ignore: cast_nullable_to_non_nullable
as Lider?,
  ));
}

/// Create a copy of Departamento
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiderCopyWith<$Res>? get lider {
    if (_self.lider == null) {
    return null;
  }

  return $LiderCopyWith<$Res>(_self.lider!, (value) {
    return _then(_self.copyWith(lider: value));
  });
}
}


/// @nodoc
mixin _$Lider implements DiagnosticableTreeMixin {

 int get id; String get nombre; String get telefono; String get correo;
/// Create a copy of Lider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiderCopyWith<Lider> get copyWith => _$LiderCopyWithImpl<Lider>(this as Lider, _$identity);

  /// Serializes this Lider to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Lider'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lider&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,telefono,correo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Lider(id: $id, nombre: $nombre, telefono: $telefono, correo: $correo)';
}


}

/// @nodoc
abstract mixin class $LiderCopyWith<$Res>  {
  factory $LiderCopyWith(Lider value, $Res Function(Lider) _then) = _$LiderCopyWithImpl;
@useResult
$Res call({
 int id, String nombre, String telefono, String correo
});




}
/// @nodoc
class _$LiderCopyWithImpl<$Res>
    implements $LiderCopyWith<$Res> {
  _$LiderCopyWithImpl(this._self, this._then);

  final Lider _self;
  final $Res Function(Lider) _then;

/// Create a copy of Lider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? telefono = null,Object? correo = null,}) {
  return _then(Lider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Lider].
extension LiderPatterns on Lider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lider value)  $default,){
final _that = this;
switch (_that) {
case _Lider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lider value)?  $default,){
final _that = this;
switch (_that) {
case _Lider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nombre,  String telefono,  String correo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lider() when $default != null:
return $default(_that.id,_that.nombre,_that.telefono,_that.correo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nombre,  String telefono,  String correo)  $default,) {final _that = this;
switch (_that) {
case _Lider():
return $default(_that.id,_that.nombre,_that.telefono,_that.correo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nombre,  String telefono,  String correo)?  $default,) {final _that = this;
switch (_that) {
case _Lider() when $default != null:
return $default(_that.id,_that.nombre,_that.telefono,_that.correo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lider with DiagnosticableTreeMixin implements Lider {
  const _Lider({required this.id, required this.nombre, required this.telefono, required this.correo});
  factory _Lider.fromJson(Map<String, dynamic> json) => _$LiderFromJson(json);

@override final  int id;
@override final  String nombre;
@override final  String telefono;
@override final  String correo;

/// Create a copy of Lider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiderCopyWith<_Lider> get copyWith => __$LiderCopyWithImpl<_Lider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiderToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Lider'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lider&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,telefono,correo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Lider(id: $id, nombre: $nombre, telefono: $telefono, correo: $correo)';
}


}

/// @nodoc
abstract mixin class _$LiderCopyWith<$Res> implements $LiderCopyWith<$Res> {
  factory _$LiderCopyWith(_Lider value, $Res Function(_Lider) _then) = __$LiderCopyWithImpl;
@override @useResult
$Res call({
 int id, String nombre, String telefono, String correo
});




}
/// @nodoc
class __$LiderCopyWithImpl<$Res>
    implements _$LiderCopyWith<$Res> {
  __$LiderCopyWithImpl(this._self, this._then);

  final _Lider _self;
  final $Res Function(_Lider) _then;

/// Create a copy of Lider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? telefono = null,Object? correo = null,}) {
  return _then(_Lider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

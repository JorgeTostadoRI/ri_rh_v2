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
mixin _$PreguntaPuesto implements DiagnosticableTreeMixin {

 int? get id; CategoriaPregunta get categoria; String get texto; int get orden;
/// Create a copy of PreguntaPuesto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreguntaPuestoCopyWith<PreguntaPuesto> get copyWith => _$PreguntaPuestoCopyWithImpl<PreguntaPuesto>(this as PreguntaPuesto, _$identity);

  /// Serializes this PreguntaPuesto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PreguntaPuesto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('categoria', categoria))..add(DiagnosticsProperty('texto', texto))..add(DiagnosticsProperty('orden', orden));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreguntaPuesto&&(identical(other.id, id) || other.id == id)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.orden, orden) || other.orden == orden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoria,texto,orden);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PreguntaPuesto(id: $id, categoria: $categoria, texto: $texto, orden: $orden)';
}


}

/// @nodoc
abstract mixin class $PreguntaPuestoCopyWith<$Res>  {
  factory $PreguntaPuestoCopyWith(PreguntaPuesto value, $Res Function(PreguntaPuesto) _then) = _$PreguntaPuestoCopyWithImpl;
@useResult
$Res call({
 int? id, CategoriaPregunta categoria, String texto, int orden
});




}
/// @nodoc
class _$PreguntaPuestoCopyWithImpl<$Res>
    implements $PreguntaPuestoCopyWith<$Res> {
  _$PreguntaPuestoCopyWithImpl(this._self, this._then);

  final PreguntaPuesto _self;
  final $Res Function(PreguntaPuesto) _then;

/// Create a copy of PreguntaPuesto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoria = null,Object? texto = null,Object? orden = null,}) {
  return _then(PreguntaPuesto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as CategoriaPregunta,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PreguntaPuesto].
extension PreguntaPuestoPatterns on PreguntaPuesto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreguntaPuesto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreguntaPuesto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreguntaPuesto value)  $default,){
final _that = this;
switch (_that) {
case _PreguntaPuesto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreguntaPuesto value)?  $default,){
final _that = this;
switch (_that) {
case _PreguntaPuesto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  CategoriaPregunta categoria,  String texto,  int orden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreguntaPuesto() when $default != null:
return $default(_that.id,_that.categoria,_that.texto,_that.orden);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  CategoriaPregunta categoria,  String texto,  int orden)  $default,) {final _that = this;
switch (_that) {
case _PreguntaPuesto():
return $default(_that.id,_that.categoria,_that.texto,_that.orden);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  CategoriaPregunta categoria,  String texto,  int orden)?  $default,) {final _that = this;
switch (_that) {
case _PreguntaPuesto() when $default != null:
return $default(_that.id,_that.categoria,_that.texto,_that.orden);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreguntaPuesto with DiagnosticableTreeMixin implements PreguntaPuesto {
  const _PreguntaPuesto({this.id, required this.categoria, required this.texto, this.orden = 0});
  factory _PreguntaPuesto.fromJson(Map<String, dynamic> json) => _$PreguntaPuestoFromJson(json);

@override final  int? id;
@override final  CategoriaPregunta categoria;
@override final  String texto;
@override@JsonKey() final  int orden;

/// Create a copy of PreguntaPuesto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreguntaPuestoCopyWith<_PreguntaPuesto> get copyWith => __$PreguntaPuestoCopyWithImpl<_PreguntaPuesto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreguntaPuestoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PreguntaPuesto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('categoria', categoria))..add(DiagnosticsProperty('texto', texto))..add(DiagnosticsProperty('orden', orden));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreguntaPuesto&&(identical(other.id, id) || other.id == id)&&(identical(other.categoria, categoria) || other.categoria == categoria)&&(identical(other.texto, texto) || other.texto == texto)&&(identical(other.orden, orden) || other.orden == orden));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoria,texto,orden);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PreguntaPuesto(id: $id, categoria: $categoria, texto: $texto, orden: $orden)';
}


}

/// @nodoc
abstract mixin class _$PreguntaPuestoCopyWith<$Res> implements $PreguntaPuestoCopyWith<$Res> {
  factory _$PreguntaPuestoCopyWith(_PreguntaPuesto value, $Res Function(_PreguntaPuesto) _then) = __$PreguntaPuestoCopyWithImpl;
@override @useResult
$Res call({
 int? id, CategoriaPregunta categoria, String texto, int orden
});




}
/// @nodoc
class __$PreguntaPuestoCopyWithImpl<$Res>
    implements _$PreguntaPuestoCopyWith<$Res> {
  __$PreguntaPuestoCopyWithImpl(this._self, this._then);

  final _PreguntaPuesto _self;
  final $Res Function(_PreguntaPuesto) _then;

/// Create a copy of PreguntaPuesto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoria = null,Object? texto = null,Object? orden = null,}) {
  return _then(_PreguntaPuesto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoria: null == categoria ? _self.categoria : categoria // ignore: cast_nullable_to_non_nullable
as CategoriaPregunta,texto: null == texto ? _self.texto : texto // ignore: cast_nullable_to_non_nullable
as String,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Puesto implements DiagnosticableTreeMixin {

 int? get id; String get nombre;@JsonKey(name: 'tipos') TipoPuesto get tipo; String? get rol; String get responsabilidades;/// URL del archivo de tabulador salarial ya subido (null si aún no se
/// ha adjuntado ninguno). Para subirlo, ver [EmpleadosRepository.uploadTabuladorSalarial].
@JsonKey(name: 'tabulador_salarial') String? get tabuladorSalarialUrl; List<int> get departamentos; List<PreguntaPuesto> get preguntas;
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
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('tipo', tipo))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('responsabilidades', responsabilidades))..add(DiagnosticsProperty('tabuladorSalarialUrl', tabuladorSalarialUrl))..add(DiagnosticsProperty('departamentos', departamentos))..add(DiagnosticsProperty('preguntas', preguntas));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Puesto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.responsabilidades, responsabilidades) || other.responsabilidades == responsabilidades)&&(identical(other.tabuladorSalarialUrl, tabuladorSalarialUrl) || other.tabuladorSalarialUrl == tabuladorSalarialUrl)&&const DeepCollectionEquality().equals(other.departamentos, departamentos)&&const DeepCollectionEquality().equals(other.preguntas, preguntas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,tipo,rol,responsabilidades,tabuladorSalarialUrl,const DeepCollectionEquality().hash(departamentos),const DeepCollectionEquality().hash(preguntas));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Puesto(id: $id, nombre: $nombre, tipo: $tipo, rol: $rol, responsabilidades: $responsabilidades, tabuladorSalarialUrl: $tabuladorSalarialUrl, departamentos: $departamentos, preguntas: $preguntas)';
}


}

/// @nodoc
abstract mixin class $PuestoCopyWith<$Res>  {
  factory $PuestoCopyWith(Puesto value, $Res Function(Puesto) _then) = _$PuestoCopyWithImpl;
@useResult
$Res call({
 int? id, String nombre,@JsonKey(name: 'tipos') TipoPuesto tipo, String? rol, String responsabilidades,@JsonKey(name: 'tabulador_salarial') String? tabuladorSalarialUrl, List<int> departamentos, List<PreguntaPuesto> preguntas
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nombre = null,Object? tipo = null,Object? rol = freezed,Object? responsabilidades = null,Object? tabuladorSalarialUrl = freezed,Object? departamentos = null,Object? preguntas = null,}) {
  return _then(Puesto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoPuesto,rol: freezed == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String?,responsabilidades: null == responsabilidades ? _self.responsabilidades : responsabilidades // ignore: cast_nullable_to_non_nullable
as String,tabuladorSalarialUrl: freezed == tabuladorSalarialUrl ? _self.tabuladorSalarialUrl : tabuladorSalarialUrl // ignore: cast_nullable_to_non_nullable
as String?,departamentos: null == departamentos ? _self.departamentos : departamentos // ignore: cast_nullable_to_non_nullable
as List<int>,preguntas: null == preguntas ? _self.preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaPuesto>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String nombre, @JsonKey(name: 'tipos')  TipoPuesto tipo,  String? rol,  String responsabilidades, @JsonKey(name: 'tabulador_salarial')  String? tabuladorSalarialUrl,  List<int> departamentos,  List<PreguntaPuesto> preguntas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Puesto() when $default != null:
return $default(_that.id,_that.nombre,_that.tipo,_that.rol,_that.responsabilidades,_that.tabuladorSalarialUrl,_that.departamentos,_that.preguntas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String nombre, @JsonKey(name: 'tipos')  TipoPuesto tipo,  String? rol,  String responsabilidades, @JsonKey(name: 'tabulador_salarial')  String? tabuladorSalarialUrl,  List<int> departamentos,  List<PreguntaPuesto> preguntas)  $default,) {final _that = this;
switch (_that) {
case _Puesto():
return $default(_that.id,_that.nombre,_that.tipo,_that.rol,_that.responsabilidades,_that.tabuladorSalarialUrl,_that.departamentos,_that.preguntas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String nombre, @JsonKey(name: 'tipos')  TipoPuesto tipo,  String? rol,  String responsabilidades, @JsonKey(name: 'tabulador_salarial')  String? tabuladorSalarialUrl,  List<int> departamentos,  List<PreguntaPuesto> preguntas)?  $default,) {final _that = this;
switch (_that) {
case _Puesto() when $default != null:
return $default(_that.id,_that.nombre,_that.tipo,_that.rol,_that.responsabilidades,_that.tabuladorSalarialUrl,_that.departamentos,_that.preguntas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Puesto with DiagnosticableTreeMixin implements Puesto {
  const _Puesto({this.id, required this.nombre, @JsonKey(name: 'tipos') required this.tipo, this.rol, this.responsabilidades = '', @JsonKey(name: 'tabulador_salarial') this.tabuladorSalarialUrl,  List<int> departamentos = const <int>[],  List<PreguntaPuesto> preguntas = const <PreguntaPuesto>[]}): _departamentos = departamentos,_preguntas = preguntas;
  factory _Puesto.fromJson(Map<String, dynamic> json) => _$PuestoFromJson(json);

@override final  int? id;
@override final  String nombre;
@override@JsonKey(name: 'tipos') final  TipoPuesto tipo;
@override final  String? rol;
@override@JsonKey() final  String responsabilidades;
/// URL del archivo de tabulador salarial ya subido (null si aún no se
/// ha adjuntado ninguno). Para subirlo, ver [EmpleadosRepository.uploadTabuladorSalarial].
@override@JsonKey(name: 'tabulador_salarial') final  String? tabuladorSalarialUrl;
 final  List<int> _departamentos;
@override@JsonKey() List<int> get departamentos {
  if (_departamentos is EqualUnmodifiableListView) return _departamentos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departamentos);
}

 final  List<PreguntaPuesto> _preguntas;
@override@JsonKey() List<PreguntaPuesto> get preguntas {
  if (_preguntas is EqualUnmodifiableListView) return _preguntas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preguntas);
}


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
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('tipo', tipo))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('responsabilidades', responsabilidades))..add(DiagnosticsProperty('tabuladorSalarialUrl', tabuladorSalarialUrl))..add(DiagnosticsProperty('departamentos', departamentos))..add(DiagnosticsProperty('preguntas', preguntas));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Puesto&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.tipo, tipo) || other.tipo == tipo)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.responsabilidades, responsabilidades) || other.responsabilidades == responsabilidades)&&(identical(other.tabuladorSalarialUrl, tabuladorSalarialUrl) || other.tabuladorSalarialUrl == tabuladorSalarialUrl)&&const DeepCollectionEquality().equals(other._departamentos, _departamentos)&&const DeepCollectionEquality().equals(other._preguntas, _preguntas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,tipo,rol,responsabilidades,tabuladorSalarialUrl,const DeepCollectionEquality().hash(_departamentos),const DeepCollectionEquality().hash(_preguntas));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Puesto(id: $id, nombre: $nombre, tipo: $tipo, rol: $rol, responsabilidades: $responsabilidades, tabuladorSalarialUrl: $tabuladorSalarialUrl, departamentos: $departamentos, preguntas: $preguntas)';
}


}

/// @nodoc
abstract mixin class _$PuestoCopyWith<$Res> implements $PuestoCopyWith<$Res> {
  factory _$PuestoCopyWith(_Puesto value, $Res Function(_Puesto) _then) = __$PuestoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String nombre,@JsonKey(name: 'tipos') TipoPuesto tipo, String? rol, String responsabilidades,@JsonKey(name: 'tabulador_salarial') String? tabuladorSalarialUrl, List<int> departamentos, List<PreguntaPuesto> preguntas
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nombre = null,Object? tipo = null,Object? rol = freezed,Object? responsabilidades = null,Object? tabuladorSalarialUrl = freezed,Object? departamentos = null,Object? preguntas = null,}) {
  return _then(_Puesto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,tipo: null == tipo ? _self.tipo : tipo // ignore: cast_nullable_to_non_nullable
as TipoPuesto,rol: freezed == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String?,responsabilidades: null == responsabilidades ? _self.responsabilidades : responsabilidades // ignore: cast_nullable_to_non_nullable
as String,tabuladorSalarialUrl: freezed == tabuladorSalarialUrl ? _self.tabuladorSalarialUrl : tabuladorSalarialUrl // ignore: cast_nullable_to_non_nullable
as String?,departamentos: null == departamentos ? _self._departamentos : departamentos // ignore: cast_nullable_to_non_nullable
as List<int>,preguntas: null == preguntas ? _self._preguntas : preguntas // ignore: cast_nullable_to_non_nullable
as List<PreguntaPuesto>,
  ));
}


}

// dart format on

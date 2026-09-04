// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reporte_asistencia_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReporteAsistenciaResponse implements DiagnosticableTreeMixin {

 DateTime get startDate; DateTime get endDate;@JsonKey(name: 'users') List<ReporteAsistenciaResponseItem> get items;
/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteAsistenciaResponseCopyWith<ReporteAsistenciaResponse> get copyWith => _$ReporteAsistenciaResponseCopyWithImpl<ReporteAsistenciaResponse>(this as ReporteAsistenciaResponse, _$identity);

  /// Serializes this ReporteAsistenciaResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaResponse'))
    ..add(DiagnosticsProperty('startDate', startDate))..add(DiagnosticsProperty('endDate', endDate))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteAsistenciaResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaResponse(startDate: $startDate, endDate: $endDate, items: $items)';
}


}

/// @nodoc
abstract mixin class $ReporteAsistenciaResponseCopyWith<$Res>  {
  factory $ReporteAsistenciaResponseCopyWith(ReporteAsistenciaResponse value, $Res Function(ReporteAsistenciaResponse) _then) = _$ReporteAsistenciaResponseCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate,@JsonKey(name: 'users') List<ReporteAsistenciaResponseItem> items
});




}
/// @nodoc
class _$ReporteAsistenciaResponseCopyWithImpl<$Res>
    implements $ReporteAsistenciaResponseCopyWith<$Res> {
  _$ReporteAsistenciaResponseCopyWithImpl(this._self, this._then);

  final ReporteAsistenciaResponse _self;
  final $Res Function(ReporteAsistenciaResponse) _then;

/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,}) {
  return _then(ReporteAsistenciaResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteAsistenciaResponseItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteAsistenciaResponse].
extension ReporteAsistenciaResponsePatterns on ReporteAsistenciaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteAsistenciaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteAsistenciaResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteAsistenciaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate, @JsonKey(name: 'users')  List<ReporteAsistenciaResponseItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate, @JsonKey(name: 'users')  List<ReporteAsistenciaResponseItem> items)  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse():
return $default(_that.startDate,_that.endDate,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate, @JsonKey(name: 'users')  List<ReporteAsistenciaResponseItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteAsistenciaResponse with DiagnosticableTreeMixin implements ReporteAsistenciaResponse {
  const _ReporteAsistenciaResponse({required this.startDate, required this.endDate, @JsonKey(name: 'users') required  List<ReporteAsistenciaResponseItem> items}): _items = items;
  factory _ReporteAsistenciaResponse.fromJson(Map<String, dynamic> json) => _$ReporteAsistenciaResponseFromJson(json);

@override final  DateTime startDate;
@override final  DateTime endDate;
 final  List<ReporteAsistenciaResponseItem> _items;
@override@JsonKey(name: 'users') List<ReporteAsistenciaResponseItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteAsistenciaResponseCopyWith<_ReporteAsistenciaResponse> get copyWith => __$ReporteAsistenciaResponseCopyWithImpl<_ReporteAsistenciaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteAsistenciaResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaResponse'))
    ..add(DiagnosticsProperty('startDate', startDate))..add(DiagnosticsProperty('endDate', endDate))..add(DiagnosticsProperty('items', items));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteAsistenciaResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(_items));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaResponse(startDate: $startDate, endDate: $endDate, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ReporteAsistenciaResponseCopyWith<$Res> implements $ReporteAsistenciaResponseCopyWith<$Res> {
  factory _$ReporteAsistenciaResponseCopyWith(_ReporteAsistenciaResponse value, $Res Function(_ReporteAsistenciaResponse) _then) = __$ReporteAsistenciaResponseCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate,@JsonKey(name: 'users') List<ReporteAsistenciaResponseItem> items
});




}
/// @nodoc
class __$ReporteAsistenciaResponseCopyWithImpl<$Res>
    implements _$ReporteAsistenciaResponseCopyWith<$Res> {
  __$ReporteAsistenciaResponseCopyWithImpl(this._self, this._then);

  final _ReporteAsistenciaResponse _self;
  final $Res Function(_ReporteAsistenciaResponse) _then;

/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,}) {
  return _then(_ReporteAsistenciaResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteAsistenciaResponseItem>,
  ));
}


}


/// @nodoc
mixin _$ReporteAsistenciaResponseItem implements DiagnosticableTreeMixin {

 int get id; String get username; String get nombre; String? get rol;@JsonKey(name: 'departamento') int? get departamentoRef; int get totalMinutesLate; List<AsistenciaDailyApiModel> get asistencia;
/// Create a copy of ReporteAsistenciaResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteAsistenciaResponseItemCopyWith<ReporteAsistenciaResponseItem> get copyWith => _$ReporteAsistenciaResponseItemCopyWithImpl<ReporteAsistenciaResponseItem>(this as ReporteAsistenciaResponseItem, _$identity);

  /// Serializes this ReporteAsistenciaResponseItem to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaResponseItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamentoRef', departamentoRef))..add(DiagnosticsProperty('totalMinutesLate', totalMinutesLate))..add(DiagnosticsProperty('asistencia', asistencia));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteAsistenciaResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamentoRef, departamentoRef) || other.departamentoRef == departamentoRef)&&(identical(other.totalMinutesLate, totalMinutesLate) || other.totalMinutesLate == totalMinutesLate)&&const DeepCollectionEquality().equals(other.asistencia, asistencia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,rol,departamentoRef,totalMinutesLate,const DeepCollectionEquality().hash(asistencia));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaResponseItem(id: $id, username: $username, nombre: $nombre, rol: $rol, departamentoRef: $departamentoRef, totalMinutesLate: $totalMinutesLate, asistencia: $asistencia)';
}


}

/// @nodoc
abstract mixin class $ReporteAsistenciaResponseItemCopyWith<$Res>  {
  factory $ReporteAsistenciaResponseItemCopyWith(ReporteAsistenciaResponseItem value, $Res Function(ReporteAsistenciaResponseItem) _then) = _$ReporteAsistenciaResponseItemCopyWithImpl;
@useResult
$Res call({
 int id, String username, String nombre, String? rol,@JsonKey(name: 'departamento') int? departamentoRef, int totalMinutesLate, List<AsistenciaDailyApiModel> asistencia
});




}
/// @nodoc
class _$ReporteAsistenciaResponseItemCopyWithImpl<$Res>
    implements $ReporteAsistenciaResponseItemCopyWith<$Res> {
  _$ReporteAsistenciaResponseItemCopyWithImpl(this._self, this._then);

  final ReporteAsistenciaResponseItem _self;
  final $Res Function(ReporteAsistenciaResponseItem) _then;

/// Create a copy of ReporteAsistenciaResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? rol = freezed,Object? departamentoRef = freezed,Object? totalMinutesLate = null,Object? asistencia = null,}) {
  return _then(ReporteAsistenciaResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,rol: freezed == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String?,departamentoRef: freezed == departamentoRef ? _self.departamentoRef : departamentoRef // ignore: cast_nullable_to_non_nullable
as int?,totalMinutesLate: null == totalMinutesLate ? _self.totalMinutesLate : totalMinutesLate // ignore: cast_nullable_to_non_nullable
as int,asistencia: null == asistencia ? _self.asistencia : asistencia // ignore: cast_nullable_to_non_nullable
as List<AsistenciaDailyApiModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteAsistenciaResponseItem].
extension ReporteAsistenciaResponseItemPatterns on ReporteAsistenciaResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteAsistenciaResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteAsistenciaResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteAsistenciaResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String? rol, @JsonKey(name: 'departamento')  int? departamentoRef,  int totalMinutesLate,  List<AsistenciaDailyApiModel> asistencia)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponseItem() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.rol,_that.departamentoRef,_that.totalMinutesLate,_that.asistencia);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String? rol, @JsonKey(name: 'departamento')  int? departamentoRef,  int totalMinutesLate,  List<AsistenciaDailyApiModel> asistencia)  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponseItem():
return $default(_that.id,_that.username,_that.nombre,_that.rol,_that.departamentoRef,_that.totalMinutesLate,_that.asistencia);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String nombre,  String? rol, @JsonKey(name: 'departamento')  int? departamentoRef,  int totalMinutesLate,  List<AsistenciaDailyApiModel> asistencia)?  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponseItem() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.rol,_that.departamentoRef,_that.totalMinutesLate,_that.asistencia);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteAsistenciaResponseItem with DiagnosticableTreeMixin implements ReporteAsistenciaResponseItem {
  const _ReporteAsistenciaResponseItem({required this.id, required this.username, required this.nombre, this.rol, @JsonKey(name: 'departamento') this.departamentoRef, required this.totalMinutesLate, required  List<AsistenciaDailyApiModel> asistencia}): _asistencia = asistencia;
  factory _ReporteAsistenciaResponseItem.fromJson(Map<String, dynamic> json) => _$ReporteAsistenciaResponseItemFromJson(json);

@override final  int id;
@override final  String username;
@override final  String nombre;
@override final  String? rol;
@override@JsonKey(name: 'departamento') final  int? departamentoRef;
@override final  int totalMinutesLate;
 final  List<AsistenciaDailyApiModel> _asistencia;
@override List<AsistenciaDailyApiModel> get asistencia {
  if (_asistencia is EqualUnmodifiableListView) return _asistencia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_asistencia);
}


/// Create a copy of ReporteAsistenciaResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteAsistenciaResponseItemCopyWith<_ReporteAsistenciaResponseItem> get copyWith => __$ReporteAsistenciaResponseItemCopyWithImpl<_ReporteAsistenciaResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteAsistenciaResponseItemToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaResponseItem'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamentoRef', departamentoRef))..add(DiagnosticsProperty('totalMinutesLate', totalMinutesLate))..add(DiagnosticsProperty('asistencia', asistencia));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteAsistenciaResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamentoRef, departamentoRef) || other.departamentoRef == departamentoRef)&&(identical(other.totalMinutesLate, totalMinutesLate) || other.totalMinutesLate == totalMinutesLate)&&const DeepCollectionEquality().equals(other._asistencia, _asistencia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,rol,departamentoRef,totalMinutesLate,const DeepCollectionEquality().hash(_asistencia));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaResponseItem(id: $id, username: $username, nombre: $nombre, rol: $rol, departamentoRef: $departamentoRef, totalMinutesLate: $totalMinutesLate, asistencia: $asistencia)';
}


}

/// @nodoc
abstract mixin class _$ReporteAsistenciaResponseItemCopyWith<$Res> implements $ReporteAsistenciaResponseItemCopyWith<$Res> {
  factory _$ReporteAsistenciaResponseItemCopyWith(_ReporteAsistenciaResponseItem value, $Res Function(_ReporteAsistenciaResponseItem) _then) = __$ReporteAsistenciaResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String nombre, String? rol,@JsonKey(name: 'departamento') int? departamentoRef, int totalMinutesLate, List<AsistenciaDailyApiModel> asistencia
});




}
/// @nodoc
class __$ReporteAsistenciaResponseItemCopyWithImpl<$Res>
    implements _$ReporteAsistenciaResponseItemCopyWith<$Res> {
  __$ReporteAsistenciaResponseItemCopyWithImpl(this._self, this._then);

  final _ReporteAsistenciaResponseItem _self;
  final $Res Function(_ReporteAsistenciaResponseItem) _then;

/// Create a copy of ReporteAsistenciaResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? rol = freezed,Object? departamentoRef = freezed,Object? totalMinutesLate = null,Object? asistencia = null,}) {
  return _then(_ReporteAsistenciaResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,rol: freezed == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String?,departamentoRef: freezed == departamentoRef ? _self.departamentoRef : departamentoRef // ignore: cast_nullable_to_non_nullable
as int?,totalMinutesLate: null == totalMinutesLate ? _self.totalMinutesLate : totalMinutesLate // ignore: cast_nullable_to_non_nullable
as int,asistencia: null == asistencia ? _self._asistencia : asistencia // ignore: cast_nullable_to_non_nullable
as List<AsistenciaDailyApiModel>,
  ));
}


}

// dart format on

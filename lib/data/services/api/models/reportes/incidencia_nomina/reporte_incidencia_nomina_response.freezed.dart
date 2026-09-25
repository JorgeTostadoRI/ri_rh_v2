// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reporte_incidencia_nomina_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReporteIncidenciaNominaResponse {

@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate; List<ReporteIncidenciaNominaResponseItem> get items;
/// Create a copy of ReporteIncidenciaNominaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteIncidenciaNominaResponseCopyWith<ReporteIncidenciaNominaResponse> get copyWith => _$ReporteIncidenciaNominaResponseCopyWithImpl<ReporteIncidenciaNominaResponse>(this as ReporteIncidenciaNominaResponse, _$identity);

  /// Serializes this ReporteIncidenciaNominaResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteIncidenciaNominaResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'ReporteIncidenciaNominaResponse(startDate: $startDate, endDate: $endDate, items: $items)';
}


}

/// @nodoc
abstract mixin class $ReporteIncidenciaNominaResponseCopyWith<$Res>  {
  factory $ReporteIncidenciaNominaResponseCopyWith(ReporteIncidenciaNominaResponse value, $Res Function(ReporteIncidenciaNominaResponse) _then) = _$ReporteIncidenciaNominaResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate, List<ReporteIncidenciaNominaResponseItem> items
});




}
/// @nodoc
class _$ReporteIncidenciaNominaResponseCopyWithImpl<$Res>
    implements $ReporteIncidenciaNominaResponseCopyWith<$Res> {
  _$ReporteIncidenciaNominaResponseCopyWithImpl(this._self, this._then);

  final ReporteIncidenciaNominaResponse _self;
  final $Res Function(ReporteIncidenciaNominaResponse) _then;

/// Create a copy of ReporteIncidenciaNominaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,}) {
  return _then(ReporteIncidenciaNominaResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteIncidenciaNominaResponseItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteIncidenciaNominaResponse].
extension ReporteIncidenciaNominaResponsePatterns on ReporteIncidenciaNominaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteIncidenciaNominaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate,  List<ReporteIncidenciaNominaResponseItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate,  List<ReporteIncidenciaNominaResponseItem> items)  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate,  List<ReporteIncidenciaNominaResponseItem> items)?  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteIncidenciaNominaResponse implements ReporteIncidenciaNominaResponse {
  const _ReporteIncidenciaNominaResponse({@JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, required  List<ReporteIncidenciaNominaResponseItem> items}): _items = items;
  factory _ReporteIncidenciaNominaResponse.fromJson(Map<String, dynamic> json) => _$ReporteIncidenciaNominaResponseFromJson(json);

@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
 final  List<ReporteIncidenciaNominaResponseItem> _items;
@override List<ReporteIncidenciaNominaResponseItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ReporteIncidenciaNominaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteIncidenciaNominaResponseCopyWith<_ReporteIncidenciaNominaResponse> get copyWith => __$ReporteIncidenciaNominaResponseCopyWithImpl<_ReporteIncidenciaNominaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteIncidenciaNominaResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteIncidenciaNominaResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ReporteIncidenciaNominaResponse(startDate: $startDate, endDate: $endDate, items: $items)';
}


}

/// @nodoc
abstract mixin class _$ReporteIncidenciaNominaResponseCopyWith<$Res> implements $ReporteIncidenciaNominaResponseCopyWith<$Res> {
  factory _$ReporteIncidenciaNominaResponseCopyWith(_ReporteIncidenciaNominaResponse value, $Res Function(_ReporteIncidenciaNominaResponse) _then) = __$ReporteIncidenciaNominaResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate, List<ReporteIncidenciaNominaResponseItem> items
});




}
/// @nodoc
class __$ReporteIncidenciaNominaResponseCopyWithImpl<$Res>
    implements _$ReporteIncidenciaNominaResponseCopyWith<$Res> {
  __$ReporteIncidenciaNominaResponseCopyWithImpl(this._self, this._then);

  final _ReporteIncidenciaNominaResponse _self;
  final $Res Function(_ReporteIncidenciaNominaResponse) _then;

/// Create a copy of ReporteIncidenciaNominaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? items = null,}) {
  return _then(_ReporteIncidenciaNominaResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReporteIncidenciaNominaResponseItem>,
  ));
}


}


/// @nodoc
mixin _$ReporteIncidenciaNominaResponseItem {

 int get id; String get username; String get nombre;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'is_practicante') bool get isPracticante;@JsonKey(name: 'departamento') int? get departamentoRef; List<ReporteIncidenciaNominaResponseDia> get dias;@JsonKey(name: 'minutes_late') int get minutesLate;@JsonKey(name: 'extra_hours') double get extraHours;
/// Create a copy of ReporteIncidenciaNominaResponseItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteIncidenciaNominaResponseItemCopyWith<ReporteIncidenciaNominaResponseItem> get copyWith => _$ReporteIncidenciaNominaResponseItemCopyWithImpl<ReporteIncidenciaNominaResponseItem>(this as ReporteIncidenciaNominaResponseItem, _$identity);

  /// Serializes this ReporteIncidenciaNominaResponseItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteIncidenciaNominaResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isPracticante, isPracticante) || other.isPracticante == isPracticante)&&(identical(other.departamentoRef, departamentoRef) || other.departamentoRef == departamentoRef)&&const DeepCollectionEquality().equals(other.dias, dias)&&(identical(other.minutesLate, minutesLate) || other.minutesLate == minutesLate)&&(identical(other.extraHours, extraHours) || other.extraHours == extraHours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,fullName,isPracticante,departamentoRef,const DeepCollectionEquality().hash(dias),minutesLate,extraHours);

@override
String toString() {
  return 'ReporteIncidenciaNominaResponseItem(id: $id, username: $username, nombre: $nombre, fullName: $fullName, isPracticante: $isPracticante, departamentoRef: $departamentoRef, dias: $dias, minutesLate: $minutesLate, extraHours: $extraHours)';
}


}

/// @nodoc
abstract mixin class $ReporteIncidenciaNominaResponseItemCopyWith<$Res>  {
  factory $ReporteIncidenciaNominaResponseItemCopyWith(ReporteIncidenciaNominaResponseItem value, $Res Function(ReporteIncidenciaNominaResponseItem) _then) = _$ReporteIncidenciaNominaResponseItemCopyWithImpl;
@useResult
$Res call({
 int id, String username, String nombre,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'is_practicante') bool isPracticante,@JsonKey(name: 'departamento') int? departamentoRef, List<ReporteIncidenciaNominaResponseDia> dias,@JsonKey(name: 'minutes_late') int minutesLate,@JsonKey(name: 'extra_hours') double extraHours
});




}
/// @nodoc
class _$ReporteIncidenciaNominaResponseItemCopyWithImpl<$Res>
    implements $ReporteIncidenciaNominaResponseItemCopyWith<$Res> {
  _$ReporteIncidenciaNominaResponseItemCopyWithImpl(this._self, this._then);

  final ReporteIncidenciaNominaResponseItem _self;
  final $Res Function(ReporteIncidenciaNominaResponseItem) _then;

/// Create a copy of ReporteIncidenciaNominaResponseItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? fullName = null,Object? isPracticante = null,Object? departamentoRef = freezed,Object? dias = null,Object? minutesLate = null,Object? extraHours = null,}) {
  return _then(ReporteIncidenciaNominaResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,isPracticante: null == isPracticante ? _self.isPracticante : isPracticante // ignore: cast_nullable_to_non_nullable
as bool,departamentoRef: freezed == departamentoRef ? _self.departamentoRef : departamentoRef // ignore: cast_nullable_to_non_nullable
as int?,dias: null == dias ? _self.dias : dias // ignore: cast_nullable_to_non_nullable
as List<ReporteIncidenciaNominaResponseDia>,minutesLate: null == minutesLate ? _self.minutesLate : minutesLate // ignore: cast_nullable_to_non_nullable
as int,extraHours: null == extraHours ? _self.extraHours : extraHours // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteIncidenciaNominaResponseItem].
extension ReporteIncidenciaNominaResponseItemPatterns on ReporteIncidenciaNominaResponseItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaResponseItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaResponseItem value)  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteIncidenciaNominaResponseItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String nombre, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'is_practicante')  bool isPracticante, @JsonKey(name: 'departamento')  int? departamentoRef,  List<ReporteIncidenciaNominaResponseDia> dias, @JsonKey(name: 'minutes_late')  int minutesLate, @JsonKey(name: 'extra_hours')  double extraHours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseItem() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.fullName,_that.isPracticante,_that.departamentoRef,_that.dias,_that.minutesLate,_that.extraHours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String nombre, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'is_practicante')  bool isPracticante, @JsonKey(name: 'departamento')  int? departamentoRef,  List<ReporteIncidenciaNominaResponseDia> dias, @JsonKey(name: 'minutes_late')  int minutesLate, @JsonKey(name: 'extra_hours')  double extraHours)  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseItem():
return $default(_that.id,_that.username,_that.nombre,_that.fullName,_that.isPracticante,_that.departamentoRef,_that.dias,_that.minutesLate,_that.extraHours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String nombre, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'is_practicante')  bool isPracticante, @JsonKey(name: 'departamento')  int? departamentoRef,  List<ReporteIncidenciaNominaResponseDia> dias, @JsonKey(name: 'minutes_late')  int minutesLate, @JsonKey(name: 'extra_hours')  double extraHours)?  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseItem() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.fullName,_that.isPracticante,_that.departamentoRef,_that.dias,_that.minutesLate,_that.extraHours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteIncidenciaNominaResponseItem implements ReporteIncidenciaNominaResponseItem {
  const _ReporteIncidenciaNominaResponseItem({required this.id, required this.username, required this.nombre, @JsonKey(name: 'full_name') required this.fullName, @JsonKey(name: 'is_practicante') required this.isPracticante, @JsonKey(name: 'departamento') this.departamentoRef, required  List<ReporteIncidenciaNominaResponseDia> dias, @JsonKey(name: 'minutes_late') required this.minutesLate, @JsonKey(name: 'extra_hours') required this.extraHours}): _dias = dias;
  factory _ReporteIncidenciaNominaResponseItem.fromJson(Map<String, dynamic> json) => _$ReporteIncidenciaNominaResponseItemFromJson(json);

@override final  int id;
@override final  String username;
@override final  String nombre;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'is_practicante') final  bool isPracticante;
@override@JsonKey(name: 'departamento') final  int? departamentoRef;
 final  List<ReporteIncidenciaNominaResponseDia> _dias;
@override List<ReporteIncidenciaNominaResponseDia> get dias {
  if (_dias is EqualUnmodifiableListView) return _dias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dias);
}

@override@JsonKey(name: 'minutes_late') final  int minutesLate;
@override@JsonKey(name: 'extra_hours') final  double extraHours;

/// Create a copy of ReporteIncidenciaNominaResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteIncidenciaNominaResponseItemCopyWith<_ReporteIncidenciaNominaResponseItem> get copyWith => __$ReporteIncidenciaNominaResponseItemCopyWithImpl<_ReporteIncidenciaNominaResponseItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteIncidenciaNominaResponseItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteIncidenciaNominaResponseItem&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.isPracticante, isPracticante) || other.isPracticante == isPracticante)&&(identical(other.departamentoRef, departamentoRef) || other.departamentoRef == departamentoRef)&&const DeepCollectionEquality().equals(other._dias, _dias)&&(identical(other.minutesLate, minutesLate) || other.minutesLate == minutesLate)&&(identical(other.extraHours, extraHours) || other.extraHours == extraHours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,fullName,isPracticante,departamentoRef,const DeepCollectionEquality().hash(_dias),minutesLate,extraHours);

@override
String toString() {
  return 'ReporteIncidenciaNominaResponseItem(id: $id, username: $username, nombre: $nombre, fullName: $fullName, isPracticante: $isPracticante, departamentoRef: $departamentoRef, dias: $dias, minutesLate: $minutesLate, extraHours: $extraHours)';
}


}

/// @nodoc
abstract mixin class _$ReporteIncidenciaNominaResponseItemCopyWith<$Res> implements $ReporteIncidenciaNominaResponseItemCopyWith<$Res> {
  factory _$ReporteIncidenciaNominaResponseItemCopyWith(_ReporteIncidenciaNominaResponseItem value, $Res Function(_ReporteIncidenciaNominaResponseItem) _then) = __$ReporteIncidenciaNominaResponseItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String nombre,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'is_practicante') bool isPracticante,@JsonKey(name: 'departamento') int? departamentoRef, List<ReporteIncidenciaNominaResponseDia> dias,@JsonKey(name: 'minutes_late') int minutesLate,@JsonKey(name: 'extra_hours') double extraHours
});




}
/// @nodoc
class __$ReporteIncidenciaNominaResponseItemCopyWithImpl<$Res>
    implements _$ReporteIncidenciaNominaResponseItemCopyWith<$Res> {
  __$ReporteIncidenciaNominaResponseItemCopyWithImpl(this._self, this._then);

  final _ReporteIncidenciaNominaResponseItem _self;
  final $Res Function(_ReporteIncidenciaNominaResponseItem) _then;

/// Create a copy of ReporteIncidenciaNominaResponseItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? fullName = null,Object? isPracticante = null,Object? departamentoRef = freezed,Object? dias = null,Object? minutesLate = null,Object? extraHours = null,}) {
  return _then(_ReporteIncidenciaNominaResponseItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,isPracticante: null == isPracticante ? _self.isPracticante : isPracticante // ignore: cast_nullable_to_non_nullable
as bool,departamentoRef: freezed == departamentoRef ? _self.departamentoRef : departamentoRef // ignore: cast_nullable_to_non_nullable
as int?,dias: null == dias ? _self._dias : dias // ignore: cast_nullable_to_non_nullable
as List<ReporteIncidenciaNominaResponseDia>,minutesLate: null == minutesLate ? _self.minutesLate : minutesLate // ignore: cast_nullable_to_non_nullable
as int,extraHours: null == extraHours ? _self.extraHours : extraHours // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ReporteIncidenciaNominaResponseDia {

 DateTime get date; String get codigo;
/// Create a copy of ReporteIncidenciaNominaResponseDia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteIncidenciaNominaResponseDiaCopyWith<ReporteIncidenciaNominaResponseDia> get copyWith => _$ReporteIncidenciaNominaResponseDiaCopyWithImpl<ReporteIncidenciaNominaResponseDia>(this as ReporteIncidenciaNominaResponseDia, _$identity);

  /// Serializes this ReporteIncidenciaNominaResponseDia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteIncidenciaNominaResponseDia&&(identical(other.date, date) || other.date == date)&&(identical(other.codigo, codigo) || other.codigo == codigo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,codigo);

@override
String toString() {
  return 'ReporteIncidenciaNominaResponseDia(date: $date, codigo: $codigo)';
}


}

/// @nodoc
abstract mixin class $ReporteIncidenciaNominaResponseDiaCopyWith<$Res>  {
  factory $ReporteIncidenciaNominaResponseDiaCopyWith(ReporteIncidenciaNominaResponseDia value, $Res Function(ReporteIncidenciaNominaResponseDia) _then) = _$ReporteIncidenciaNominaResponseDiaCopyWithImpl;
@useResult
$Res call({
 DateTime date, String codigo
});




}
/// @nodoc
class _$ReporteIncidenciaNominaResponseDiaCopyWithImpl<$Res>
    implements $ReporteIncidenciaNominaResponseDiaCopyWith<$Res> {
  _$ReporteIncidenciaNominaResponseDiaCopyWithImpl(this._self, this._then);

  final ReporteIncidenciaNominaResponseDia _self;
  final $Res Function(ReporteIncidenciaNominaResponseDia) _then;

/// Create a copy of ReporteIncidenciaNominaResponseDia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? codigo = null,}) {
  return _then(ReporteIncidenciaNominaResponseDia(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteIncidenciaNominaResponseDia].
extension ReporteIncidenciaNominaResponseDiaPatterns on ReporteIncidenciaNominaResponseDia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaResponseDia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseDia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteIncidenciaNominaResponseDia value)  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseDia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteIncidenciaNominaResponseDia value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseDia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String codigo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseDia() when $default != null:
return $default(_that.date,_that.codigo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String codigo)  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseDia():
return $default(_that.date,_that.codigo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String codigo)?  $default,) {final _that = this;
switch (_that) {
case _ReporteIncidenciaNominaResponseDia() when $default != null:
return $default(_that.date,_that.codigo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteIncidenciaNominaResponseDia implements ReporteIncidenciaNominaResponseDia {
  const _ReporteIncidenciaNominaResponseDia({required this.date, required this.codigo});
  factory _ReporteIncidenciaNominaResponseDia.fromJson(Map<String, dynamic> json) => _$ReporteIncidenciaNominaResponseDiaFromJson(json);

@override final  DateTime date;
@override final  String codigo;

/// Create a copy of ReporteIncidenciaNominaResponseDia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteIncidenciaNominaResponseDiaCopyWith<_ReporteIncidenciaNominaResponseDia> get copyWith => __$ReporteIncidenciaNominaResponseDiaCopyWithImpl<_ReporteIncidenciaNominaResponseDia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteIncidenciaNominaResponseDiaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteIncidenciaNominaResponseDia&&(identical(other.date, date) || other.date == date)&&(identical(other.codigo, codigo) || other.codigo == codigo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,codigo);

@override
String toString() {
  return 'ReporteIncidenciaNominaResponseDia(date: $date, codigo: $codigo)';
}


}

/// @nodoc
abstract mixin class _$ReporteIncidenciaNominaResponseDiaCopyWith<$Res> implements $ReporteIncidenciaNominaResponseDiaCopyWith<$Res> {
  factory _$ReporteIncidenciaNominaResponseDiaCopyWith(_ReporteIncidenciaNominaResponseDia value, $Res Function(_ReporteIncidenciaNominaResponseDia) _then) = __$ReporteIncidenciaNominaResponseDiaCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String codigo
});




}
/// @nodoc
class __$ReporteIncidenciaNominaResponseDiaCopyWithImpl<$Res>
    implements _$ReporteIncidenciaNominaResponseDiaCopyWith<$Res> {
  __$ReporteIncidenciaNominaResponseDiaCopyWithImpl(this._self, this._then);

  final _ReporteIncidenciaNominaResponseDia _self;
  final $Res Function(_ReporteIncidenciaNominaResponseDia) _then;

/// Create a copy of ReporteIncidenciaNominaResponseDia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? codigo = null,}) {
  return _then(_ReporteIncidenciaNominaResponseDia(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

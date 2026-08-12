// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asistencia_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsistenciaApiModel implements DiagnosticableTreeMixin {

 int get id; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get attendedAt; AsistenciaType? get type;@JsonKey(name: 'photo') String? get photoUrl;@JsonKey(includeFromJson: false, includeToJson: false) XFile? get photoFile;@JsonKey(name: 'usuario') int get userRef;
/// Create a copy of AsistenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsistenciaApiModelCopyWith<AsistenciaApiModel> get copyWith => _$AsistenciaApiModelCopyWithImpl<AsistenciaApiModel>(this as AsistenciaApiModel, _$identity);

  /// Serializes this AsistenciaApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsistenciaApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('attendedAt', attendedAt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoFile', photoFile))..add(DiagnosticsProperty('userRef', userRef));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsistenciaApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attendedAt, attendedAt) || other.attendedAt == attendedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoFile, photoFile) || other.photoFile == photoFile)&&(identical(other.userRef, userRef) || other.userRef == userRef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,attendedAt,type,photoUrl,photoFile,userRef);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsistenciaApiModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, attendedAt: $attendedAt, type: $type, photoUrl: $photoUrl, photoFile: $photoFile, userRef: $userRef)';
}


}

/// @nodoc
abstract mixin class $AsistenciaApiModelCopyWith<$Res>  {
  factory $AsistenciaApiModelCopyWith(AsistenciaApiModel value, $Res Function(AsistenciaApiModel) _then) = _$AsistenciaApiModelCopyWithImpl;
@useResult
$Res call({
 int id, DateTime? createdAt, DateTime? updatedAt, DateTime? attendedAt, AsistenciaType? type,@JsonKey(name: 'photo') String? photoUrl,@JsonKey(includeFromJson: false, includeToJson: false) XFile? photoFile,@JsonKey(name: 'usuario') int userRef
});




}
/// @nodoc
class _$AsistenciaApiModelCopyWithImpl<$Res>
    implements $AsistenciaApiModelCopyWith<$Res> {
  _$AsistenciaApiModelCopyWithImpl(this._self, this._then);

  final AsistenciaApiModel _self;
  final $Res Function(AsistenciaApiModel) _then;

/// Create a copy of AsistenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attendedAt = freezed,Object? type = freezed,Object? photoUrl = freezed,Object? photoFile = freezed,Object? userRef = null,}) {
  return _then(AsistenciaApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attendedAt: freezed == attendedAt ? _self.attendedAt : attendedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AsistenciaType?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoFile: freezed == photoFile ? _self.photoFile : photoFile // ignore: cast_nullable_to_non_nullable
as XFile?,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AsistenciaApiModel].
extension AsistenciaApiModelPatterns on AsistenciaApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AsistenciaApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AsistenciaApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AsistenciaApiModel value)  $default,){
final _that = this;
switch (_that) {
case _AsistenciaApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AsistenciaApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _AsistenciaApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? attendedAt,  AsistenciaType? type, @JsonKey(name: 'photo')  String? photoUrl, @JsonKey(includeFromJson: false, includeToJson: false)  XFile? photoFile, @JsonKey(name: 'usuario')  int userRef)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AsistenciaApiModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attendedAt,_that.type,_that.photoUrl,_that.photoFile,_that.userRef);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? attendedAt,  AsistenciaType? type, @JsonKey(name: 'photo')  String? photoUrl, @JsonKey(includeFromJson: false, includeToJson: false)  XFile? photoFile, @JsonKey(name: 'usuario')  int userRef)  $default,) {final _that = this;
switch (_that) {
case _AsistenciaApiModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attendedAt,_that.type,_that.photoUrl,_that.photoFile,_that.userRef);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? attendedAt,  AsistenciaType? type, @JsonKey(name: 'photo')  String? photoUrl, @JsonKey(includeFromJson: false, includeToJson: false)  XFile? photoFile, @JsonKey(name: 'usuario')  int userRef)?  $default,) {final _that = this;
switch (_that) {
case _AsistenciaApiModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attendedAt,_that.type,_that.photoUrl,_that.photoFile,_that.userRef);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AsistenciaApiModel with DiagnosticableTreeMixin implements AsistenciaApiModel {
  const _AsistenciaApiModel({this.id = 0, this.createdAt, this.updatedAt, this.attendedAt, this.type, @JsonKey(name: 'photo') this.photoUrl, @JsonKey(includeFromJson: false, includeToJson: false) this.photoFile, @JsonKey(name: 'usuario') required this.userRef});
  factory _AsistenciaApiModel.fromJson(Map<String, dynamic> json) => _$AsistenciaApiModelFromJson(json);

@override@JsonKey() final  int id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? attendedAt;
@override final  AsistenciaType? type;
@override@JsonKey(name: 'photo') final  String? photoUrl;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  XFile? photoFile;
@override@JsonKey(name: 'usuario') final  int userRef;

/// Create a copy of AsistenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsistenciaApiModelCopyWith<_AsistenciaApiModel> get copyWith => __$AsistenciaApiModelCopyWithImpl<_AsistenciaApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AsistenciaApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AsistenciaApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('attendedAt', attendedAt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoFile', photoFile))..add(DiagnosticsProperty('userRef', userRef));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AsistenciaApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attendedAt, attendedAt) || other.attendedAt == attendedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoFile, photoFile) || other.photoFile == photoFile)&&(identical(other.userRef, userRef) || other.userRef == userRef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,attendedAt,type,photoUrl,photoFile,userRef);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AsistenciaApiModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, attendedAt: $attendedAt, type: $type, photoUrl: $photoUrl, photoFile: $photoFile, userRef: $userRef)';
}


}

/// @nodoc
abstract mixin class _$AsistenciaApiModelCopyWith<$Res> implements $AsistenciaApiModelCopyWith<$Res> {
  factory _$AsistenciaApiModelCopyWith(_AsistenciaApiModel value, $Res Function(_AsistenciaApiModel) _then) = __$AsistenciaApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime? createdAt, DateTime? updatedAt, DateTime? attendedAt, AsistenciaType? type,@JsonKey(name: 'photo') String? photoUrl,@JsonKey(includeFromJson: false, includeToJson: false) XFile? photoFile,@JsonKey(name: 'usuario') int userRef
});




}
/// @nodoc
class __$AsistenciaApiModelCopyWithImpl<$Res>
    implements _$AsistenciaApiModelCopyWith<$Res> {
  __$AsistenciaApiModelCopyWithImpl(this._self, this._then);

  final _AsistenciaApiModel _self;
  final $Res Function(_AsistenciaApiModel) _then;

/// Create a copy of AsistenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attendedAt = freezed,Object? type = freezed,Object? photoUrl = freezed,Object? photoFile = freezed,Object? userRef = null,}) {
  return _then(_AsistenciaApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attendedAt: freezed == attendedAt ? _self.attendedAt : attendedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AsistenciaType?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoFile: freezed == photoFile ? _self.photoFile : photoFile // ignore: cast_nullable_to_non_nullable
as XFile?,userRef: null == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

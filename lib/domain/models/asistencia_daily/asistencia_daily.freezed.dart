// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asistencia_daily.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsistenciaDaily {

 int get id; DateTime get createdAt; DateTime get updatedAt; User get user; DateTime get attendedAt; AsistenciaStatus get status; int get minutesLate; DateTime? get entryAt; DateTime? get exitToLunchAt; DateTime? get entryFromLunchAt; DateTime? get exitAt; String? get entryPhoto; String? get exitToLunchPhoto; String? get entryFromLunchPhoto; String? get exitPhoto; String? get notes;
/// Create a copy of AsistenciaDaily
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsistenciaDailyCopyWith<AsistenciaDaily> get copyWith => _$AsistenciaDailyCopyWithImpl<AsistenciaDaily>(this as AsistenciaDaily, _$identity);

  /// Serializes this AsistenciaDaily to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsistenciaDaily&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.attendedAt, attendedAt) || other.attendedAt == attendedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.minutesLate, minutesLate) || other.minutesLate == minutesLate)&&(identical(other.entryAt, entryAt) || other.entryAt == entryAt)&&(identical(other.exitToLunchAt, exitToLunchAt) || other.exitToLunchAt == exitToLunchAt)&&(identical(other.entryFromLunchAt, entryFromLunchAt) || other.entryFromLunchAt == entryFromLunchAt)&&(identical(other.exitAt, exitAt) || other.exitAt == exitAt)&&(identical(other.entryPhoto, entryPhoto) || other.entryPhoto == entryPhoto)&&(identical(other.exitToLunchPhoto, exitToLunchPhoto) || other.exitToLunchPhoto == exitToLunchPhoto)&&(identical(other.entryFromLunchPhoto, entryFromLunchPhoto) || other.entryFromLunchPhoto == entryFromLunchPhoto)&&(identical(other.exitPhoto, exitPhoto) || other.exitPhoto == exitPhoto)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,user,attendedAt,status,minutesLate,entryAt,exitToLunchAt,entryFromLunchAt,exitAt,entryPhoto,exitToLunchPhoto,entryFromLunchPhoto,exitPhoto,notes);

@override
String toString() {
  return 'AsistenciaDaily(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, attendedAt: $attendedAt, status: $status, minutesLate: $minutesLate, entryAt: $entryAt, exitToLunchAt: $exitToLunchAt, entryFromLunchAt: $entryFromLunchAt, exitAt: $exitAt, entryPhoto: $entryPhoto, exitToLunchPhoto: $exitToLunchPhoto, entryFromLunchPhoto: $entryFromLunchPhoto, exitPhoto: $exitPhoto, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AsistenciaDailyCopyWith<$Res>  {
  factory $AsistenciaDailyCopyWith(AsistenciaDaily value, $Res Function(AsistenciaDaily) _then) = _$AsistenciaDailyCopyWithImpl;
@useResult
$Res call({
 int id, DateTime createdAt, DateTime updatedAt, User user, DateTime attendedAt, AsistenciaStatus status, int minutesLate, DateTime? entryAt, DateTime? exitToLunchAt, DateTime? entryFromLunchAt, DateTime? exitAt, String? entryPhoto, String? exitToLunchPhoto, String? entryFromLunchPhoto, String? exitPhoto, String? notes
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AsistenciaDailyCopyWithImpl<$Res>
    implements $AsistenciaDailyCopyWith<$Res> {
  _$AsistenciaDailyCopyWithImpl(this._self, this._then);

  final AsistenciaDaily _self;
  final $Res Function(AsistenciaDaily) _then;

/// Create a copy of AsistenciaDaily
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? user = null,Object? attendedAt = null,Object? status = null,Object? minutesLate = null,Object? entryAt = freezed,Object? exitToLunchAt = freezed,Object? entryFromLunchAt = freezed,Object? exitAt = freezed,Object? entryPhoto = freezed,Object? exitToLunchPhoto = freezed,Object? entryFromLunchPhoto = freezed,Object? exitPhoto = freezed,Object? notes = freezed,}) {
  return _then(AsistenciaDaily(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,attendedAt: null == attendedAt ? _self.attendedAt : attendedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AsistenciaStatus,minutesLate: null == minutesLate ? _self.minutesLate : minutesLate // ignore: cast_nullable_to_non_nullable
as int,entryAt: freezed == entryAt ? _self.entryAt : entryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exitToLunchAt: freezed == exitToLunchAt ? _self.exitToLunchAt : exitToLunchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,entryFromLunchAt: freezed == entryFromLunchAt ? _self.entryFromLunchAt : entryFromLunchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exitAt: freezed == exitAt ? _self.exitAt : exitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,entryPhoto: freezed == entryPhoto ? _self.entryPhoto : entryPhoto // ignore: cast_nullable_to_non_nullable
as String?,exitToLunchPhoto: freezed == exitToLunchPhoto ? _self.exitToLunchPhoto : exitToLunchPhoto // ignore: cast_nullable_to_non_nullable
as String?,entryFromLunchPhoto: freezed == entryFromLunchPhoto ? _self.entryFromLunchPhoto : entryFromLunchPhoto // ignore: cast_nullable_to_non_nullable
as String?,exitPhoto: freezed == exitPhoto ? _self.exitPhoto : exitPhoto // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AsistenciaDaily
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AsistenciaDaily].
extension AsistenciaDailyPatterns on AsistenciaDaily {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AsistenciaDaily value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AsistenciaDaily() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AsistenciaDaily value)  $default,){
final _that = this;
switch (_that) {
case _AsistenciaDaily():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AsistenciaDaily value)?  $default,){
final _that = this;
switch (_that) {
case _AsistenciaDaily() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  DateTime updatedAt,  User user,  DateTime attendedAt,  AsistenciaStatus status,  int minutesLate,  DateTime? entryAt,  DateTime? exitToLunchAt,  DateTime? entryFromLunchAt,  DateTime? exitAt,  String? entryPhoto,  String? exitToLunchPhoto,  String? entryFromLunchPhoto,  String? exitPhoto,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AsistenciaDaily() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.user,_that.attendedAt,_that.status,_that.minutesLate,_that.entryAt,_that.exitToLunchAt,_that.entryFromLunchAt,_that.exitAt,_that.entryPhoto,_that.exitToLunchPhoto,_that.entryFromLunchPhoto,_that.exitPhoto,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime createdAt,  DateTime updatedAt,  User user,  DateTime attendedAt,  AsistenciaStatus status,  int minutesLate,  DateTime? entryAt,  DateTime? exitToLunchAt,  DateTime? entryFromLunchAt,  DateTime? exitAt,  String? entryPhoto,  String? exitToLunchPhoto,  String? entryFromLunchPhoto,  String? exitPhoto,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AsistenciaDaily():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.user,_that.attendedAt,_that.status,_that.minutesLate,_that.entryAt,_that.exitToLunchAt,_that.entryFromLunchAt,_that.exitAt,_that.entryPhoto,_that.exitToLunchPhoto,_that.entryFromLunchPhoto,_that.exitPhoto,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime createdAt,  DateTime updatedAt,  User user,  DateTime attendedAt,  AsistenciaStatus status,  int minutesLate,  DateTime? entryAt,  DateTime? exitToLunchAt,  DateTime? entryFromLunchAt,  DateTime? exitAt,  String? entryPhoto,  String? exitToLunchPhoto,  String? entryFromLunchPhoto,  String? exitPhoto,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AsistenciaDaily() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.user,_that.attendedAt,_that.status,_that.minutesLate,_that.entryAt,_that.exitToLunchAt,_that.entryFromLunchAt,_that.exitAt,_that.entryPhoto,_that.exitToLunchPhoto,_that.entryFromLunchPhoto,_that.exitPhoto,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AsistenciaDaily implements AsistenciaDaily {
  const _AsistenciaDaily({required this.id, required this.createdAt, required this.updatedAt, required this.user, required this.attendedAt, required this.status, required this.minutesLate, this.entryAt, this.exitToLunchAt, this.entryFromLunchAt, this.exitAt, this.entryPhoto, this.exitToLunchPhoto, this.entryFromLunchPhoto, this.exitPhoto, this.notes});
  factory _AsistenciaDaily.fromJson(Map<String, dynamic> json) => _$AsistenciaDailyFromJson(json);

@override final  int id;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  User user;
@override final  DateTime attendedAt;
@override final  AsistenciaStatus status;
@override final  int minutesLate;
@override final  DateTime? entryAt;
@override final  DateTime? exitToLunchAt;
@override final  DateTime? entryFromLunchAt;
@override final  DateTime? exitAt;
@override final  String? entryPhoto;
@override final  String? exitToLunchPhoto;
@override final  String? entryFromLunchPhoto;
@override final  String? exitPhoto;
@override final  String? notes;

/// Create a copy of AsistenciaDaily
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsistenciaDailyCopyWith<_AsistenciaDaily> get copyWith => __$AsistenciaDailyCopyWithImpl<_AsistenciaDaily>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AsistenciaDailyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AsistenciaDaily&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.attendedAt, attendedAt) || other.attendedAt == attendedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.minutesLate, minutesLate) || other.minutesLate == minutesLate)&&(identical(other.entryAt, entryAt) || other.entryAt == entryAt)&&(identical(other.exitToLunchAt, exitToLunchAt) || other.exitToLunchAt == exitToLunchAt)&&(identical(other.entryFromLunchAt, entryFromLunchAt) || other.entryFromLunchAt == entryFromLunchAt)&&(identical(other.exitAt, exitAt) || other.exitAt == exitAt)&&(identical(other.entryPhoto, entryPhoto) || other.entryPhoto == entryPhoto)&&(identical(other.exitToLunchPhoto, exitToLunchPhoto) || other.exitToLunchPhoto == exitToLunchPhoto)&&(identical(other.entryFromLunchPhoto, entryFromLunchPhoto) || other.entryFromLunchPhoto == entryFromLunchPhoto)&&(identical(other.exitPhoto, exitPhoto) || other.exitPhoto == exitPhoto)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,user,attendedAt,status,minutesLate,entryAt,exitToLunchAt,entryFromLunchAt,exitAt,entryPhoto,exitToLunchPhoto,entryFromLunchPhoto,exitPhoto,notes);

@override
String toString() {
  return 'AsistenciaDaily(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, attendedAt: $attendedAt, status: $status, minutesLate: $minutesLate, entryAt: $entryAt, exitToLunchAt: $exitToLunchAt, entryFromLunchAt: $entryFromLunchAt, exitAt: $exitAt, entryPhoto: $entryPhoto, exitToLunchPhoto: $exitToLunchPhoto, entryFromLunchPhoto: $entryFromLunchPhoto, exitPhoto: $exitPhoto, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AsistenciaDailyCopyWith<$Res> implements $AsistenciaDailyCopyWith<$Res> {
  factory _$AsistenciaDailyCopyWith(_AsistenciaDaily value, $Res Function(_AsistenciaDaily) _then) = __$AsistenciaDailyCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime createdAt, DateTime updatedAt, User user, DateTime attendedAt, AsistenciaStatus status, int minutesLate, DateTime? entryAt, DateTime? exitToLunchAt, DateTime? entryFromLunchAt, DateTime? exitAt, String? entryPhoto, String? exitToLunchPhoto, String? entryFromLunchPhoto, String? exitPhoto, String? notes
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AsistenciaDailyCopyWithImpl<$Res>
    implements _$AsistenciaDailyCopyWith<$Res> {
  __$AsistenciaDailyCopyWithImpl(this._self, this._then);

  final _AsistenciaDaily _self;
  final $Res Function(_AsistenciaDaily) _then;

/// Create a copy of AsistenciaDaily
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? user = null,Object? attendedAt = null,Object? status = null,Object? minutesLate = null,Object? entryAt = freezed,Object? exitToLunchAt = freezed,Object? entryFromLunchAt = freezed,Object? exitAt = freezed,Object? entryPhoto = freezed,Object? exitToLunchPhoto = freezed,Object? entryFromLunchPhoto = freezed,Object? exitPhoto = freezed,Object? notes = freezed,}) {
  return _then(_AsistenciaDaily(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,attendedAt: null == attendedAt ? _self.attendedAt : attendedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AsistenciaStatus,minutesLate: null == minutesLate ? _self.minutesLate : minutesLate // ignore: cast_nullable_to_non_nullable
as int,entryAt: freezed == entryAt ? _self.entryAt : entryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exitToLunchAt: freezed == exitToLunchAt ? _self.exitToLunchAt : exitToLunchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,entryFromLunchAt: freezed == entryFromLunchAt ? _self.entryFromLunchAt : entryFromLunchAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exitAt: freezed == exitAt ? _self.exitAt : exitAt // ignore: cast_nullable_to_non_nullable
as DateTime?,entryPhoto: freezed == entryPhoto ? _self.entryPhoto : entryPhoto // ignore: cast_nullable_to_non_nullable
as String?,exitToLunchPhoto: freezed == exitToLunchPhoto ? _self.exitToLunchPhoto : exitToLunchPhoto // ignore: cast_nullable_to_non_nullable
as String?,entryFromLunchPhoto: freezed == entryFromLunchPhoto ? _self.entryFromLunchPhoto : entryFromLunchPhoto // ignore: cast_nullable_to_non_nullable
as String?,exitPhoto: freezed == exitPhoto ? _self.exitPhoto : exitPhoto // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AsistenciaDaily
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on

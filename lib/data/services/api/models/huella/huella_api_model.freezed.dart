// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'huella_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HuellaApiModel implements DiagnosticableTreeMixin {

 int? get id; DateTime? get createdAt; DateTime? get updatedAt;/// Fingerprint template encoded as base64 string
 String get template; String get hand; String get finger; int get usuario;@JsonKey(includeToJson: false) UserInfo? get userInfo;
/// Create a copy of HuellaApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HuellaApiModelCopyWith<HuellaApiModel> get copyWith => _$HuellaApiModelCopyWithImpl<HuellaApiModel>(this as HuellaApiModel, _$identity);

  /// Serializes this HuellaApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HuellaApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('template', template))..add(DiagnosticsProperty('hand', hand))..add(DiagnosticsProperty('finger', finger))..add(DiagnosticsProperty('usuario', usuario))..add(DiagnosticsProperty('userInfo', userInfo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HuellaApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.template, template) || other.template == template)&&(identical(other.hand, hand) || other.hand == hand)&&(identical(other.finger, finger) || other.finger == finger)&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,template,hand,finger,usuario,userInfo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HuellaApiModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, template: $template, hand: $hand, finger: $finger, usuario: $usuario, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class $HuellaApiModelCopyWith<$Res>  {
  factory $HuellaApiModelCopyWith(HuellaApiModel value, $Res Function(HuellaApiModel) _then) = _$HuellaApiModelCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, String template, String hand, String finger, int usuario,@JsonKey(includeToJson: false) UserInfo? userInfo
});


$UserInfoCopyWith<$Res>? get userInfo;

}
/// @nodoc
class _$HuellaApiModelCopyWithImpl<$Res>
    implements $HuellaApiModelCopyWith<$Res> {
  _$HuellaApiModelCopyWithImpl(this._self, this._then);

  final HuellaApiModel _self;
  final $Res Function(HuellaApiModel) _then;

/// Create a copy of HuellaApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? template = null,Object? hand = null,Object? finger = null,Object? usuario = null,Object? userInfo = freezed,}) {
  return _then(HuellaApiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as String,finger: null == finger ? _self.finger : finger // ignore: cast_nullable_to_non_nullable
as String,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfo?,
  ));
}
/// Create a copy of HuellaApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [HuellaApiModel].
extension HuellaApiModelPatterns on HuellaApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HuellaApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HuellaApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HuellaApiModel value)  $default,){
final _that = this;
switch (_that) {
case _HuellaApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HuellaApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _HuellaApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  String template,  String hand,  String finger,  int usuario, @JsonKey(includeToJson: false)  UserInfo? userInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HuellaApiModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.template,_that.hand,_that.finger,_that.usuario,_that.userInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  String template,  String hand,  String finger,  int usuario, @JsonKey(includeToJson: false)  UserInfo? userInfo)  $default,) {final _that = this;
switch (_that) {
case _HuellaApiModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.template,_that.hand,_that.finger,_that.usuario,_that.userInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  String template,  String hand,  String finger,  int usuario, @JsonKey(includeToJson: false)  UserInfo? userInfo)?  $default,) {final _that = this;
switch (_that) {
case _HuellaApiModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.template,_that.hand,_that.finger,_that.usuario,_that.userInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HuellaApiModel with DiagnosticableTreeMixin implements HuellaApiModel {
  const _HuellaApiModel({this.id, this.createdAt, this.updatedAt, required this.template, required this.hand, required this.finger, required this.usuario, @JsonKey(includeToJson: false) this.userInfo});
  factory _HuellaApiModel.fromJson(Map<String, dynamic> json) => _$HuellaApiModelFromJson(json);

@override final  int? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
/// Fingerprint template encoded as base64 string
@override final  String template;
@override final  String hand;
@override final  String finger;
@override final  int usuario;
@override@JsonKey(includeToJson: false) final  UserInfo? userInfo;

/// Create a copy of HuellaApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HuellaApiModelCopyWith<_HuellaApiModel> get copyWith => __$HuellaApiModelCopyWithImpl<_HuellaApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HuellaApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HuellaApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('template', template))..add(DiagnosticsProperty('hand', hand))..add(DiagnosticsProperty('finger', finger))..add(DiagnosticsProperty('usuario', usuario))..add(DiagnosticsProperty('userInfo', userInfo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HuellaApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.template, template) || other.template == template)&&(identical(other.hand, hand) || other.hand == hand)&&(identical(other.finger, finger) || other.finger == finger)&&(identical(other.usuario, usuario) || other.usuario == usuario)&&(identical(other.userInfo, userInfo) || other.userInfo == userInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,template,hand,finger,usuario,userInfo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HuellaApiModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, template: $template, hand: $hand, finger: $finger, usuario: $usuario, userInfo: $userInfo)';
}


}

/// @nodoc
abstract mixin class _$HuellaApiModelCopyWith<$Res> implements $HuellaApiModelCopyWith<$Res> {
  factory _$HuellaApiModelCopyWith(_HuellaApiModel value, $Res Function(_HuellaApiModel) _then) = __$HuellaApiModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, String template, String hand, String finger, int usuario,@JsonKey(includeToJson: false) UserInfo? userInfo
});


@override $UserInfoCopyWith<$Res>? get userInfo;

}
/// @nodoc
class __$HuellaApiModelCopyWithImpl<$Res>
    implements _$HuellaApiModelCopyWith<$Res> {
  __$HuellaApiModelCopyWithImpl(this._self, this._then);

  final _HuellaApiModel _self;
  final $Res Function(_HuellaApiModel) _then;

/// Create a copy of HuellaApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? template = null,Object? hand = null,Object? finger = null,Object? usuario = null,Object? userInfo = freezed,}) {
  return _then(_HuellaApiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as String,finger: null == finger ? _self.finger : finger // ignore: cast_nullable_to_non_nullable
as String,usuario: null == usuario ? _self.usuario : usuario // ignore: cast_nullable_to_non_nullable
as int,userInfo: freezed == userInfo ? _self.userInfo : userInfo // ignore: cast_nullable_to_non_nullable
as UserInfo?,
  ));
}

/// Create a copy of HuellaApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
    return _then(_self.copyWith(userInfo: value));
  });
}
}


/// @nodoc
mixin _$UserInfo implements DiagnosticableTreeMixin {

 int get id; String get username;
/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoCopyWith<UserInfo> get copyWith => _$UserInfoCopyWithImpl<UserInfo>(this as UserInfo, _$identity);

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserInfo'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserInfo(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class $UserInfoCopyWith<$Res>  {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) _then) = _$UserInfoCopyWithImpl;
@useResult
$Res call({
 int id, String username
});




}
/// @nodoc
class _$UserInfoCopyWithImpl<$Res>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._self, this._then);

  final UserInfo _self;
  final $Res Function(UserInfo) _then;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,}) {
  return _then(UserInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfo].
extension UserInfoPatterns on UserInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfo value)  $default,){
final _that = this;
switch (_that) {
case _UserInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfo value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username)  $default,) {final _that = this;
switch (_that) {
case _UserInfo():
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username)?  $default,) {final _that = this;
switch (_that) {
case _UserInfo() when $default != null:
return $default(_that.id,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInfo with DiagnosticableTreeMixin implements UserInfo {
  const _UserInfo({required this.id, required this.username});
  factory _UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

@override final  int id;
@override final  String username;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoCopyWith<_UserInfo> get copyWith => __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserInfo'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserInfo(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class _$UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) _then) = __$UserInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String username
});




}
/// @nodoc
class __$UserInfoCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(this._self, this._then);

  final _UserInfo _self;
  final $Res Function(_UserInfo) _then;

/// Create a copy of UserInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,}) {
  return _then(_UserInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

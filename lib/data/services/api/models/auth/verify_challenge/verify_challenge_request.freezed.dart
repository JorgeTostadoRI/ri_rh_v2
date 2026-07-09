// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_challenge_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyChallengeRequest implements DiagnosticableTreeMixin {

 String get authSessionId; String get deviceId; String get nonce; String get signature; String get username;
/// Create a copy of VerifyChallengeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyChallengeRequestCopyWith<VerifyChallengeRequest> get copyWith => _$VerifyChallengeRequestCopyWithImpl<VerifyChallengeRequest>(this as VerifyChallengeRequest, _$identity);

  /// Serializes this VerifyChallengeRequest to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VerifyChallengeRequest'))
    ..add(DiagnosticsProperty('authSessionId', authSessionId))..add(DiagnosticsProperty('deviceId', deviceId))..add(DiagnosticsProperty('nonce', nonce))..add(DiagnosticsProperty('signature', signature))..add(DiagnosticsProperty('username', username));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyChallengeRequest&&(identical(other.authSessionId, authSessionId) || other.authSessionId == authSessionId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authSessionId,deviceId,nonce,signature,username);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VerifyChallengeRequest(authSessionId: $authSessionId, deviceId: $deviceId, nonce: $nonce, signature: $signature, username: $username)';
}


}

/// @nodoc
abstract mixin class $VerifyChallengeRequestCopyWith<$Res>  {
  factory $VerifyChallengeRequestCopyWith(VerifyChallengeRequest value, $Res Function(VerifyChallengeRequest) _then) = _$VerifyChallengeRequestCopyWithImpl;
@useResult
$Res call({
 String authSessionId, String deviceId, String nonce, String signature, String username
});




}
/// @nodoc
class _$VerifyChallengeRequestCopyWithImpl<$Res>
    implements $VerifyChallengeRequestCopyWith<$Res> {
  _$VerifyChallengeRequestCopyWithImpl(this._self, this._then);

  final VerifyChallengeRequest _self;
  final $Res Function(VerifyChallengeRequest) _then;

/// Create a copy of VerifyChallengeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authSessionId = null,Object? deviceId = null,Object? nonce = null,Object? signature = null,Object? username = null,}) {
  return _then(VerifyChallengeRequest(
authSessionId: null == authSessionId ? _self.authSessionId : authSessionId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,signature: null == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyChallengeRequest].
extension VerifyChallengeRequestPatterns on VerifyChallengeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyChallengeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyChallengeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyChallengeRequest value)  $default,){
final _that = this;
switch (_that) {
case _VerifyChallengeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyChallengeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyChallengeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authSessionId,  String deviceId,  String nonce,  String signature,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyChallengeRequest() when $default != null:
return $default(_that.authSessionId,_that.deviceId,_that.nonce,_that.signature,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authSessionId,  String deviceId,  String nonce,  String signature,  String username)  $default,) {final _that = this;
switch (_that) {
case _VerifyChallengeRequest():
return $default(_that.authSessionId,_that.deviceId,_that.nonce,_that.signature,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authSessionId,  String deviceId,  String nonce,  String signature,  String username)?  $default,) {final _that = this;
switch (_that) {
case _VerifyChallengeRequest() when $default != null:
return $default(_that.authSessionId,_that.deviceId,_that.nonce,_that.signature,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyChallengeRequest with DiagnosticableTreeMixin implements VerifyChallengeRequest {
  const _VerifyChallengeRequest({required this.authSessionId, required this.deviceId, required this.nonce, required this.signature, required this.username});
  factory _VerifyChallengeRequest.fromJson(Map<String, dynamic> json) => _$VerifyChallengeRequestFromJson(json);

@override final  String authSessionId;
@override final  String deviceId;
@override final  String nonce;
@override final  String signature;
@override final  String username;

/// Create a copy of VerifyChallengeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyChallengeRequestCopyWith<_VerifyChallengeRequest> get copyWith => __$VerifyChallengeRequestCopyWithImpl<_VerifyChallengeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyChallengeRequestToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'VerifyChallengeRequest'))
    ..add(DiagnosticsProperty('authSessionId', authSessionId))..add(DiagnosticsProperty('deviceId', deviceId))..add(DiagnosticsProperty('nonce', nonce))..add(DiagnosticsProperty('signature', signature))..add(DiagnosticsProperty('username', username));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyChallengeRequest&&(identical(other.authSessionId, authSessionId) || other.authSessionId == authSessionId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authSessionId,deviceId,nonce,signature,username);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'VerifyChallengeRequest(authSessionId: $authSessionId, deviceId: $deviceId, nonce: $nonce, signature: $signature, username: $username)';
}


}

/// @nodoc
abstract mixin class _$VerifyChallengeRequestCopyWith<$Res> implements $VerifyChallengeRequestCopyWith<$Res> {
  factory _$VerifyChallengeRequestCopyWith(_VerifyChallengeRequest value, $Res Function(_VerifyChallengeRequest) _then) = __$VerifyChallengeRequestCopyWithImpl;
@override @useResult
$Res call({
 String authSessionId, String deviceId, String nonce, String signature, String username
});




}
/// @nodoc
class __$VerifyChallengeRequestCopyWithImpl<$Res>
    implements _$VerifyChallengeRequestCopyWith<$Res> {
  __$VerifyChallengeRequestCopyWithImpl(this._self, this._then);

  final _VerifyChallengeRequest _self;
  final $Res Function(_VerifyChallengeRequest) _then;

/// Create a copy of VerifyChallengeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authSessionId = null,Object? deviceId = null,Object? nonce = null,Object? signature = null,Object? username = null,}) {
  return _then(_VerifyChallengeRequest(
authSessionId: null == authSessionId ? _self.authSessionId : authSessionId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,signature: null == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

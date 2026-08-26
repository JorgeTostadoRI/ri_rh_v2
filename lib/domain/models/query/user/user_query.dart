import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_query.freezed.dart';

@freezed
abstract class UserQuery with _$UserQuery {
  const factory UserQuery({
    bool? active,
    UserQueryOrder? order,
  }) = _UserQuery;
}

enum UserQueryOrder {
  nombre
}

extension UserQueryExtension on UserQuery {
  Map<String, dynamic>? toMap() {
    final mapped = {
      if (active != null)
        'active': active,
      if (order != null)
        'order': order!.name,
    };
    if (mapped.isEmpty) return null;
    return mapped;
  }
}
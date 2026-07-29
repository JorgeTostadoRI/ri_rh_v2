import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/utils/time/time.dart';

part 'horario.freezed.dart';
part 'horario.g.dart';

@freezed
abstract class Horario with _$Horario {
  const factory Horario({
    @Default(0)
    int id,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String name,
    @TimeConverter()
    required Time firstStartTime,
    @TimeConverter()
    required Time firstEndTime,
    @TimeConverter()
    required Time secondStartTime,
    @TimeConverter()
    required Time secondEndTime,
    required bool mon,
    required bool tue,
    required bool wed,
    required bool thu,
    required bool fri,
    required bool sat,
    required bool sun,
  }) = _Horario;

  factory Horario.fromJson(Map<String, Object?> json) => _$HorarioFromJson(json);
}

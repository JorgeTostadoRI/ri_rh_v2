import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';

part 'asistencia_daily_api_model.freezed.dart';
part 'asistencia_daily_api_model.g.dart';

@freezed
abstract class AsistenciaDailyApiModel with _$AsistenciaDailyApiModel {
    const factory AsistenciaDailyApiModel({
        required int id,
        required DateTime createdAt,
        required DateTime updatedAt,
        @JsonKey(name: 'usuario')
        required int userRef,
        required DateTime attendedAt,
        required AsistenciaStatus status,
        required int minutesLate,
        DateTime? entryAt,
        DateTime? exitToLunchAt,
        DateTime? entryFromLunchAt,
        DateTime? exitAt,
        String? entryPhoto,
        String? exitToLunchPhoto,
        String? entryFromLunchPhoto,
        String? exitPhoto,
        String? notes,
    }) = _AsistenciaDailyApiModel;

    factory AsistenciaDailyApiModel.fromJson(Map<String, Object?> json) => _$AsistenciaDailyApiModelFromJson(json);
}

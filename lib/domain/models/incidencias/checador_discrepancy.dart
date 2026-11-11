import 'package:freezed_annotation/freezed_annotation.dart';

part 'checador_discrepancy.freezed.dart';
part 'checador_discrepancy.g.dart';

@freezed
abstract class ChecadorDiscrepancy with _$ChecadorDiscrepancy {
    const factory ChecadorDiscrepancy({
        required bool checked,
        @JsonKey(name: 'is_suspicious')
        required bool isSuspicious,
        @JsonKey(name: 'overlaps_normal_schedule')
        required bool overlapsNormalSchedule,
        @JsonKey(name: 'has_checador_evidence')
        required bool hasChecadorEvidence,
        required String message,
        /// Solo Horas extra (null en Hora por hora o con un servidor anterior):
        /// horas solicitadas y las que se pagan en nómina según el checador.
        @JsonKey(name: 'horas_solicitadas')
        double? horasSolicitadas,
        @JsonKey(name: 'horas_a_pagar')
        double? horasAPagar,
        @JsonKey(name: 'sin_salida')
        @Default(false) bool sinSalida,
    }) = _ChecadorDiscrepancy;

    factory ChecadorDiscrepancy.fromJson(Map<String, Object?> json) => _$ChecadorDiscrepancyFromJson(json);
}

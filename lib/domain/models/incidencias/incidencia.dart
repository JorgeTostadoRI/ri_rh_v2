import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/model_exception.dart';

part 'incidencia.freezed.dart';
part 'incidencia.g.dart';

@JsonEnum()
enum IncidenciaState {
  @JsonValue('PE')
  pending,
  @JsonValue('RE')
  rejected,
  @JsonValue('AP')
  approved,
}

extension IncidenciaStateValue on IncidenciaState {
  String get jsonValue => _$IncidenciaStateEnumMap[this]!;
}

@JsonEnum(valueField: 'id')
enum IncidenciaCategory {
  permiso('permiso', 'permisos', 'Permisos'),
  horasextra('horasextra', 'horas-extras', 'Horas Extras'),
  vacaciones('vacaciones', 'vacaciones', 'Vacaciones'),
  incapacidad('incapacidad', 'incapacidades', 'Incapacidades'),
  requerimientojudicial('requerimientojudicial', 'requerimientos-judiciales', 'Requerimientos Judiciales'),
  falta('falta', 'faltas', 'Faltas'),
  retardo('retardo', 'retardos', 'Retardos');

  final String id;
  final String url;
  final String label;
  const IncidenciaCategory(this.id, this.url, this.label);
}

@freezed
abstract class Incidencia with _$Incidencia {
    const factory Incidencia({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        IncidenciaState? state,

        // Se puede agregar por RH
        User? solicitor,

        /// Quien dio aprobacion por jefe directo
        User? approvedBy,
        /// Quien dio aprobacion por RH
        User? rhApprovedBy,

        // Agregado al rechazar la incidencia
        String? rejectionReason,
        User? rejectedBy,

        String? pdfUrl,
        
        required DateTime start,
        required DateTime end,
        required String reason,
        required List<IncidenciaFile> files,

        required IncidenciaCategory category,
    }) = _Incidencia;

    factory Incidencia.fromJson(Map<String, Object?> json) => _$IncidenciaFromJson(json);

    factory Incidencia.fromApiModel(IncidenciaApiModel model, {
      required List<User> users,
    }) {
      late final User solicitor;
      late final User? approvedBy;
      late final User? rhApprovedBy;
      late final User? rejectedBy;

      try {
        solicitor = users.firstWhere((user) => user.id == model.solicitorRef);
        if (model.approvedByRef != null) {
          approvedBy = users.firstWhere((user) => user.id == model.approvedByRef);
        } else {
          approvedBy = null;
        }
        if (model.rhApprovedByRef != null) {
          rhApprovedBy = users.firstWhere((user) => user.id == model.rhApprovedByRef);
        } else {
          rhApprovedBy = null;
        }
        if (model.rejectedByRef != null) {
          rejectedBy = users.firstWhere((user) => user.id == model.rejectedByRef);
        } else {
          rejectedBy = null;
        }
      } on StateError {
        throw ModelException(
          'Failed to find element for incidencia',
          context: {
            'model': 'Incidencia',
            'category': model.category,
            'id': model.id,
            'solicitorRef': model.solicitorRef,
            'approvedByRef': model.approvedByRef,
            'rhApprovedByRef': model.rhApprovedByRef,
            'rejectedBy': model.rejectedByRef,
          },
        );
      }

      return Incidencia(
        id: model.id,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        state: model.state,
        solicitor: solicitor,
        approvedBy: approvedBy,
        rhApprovedBy: rhApprovedBy,
        rejectionReason: model.rejectionReason,
        rejectedBy: rejectedBy,
        pdfUrl: model.pdfUrl,
        start: model.start,
        end: model.end,
        reason: model.reason,
        files: model.files,
        category: model.category,
      );
    }
}

extension IncidenciaGetters on Incidencia {
  String get categoryName {
    return switch(category) {
      IncidenciaCategory.permiso => 'Permiso',
      IncidenciaCategory.falta => 'Falta',
      IncidenciaCategory.horasextra => 'Horas Extra',
      IncidenciaCategory.vacaciones => 'Vacaciones',
      IncidenciaCategory.retardo => 'Retardo',
      IncidenciaCategory.incapacidad => 'Incapacidad',
      IncidenciaCategory.requerimientojudicial => 'Requerimiento Judicial',
    };
  }
}

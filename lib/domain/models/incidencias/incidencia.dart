import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/checador_discrepancy.dart';
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

        /// Solo aplica (no-null) para Horas Extra con horario asignado.
        ChecadorDiscrepancy? checadorDiscrepancy,

        /// Solo aplican para Permiso.
        bool? conGoce,
        /// Quien dio la aprobacion especial de con goce (ver [conGoce]).
        User? conGoceApprovedBy,

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
      late final User? conGoceApprovedBy;

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
        if (model.conGoceApprovedByRef != null) {
          conGoceApprovedBy = users.firstWhere((user) => user.id == model.conGoceApprovedByRef);
        } else {
          conGoceApprovedBy = null;
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
        checadorDiscrepancy: model.checadorDiscrepancy,
        conGoce: model.conGoce,
        conGoceApprovedBy: conGoceApprovedBy,
        start: model.start,
        end: model.end,
        reason: model.reason,
        files: model.files,
        category: model.category,
      );
    }
}

enum IncidenciaApprovalStage {
  awaitingBoss,
  /// Solo aplica a Permiso con goce de sueldo.
  awaitingConGoceApprover,
  awaitingRH,
  done
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

  bool get _requiresConGoceApprover => category == IncidenciaCategory.permiso && conGoce == true;

  IncidenciaApprovalStage get approvalStage {
    if (state == IncidenciaState.approved) {
      return IncidenciaApprovalStage.done;
    }

    if (approvedBy == null) {
      return IncidenciaApprovalStage.awaitingBoss;
    }

    if (_requiresConGoceApprover && conGoceApprovedBy == null) {
      return IncidenciaApprovalStage.awaitingConGoceApprover;
    }

    return IncidenciaApprovalStage.awaitingRH;
  }

  /// Numero total de pasos de aprobacion de esta incidencia especifica --
  /// varia porque solo Permiso con goce tiene el paso extra de
  /// [IncidenciaApprovalStage.awaitingConGoceApprover].
  int get totalApprovalSteps => _requiresConGoceApprover ? 4 : 3;

  /// Indice (0-based) del paso actual, consistente con [totalApprovalSteps] --
  /// no se debe usar [IncidenciaApprovalStage.index] directamente para esto,
  /// porque ese indice es fijo para el enum completo (4 valores), sin importar
  /// si esta incidencia en particular solo tiene 3 pasos.
  int get approvalStepIndex {
    if (state == IncidenciaState.approved) {
      return totalApprovalSteps - 1;
    }
    if (approvedBy == null) {
      return 0;
    }
    if (_requiresConGoceApprover) {
      return conGoceApprovedBy == null ? 1 : 2;
    }
    return 1;
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/rejection_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/status_chip.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_authorized_by_section.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_justificacion_goce_section.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_permiso_repuesto_section.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_tiempo_por_tiempo_section.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_video_section.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

typedef IncidenciaApproveDialogResult = ({
  IncidenciaState state,
  String rejectionReason,
  bool? conGoce,
  String? conGoceJustificacion,
});

class IncidenciaApproveDialog extends StatefulWidget {
  const IncidenciaApproveDialog({
    super.key,
    required this.incidencia,
  });

  final Incidencia incidencia;

  @override
  State<IncidenciaApproveDialog> createState() => _IncidenciaApproveDialogState();
}

class _IncidenciaApproveDialogState extends State<IncidenciaApproveDialog> {
  final _yMMMMd = DateFormat.yMMMMd();
  final _yMMMMdjm = DateFormat.yMMMMd().add_jm();
  final _yMd = DateFormat.yMd();

  late final DateTime _localStart;
  late final DateTime _localEnd;

  bool _conGoce = false;
  final _justificacionController = TextEditingController();

  /// Un Permiso "por horas" (rango de horas dentro del mismo dia, no un dia
  /// completo) nunca pide con/sin goce -- se trata siempre como un Retardo
  /// (ver Fase G). Mismo criterio que el backend (es_permiso_por_horas en
  /// ri_rh/models/asistencia.py): mismo dia calendario y no cubre el dia
  /// completo (00:00-23:59, la convencion que ya usa el resto del sistema).
  bool get _esPermisoPorHoras {
    if (widget.incidencia.category != IncidenciaCategory.permiso) return false;
    if (!_localStart.isSameDay(_localEnd)) return false;
    final esDiaCompleto = _localStart.hour == 0 && _localStart.minute == 0 && _localEnd.hour == 23 && _localEnd.minute == 59;
    return !esDiaCompleto;
  }

  /// Solo el jefe directo (primer paso de aprobacion) decide si un Permiso
  /// de dia completo es con o sin goce de sueldo -- RH ya no puede
  /// cambiarlo en su paso.
  bool get _askConGoce =>
      widget.incidencia.category == IncidenciaCategory.permiso &&
      widget.incidencia.approvalStage == IncidenciaApprovalStage.awaitingBoss &&
      !_esPermisoPorHoras;

  bool get _isConGoceApproverTurn =>
      widget.incidencia.approvalStage == IncidenciaApprovalStage.awaitingConGoceApprover;

  /// Con goce, el jefe directo debe justificar por que -- el backend tambien
  /// lo exige (ApproveIncidenciaRequestSerializer).
  bool get _requiereJustificacion => _askConGoce && _conGoce;

  /// Hora por hora: el jefe directo deberia aprobarla antes de que empiece
  /// la reposicion -- si ya empezo solo se le avisa, no se bloquea.
  bool get _reposicionYaEmpezo =>
      widget.incidencia.category == IncidenciaCategory.horaporhora &&
      widget.incidencia.approvalStage == IncidenciaApprovalStage.awaitingBoss &&
      DateTime.now().isAfter(widget.incidencia.start);

  bool get _puedeAprobar =>!_requiereJustificacion || _justificacionController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _localStart = widget.incidencia.start.toLocal();
    _localEnd = widget.incidencia.end.toLocal();

    // Tiempo por tiempo: el jefe normalmente lo aprueba con goce por ese
    // motivo -- se le prellena, pero lo puede cambiar.
    if (_askConGoce && widget.incidencia.tiempoPorTiempo == true) {
      _conGoce = true;
      _justificacionController.text = 'Permiso con goce por tiempo por tiempo.';
    }
  }

  @override
  void dispose() {
    _justificacionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final incidencia = widget.incidencia;

    return AlertDialog(
      scrollable: true,
      title: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Text(
            '${widget.incidencia.categoryName} para ${widget.incidencia.solicitor!.nombre} en ${_formatTitleDates()}',
          ),
          if (incidencia.category == IncidenciaCategory.permiso && incidencia.conGoce == true)
            StatusChip(type: StatusChipType.warning, label: 'CON GOCE'),
        ],
      ),
      content: Column(
        crossAxisAlignment: .start,
        children: [
          if (_isConGoceApproverTurn)
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: statusWarningBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(LucideIcons.shieldCheck, color: statusWarningColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Estás aprobando este permiso como responsable de autorizar goce de sueldo. Verifica que efectivamente deba ser con goce antes de aprobar.',
                        style: textTheme.bodyMedium?.copyWith(color: statusWarningColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (incidencia.category == IncidenciaCategory.permiso && incidencia.conGoce == true && incidencia.conGoceJustificacion != null)
            IncidenciaJustificacionGoceSection(justificacion: incidencia.conGoceJustificacion!),
          if (_reposicionYaEmpezo)
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: statusWarningBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(LucideIcons.clockAlert, color: statusWarningColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'El horario de la Hora por hora ya empezó. Lo esperado es aprobarla antes de que la persona cheque; aun así puedes aprobarla.',
                        style: textTheme.bodyMedium?.copyWith(color: statusWarningColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (incidencia.category == IncidenciaCategory.horaporhora && incidencia.permiso != null)
            IncidenciaPermisoRepuestoSection(permiso: incidencia.permiso!),
          if (incidencia.category == IncidenciaCategory.permiso && incidencia.tiempoPorTiempo == true && incidencia.horasPorHora != null)
            IncidenciaTiempoPorTiempoSection(
              horasPorHora: incidencia.horasPorHora!,
              mostrarAlerta: incidencia.approvalStage == IncidenciaApprovalStage.awaitingConGoceApprover
                || incidencia.approvalStage == IncidenciaApprovalStage.awaitingRH,
            ),
          Text('Fecha de creación', style: textTheme.headlineSmall),
          Text(_yMMMMdjm.format(widget.incidencia.createdAt!.toLocal())),
          const SizedBox(height: 24),
          Text('Solicitor', style: textTheme.headlineSmall),
          Text(widget.incidencia.solicitor!.nombre),
          const SizedBox(height: 24),
          Text('Fechas solicitadas', style: textTheme.headlineSmall),
          Text(_formatRequestedDates()),
          const SizedBox(height: 24),
          Text('Estado de aprobación', style: textTheme.headlineSmall),
          Text(
            switch (incidencia.approvalStage) {
              IncidenciaApprovalStage.awaitingBoss => 'Esperando aprobación de jefe directo',
              IncidenciaApprovalStage.awaitingConGoceApprover => 'Esperando aprobación de Iván Romero',
              IncidenciaApprovalStage.awaitingRH => 'Esperando aprobación de Recursos Humanos',
              IncidenciaApprovalStage.done => 'Completado',
            },
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          IncidenciaAuthorizedBySection(incidencia: incidencia),
          if (_askConGoce) ...[
            const SizedBox(height: 24),
            Text('¿Con goce de sueldo?', style: textTheme.headlineSmall),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _conGoce,
              onChanged: (value) => setState(() => _conGoce = value),
              title: Text(_conGoce ? 'Con goce de sueldo' : 'Sin goce de sueldo'),
            ),
            if (_conGoce) ...[
              const SizedBox(height: 8),
              TextField(
                controller: _justificacionController,
                onChanged: (_) => setState(() {}),
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Justificación del goce de sueldo',
                  hintText: '¿Por qué este permiso debe ser con goce de sueldo?',
                  helperText: 'Obligatoria. La verán Iván Romero y Recursos Humanos.',
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ],
          const SizedBox(height: 24),
          Text('Motivo', style: textTheme.headlineSmall),
          Text(widget.incidencia.reason, style: textTheme.bodyMedium),
          if (incidencia.videoUrl != null)
            IncidenciaVideoSection(videoUrl: incidencia.videoUrl!),
          if (incidencia.files.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Text('Archivos adjuntos', style: textTheme.headlineSmall),
                  ...List<Widget>.generate(
                    incidencia.files.length,
                    (index) {
                      final file = incidencia.files[index];
                      late final String filename;
                      try {
                        filename = file.filepath.split('/').last;
                      } catch (e) {
                        filename = 'Sin nombre';
                      }
                      return ListTile(
                        title: Text(filename),
                        trailing: IconButton(
                          onPressed: () {
                            try {
                              final url = Uri.parse(file.filepath);
                              launchUrl(url);
                            } catch (e, stackTrace) {
                              context.read<AppLogger>().error('Failed to launch URL', error: e, stackTrace: stackTrace);    
                            }
                          },
                          icon: Icon(LucideIcons.externalLink),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          if (incidencia.checadorDiscrepancy?.isSuspicious ?? false)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: statusWarningBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    Icon(LucideIcons.triangleAlert, color: statusWarningColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        spacing: 4,
                        children: [
                          Text(
                            incidencia.category == IncidenciaCategory.horaporhora
                              ? 'Reposición sin respaldo del checador'
                              : 'Posible discrepancia con el checador',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: .w700,
                              color: statusWarningColor,
                            ),
                          ),
                          Text(
                            incidencia.checadorDiscrepancy!.message,
                            style: textTheme.bodyMedium?.copyWith(color: statusWarningColor),
                          ),
                          Text(
                            'Esto no impide aprobar la solicitud, es solo informativo.',
                            style: textTheme.labelMedium?.copyWith(color: statusWarningColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () async {
            final rejectionReason = await showDialog<String?>(
              context: context,
              builder: (context) => RejectionDialog(),
            );
            if (rejectionReason != null && rejectionReason.isNotEmpty) {
              final IncidenciaApproveDialogResult result = (
                state: IncidenciaState.rejected,
                rejectionReason: rejectionReason,
                conGoce: null,
                conGoceJustificacion: null,
              );
              context.pop(result);
            }
          },
          icon: Icon(LucideIcons.x),
          label: Text('Rechazar'),
        ),
        ElevatedButton.icon(
          onPressed: _puedeAprobar
            ? () => context.pop((
                state: IncidenciaState.approved,
                rejectionReason: '',
                conGoce: _askConGoce ? _conGoce : null,
                conGoceJustificacion: _requiereJustificacion ? _justificacionController.text.trim() : null,
              ))
            : null,
          icon: Icon(LucideIcons.circleCheckBig),
          label: Text('Aprobar'),
        ),
      ],
    );
  }

  String _formatTitleDates() {
    if (_localStart.isSameDay(_localEnd)) {
      return _yMd.format(widget.incidencia.start.toLocal());
    } else {
      return '${_yMd.format(_localStart)} hasta ${_yMd.format(_localEnd)}';
    }
  }

  String _formatRequestedDates() {
    if (_localStart == _localEnd) {
      return _yMMMMd.format(_localStart);
    }
    return '${_yMMMMdjm.format(_localStart)} hasta ${_yMMMMdjm.format(_localEnd)}';
  }
}

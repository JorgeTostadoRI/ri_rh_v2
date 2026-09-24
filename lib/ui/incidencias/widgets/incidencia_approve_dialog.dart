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
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

typedef IncidenciaApproveDialogResult = ({IncidenciaState state, String rejectionReason, bool? conGoce});

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

  /// Solo el jefe directo (primer paso de aprobacion) decide si un Permiso
  /// es con o sin goce de sueldo -- RH ya no puede cambiarlo en su paso.
  bool get _askConGoce =>
      widget.incidencia.category == IncidenciaCategory.permiso &&
      widget.incidencia.approvalStage == IncidenciaApprovalStage.awaitingBoss;

  bool get _isConGoceApproverTurn =>
      widget.incidencia.approvalStage == IncidenciaApprovalStage.awaitingConGoceApprover;

  @override
  void initState() {
    super.initState();
    _localStart = widget.incidencia.start.toLocal();
    _localEnd = widget.incidencia.end.toLocal();
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
          ],
          const SizedBox(height: 24),
          Text('Motivo', style: textTheme.headlineSmall),
          Text(widget.incidencia.reason, style: textTheme.bodyMedium),
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
                            'Posible discrepancia con el checador',
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
              );
              context.pop(result);
            }
          },
          icon: Icon(LucideIcons.x),
          label: Text('Rechazar'),
        ),
        ElevatedButton.icon(
          onPressed: () => context.pop((
            state: IncidenciaState.approved,
            rejectionReason: '',
            conGoce: _askConGoce ? _conGoce : null,
          )),
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

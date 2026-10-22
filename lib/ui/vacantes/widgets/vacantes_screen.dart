import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/field_switcher.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/core/ui/step_timeline.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/altas_imss_viewmodel.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/vacantes_viewmodel.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/fase2_altas_imss_section.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/fase2_progress_panel.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/iniciar_candidato_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/solicitud_vacante_edit_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/solicitud_vacante_form_dialog.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VacantesScreen extends StatefulWidget {
  const VacantesScreen({super.key, required this.viewmodel, required this.altasImssViewmodel});

  final VacantesViewmodel viewmodel;
  final AltasImssViewmodel altasImssViewmodel;

  @override
  State<VacantesScreen> createState() => _VacantesScreenState();
}

class _VacantesScreenState extends State<VacantesScreen> {
  int _tabIndex = 0;
  static const _tabLabels = ['Pendientes', 'Altas IMSS'];

  @override
  void initState() {
    super.initState();
    widget.viewmodel.createBatch.addListener(_onCreateBatch);
    widget.viewmodel.updateSolicitud.addListener(_onUpdateSolicitud);
    widget.viewmodel.cambiarEstatus.addListener(_onCambiarEstatus);
    widget.viewmodel.iniciarCandidatoBatch.addListener(_onIniciarCandidato);
  }

  @override
  void dispose() {
    widget.viewmodel.createBatch.removeListener(_onCreateBatch);
    widget.viewmodel.updateSolicitud.removeListener(_onUpdateSolicitud);
    widget.viewmodel.cambiarEstatus.removeListener(_onCambiarEstatus);
    widget.viewmodel.iniciarCandidatoBatch.removeListener(_onIniciarCandidato);
    super.dispose();
  }

  void _onCreateBatch() {
    if (widget.viewmodel.createBatch.completed) {
      final creadas = (widget.viewmodel.createBatch.result as Ok<List<SolicitudVacante>>).value;
      widget.viewmodel.createBatch.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${creadas.length} solicitud(es) de vacante enviada(s)')),
      );
      return;
    }

    if (widget.viewmodel.createBatch.error) {
      final error = (widget.viewmodel.createBatch.result as Error).error;
      widget.viewmodel.createBatch.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudieron enviar todas las solicitudes', error: error),
      );
    }
  }

  void _onUpdateSolicitud() {
    if (widget.viewmodel.updateSolicitud.completed) {
      widget.viewmodel.updateSolicitud.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Solicitud actualizada')));
      return;
    }
    if (widget.viewmodel.updateSolicitud.error) {
      final error = (widget.viewmodel.updateSolicitud.result as Error).error;
      widget.viewmodel.updateSolicitud.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo editar la solicitud', error: error),
      );
    }
  }

  void _onCambiarEstatus() {
    if (widget.viewmodel.cambiarEstatus.completed) {
      widget.viewmodel.cambiarEstatus.clearResult();
      return;
    }
    if (widget.viewmodel.cambiarEstatus.error) {
      final error = (widget.viewmodel.cambiarEstatus.result as Error).error;
      widget.viewmodel.cambiarEstatus.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo actualizar el estatus', error: error),
      );
    }
  }

  void _onIniciarCandidato() {
    if (widget.viewmodel.iniciarCandidatoBatch.completed) {
      widget.viewmodel.iniciarCandidatoBatch.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Candidato(s) iniciado(s), se les envió el correo con sus siguientes pasos')),
      );
      return;
    }
    if (widget.viewmodel.iniciarCandidatoBatch.error) {
      final error = (widget.viewmodel.iniciarCandidatoBatch.result as Error).error;
      widget.viewmodel.iniciarCandidatoBatch.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo iniciar a uno o más candidatos', error: error),
      );
    }
  }

  int _vacantesDisponibles(SolicitudVacante solicitud) {
    final candidatosActivos = solicitud.candidatos
        .where((c) => c.estado != CandidatoEstado.expirado && c.estado != CandidatoEstado.cancelado)
        .length;
    return solicitud.cantidad - candidatosActivos;
  }

  Future<void> _handleIniciarCandidato(SolicitudVacante solicitud) async {
    final vacantesDisponibles = _vacantesDisponibles(solicitud);
    if (vacantesDisponibles <= 0) return;

    final filas = await showDialog<List<IniciarCandidatoRow>>(
      context: context,
      builder: (context) => IniciarCandidatoDialog(vacantesDisponibles: vacantesDisponibles),
    );
    if (filas != null && filas.isNotEmpty) {
      widget.viewmodel.iniciarCandidatoBatch.execute((id: solicitud.id!, filas: filas));
    }
  }

  Future<void> _handleAdd() async {
    final filas = await showDialog<List<VacanteRowParams>>(
      context: context,
      builder: (context) => SolicitudVacanteFormDialog(
        puestos: widget.viewmodel.puestos,
        horarios: widget.viewmodel.horarios,
        departamentos: widget.viewmodel.departamentos,
        createPuesto: widget.viewmodel.createPuesto,
        editPuesto: widget.viewmodel.editPuesto,
      ),
    );
    if (filas != null && filas.isNotEmpty) {
      widget.viewmodel.createBatch.execute(filas);
    }
  }

  Future<void> _handleEditSolicitud(SolicitudVacante solicitud) async {
    final params = await showDialog<SolicitudEditParams>(
      context: context,
      builder: (context) => SolicitudVacanteEditDialog(
        solicitud: solicitud,
        puestos: widget.viewmodel.puestos,
        horarios: widget.viewmodel.horarios,
      ),
    );
    if (params != null) {
      widget.viewmodel.updateSolicitud.execute(params);
    }
  }

  Future<void> _handleEditPuesto(SolicitudVacante solicitud) async {
    final puesto = widget.viewmodel.puestos.where((p) => p.id == solicitud.puesto).firstOrNull;
    if (puesto == null) return;
    await showDialog<Puesto>(
      context: context,
      builder: (context) => PuestoFormDialog(
        createPuesto: widget.viewmodel.createPuesto,
        editPuesto: widget.viewmodel.editPuesto,
        departamentos: widget.viewmodel.departamentos,
        initialPuesto: puesto,
      ),
    );
    // Vuelve a cargar para reflejar el nombre del puesto si cambió.
    widget.viewmodel.load.execute();
  }

  Color _estatusColor(EstatusVacante estatus) {
    return switch (estatus) {
      EstatusVacante.pendiente => Colors.amber,
      EstatusVacante.aceptada => Colors.green,
      EstatusVacante.rechazada => errorColor,
    };
  }

  String _estatusLabel(EstatusVacante estatus) {
    return switch (estatus) {
      EstatusVacante.pendiente => 'Pendiente',
      EstatusVacante.aceptada => 'Aceptada',
      EstatusVacante.rechazada => 'Rechazada',
    };
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMMd();

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: ListenableBuilder(
        listenable: widget.viewmodel,
        builder: (context, _) {
          if (!widget.viewmodel.hasPermissions) return SizedBox.shrink();
          return FloatingActionButton(
            onPressed: _handleAdd,
            tooltip: 'Solicitar vacante',
            child: Icon(LucideIcons.userPlus),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            spacing: 32,
            crossAxisAlignment: .start,
            children: [
              PageHeader(
                title: 'Reclutamiento',
                subtitle: widget.viewmodel.esDireccion
                    ? 'Revisa las solicitudes de vacante de todos los líderes.'
                    : 'Solicita vacantes para tu equipo. Dirección revisará cada solicitud.',
              ),
              if (widget.viewmodel.esRH)
                FieldSwitcher(
                  selectedIndex: _tabIndex,
                  options: _tabLabels,
                  onSelected: (value) => setState(() => _tabIndex = value),
                ),
              if (_tabIndex == 1 && widget.viewmodel.esRH)
                Fase2AltasImssSection(viewmodel: widget.altasImssViewmodel)
              else
              ListenableBuilder(
                listenable: Listenable.merge([widget.viewmodel, widget.viewmodel.load]),
                builder: (context, _) {
                  if (widget.viewmodel.load.running) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (widget.viewmodel.load.error) {
                    return Center(
                      child: Column(
                        spacing: 16,
                        mainAxisSize: .min,
                        children: [
                          Text('No se pudieron cargar las solicitudes de vacante'),
                          ElevatedButton.icon(
                            onPressed: () => widget.viewmodel.load.execute(),
                            icon: Icon(LucideIcons.rotateCcw),
                            label: Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }

                  final solicitudes = widget.viewmodel.solicitudes;
                  if (solicitudes.isEmpty) {
                    return Center(
                      child: Column(
                        spacing: 24,
                        children: [
                          Icon(LucideIcons.userPlus, size: 60, color: primaryColor),
                          Text(
                            widget.viewmodel.esDireccion
                                ? 'No hay solicitudes de vacante todavía'
                                : 'No has solicitado vacantes todavía',
                            style: TextTheme.of(context).headlineSmall,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: solicitudes.length,
                    separatorBuilder: (context, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final solicitud = solicitudes[index];
                      final esDireccion = widget.viewmodel.esDireccion;
                      final esRH = widget.viewmodel.esRH;
                      final pendiente = solicitud.estatus == EstatusVacante.pendiente;
                      final rechazada = solicitud.estatus == EstatusVacante.rechazada;
                      final aceptada = solicitud.estatus == EstatusVacante.aceptada;
                      final turnoDisplay = widget.viewmodel.horarioDisplayNombre(solicitud.turno);
                      final subtitleParts = [
                        if (solicitud.createdAt != null) dateFormat.format(solicitud.createdAt!),
                        if (esDireccion && solicitud.solicitanteNombre != null)
                          'Solicitó: ${solicitud.solicitanteNombre}',
                        if (solicitud.area.isNotEmpty) 'Área: ${solicitud.area}',
                        if (turnoDisplay != null) 'Turno: $turnoDisplay',
                      ];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: .start,
                          spacing: 4,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(LucideIcons.userPlus, color: primaryColor),
                              title: Text(
                                '${solicitud.puestoNombre ?? 'Puesto'} (${solicitud.rol}) × ${solicitud.cantidad}',
                                style: TextTheme.of(context).headlineSmall,
                              ),
                              subtitle: subtitleParts.isEmpty ? null : Text(subtitleParts.join(' · ')),
                              trailing: Chip(
                                label: Text(_estatusLabel(solicitud.estatus)),
                                backgroundColor: _estatusColor(solicitud.estatus).withValues(alpha: 0.15),
                                labelStyle: TextStyle(color: _estatusColor(solicitud.estatus)),
                              ),
                            ),
                            if (solicitud.justificacion.isNotEmpty)
                              Text('Justificación: ${solicitud.justificacion}'),
                            // Una vez que hay candidatos, cada uno trae su propia barra de
                            // progreso (ver _CandidatoRow) -- la de la solicitud ya no
                            // aporta nada nuevo (solo cubría pendiente/aceptada).
                            if (!rechazada && solicitud.candidatos.isEmpty)
                              StepTimeline(
                                length: SolicitudVacanteStage.values.length,
                                currentStep: solicitud.stage.index,
                                stepLabels: const ['Pendiente', 'Aprobada', 'Candidato iniciado'],
                              ),
                            if (solicitud.candidatos.isNotEmpty)
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                  color: backgroundColor.withValues(alpha: 0.4),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Column(
                                  children: [
                                    for (final candidato in solicitud.candidatos)
                                      _CandidatoRow(
                                        candidato: candidato,
                                        onRevisar: () => context.go(Routes.revisionOfCandidato(candidato.id!)),
                                        altasImssViewmodel: widget.altasImssViewmodel,
                                        mostrarAccionesFase2: widget.viewmodel.esRH,
                                      ),
                                  ],
                                ),
                              ),
                            if (esDireccion)
                              Wrap(
                                spacing: 4,
                                children: [
                                  if (pendiente)
                                    TextButton.icon(
                                      onPressed: () => widget.viewmodel.cambiarEstatus.execute((
                                        id: solicitud.id!,
                                        estatus: 'aceptada',
                                      )),
                                      icon: Icon(Icons.check, color: Colors.green),
                                      label: Text('Aceptar'),
                                    ),
                                  if (pendiente)
                                    TextButton.icon(
                                      onPressed: () => widget.viewmodel.cambiarEstatus.execute((
                                        id: solicitud.id!,
                                        estatus: 'rechazada',
                                      )),
                                      icon: Icon(Icons.close, color: errorColor),
                                      label: Text('Rechazar'),
                                    ),
                                  TextButton.icon(
                                    onPressed: () => _handleEditSolicitud(solicitud),
                                    icon: Icon(Icons.edit_note),
                                    label: Text('Editar solicitud'),
                                  ),
                                  TextButton.icon(
                                    onPressed: () => _handleEditPuesto(solicitud),
                                    icon: Icon(Icons.work_outline),
                                    label: Text('Editar puesto'),
                                  ),
                                ],
                              ),
                            if (esRH && aceptada && _vacantesDisponibles(solicitud) > 0)
                              Wrap(
                                spacing: 4,
                                children: [
                                  TextButton.icon(
                                    onPressed: () => _handleIniciarCandidato(solicitud),
                                    icon: Icon(Icons.person_add_alt),
                                    label: Text('Iniciar candidato'),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CandidatoRow extends StatelessWidget {
  const _CandidatoRow({
    required this.candidato,
    required this.onRevisar,
    required this.altasImssViewmodel,
    required this.mostrarAccionesFase2,
  });

  final Candidato candidato;
  final VoidCallback onRevisar;
  final AltasImssViewmodel altasImssViewmodel;
  final bool mostrarAccionesFase2;

  bool get _fueraDeFlujo =>
      candidato.estado == CandidatoEstado.expirado || candidato.estado == CandidatoEstado.cancelado;

  Color _color() {
    return switch (candidato.estado) {
      CandidatoEstado.iniciado => Colors.amber,
      CandidatoEstado.completado => Colors.green,
      CandidatoEstado.expirado => Colors.grey,
      CandidatoEstado.cancelado => errorColor,
      CandidatoEstado.contratado => Colors.blue,
    };
  }

  String _label() {
    if (!_fueraDeFlujo) {
      return switch (candidato.stage) {
        CandidatoStage.pendiente => 'Pendiente',
        CandidatoStage.aceptada => 'Aprobado',
        CandidatoStage.iniciado => 'Invitación enviada',
        CandidatoStage.completado => 'Formulario completado',
        CandidatoStage.contratoSolicitado => 'Contrato solicitado',
        CandidatoStage.contratado => 'Contratado',
      };
    }
    return switch (candidato.estado) {
      CandidatoEstado.expirado => 'Expirado',
      CandidatoEstado.cancelado => 'Cancelado',
      CandidatoEstado.iniciado || CandidatoEstado.completado || CandidatoEstado.contratado => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _color();
    final puedeRevisar =
        candidato.estado == CandidatoEstado.completado || candidato.estado == CandidatoEstado.contratado;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 4,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: color.withValues(alpha: 0.2),
                child: Icon(Icons.person, size: 14, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(candidato.nombre, overflow: .ellipsis)),
              if (_fueraDeFlujo)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(_label(), style: TextStyle(color: color, fontSize: 12, fontWeight: .w600)),
                ),
              if (puedeRevisar)
                TextButton.icon(
                  onPressed: onRevisar,
                  icon: const Icon(Icons.visibility_outlined, size: 16),
                  label: const Text('Revisar'),
                )
              else
                const SizedBox(width: 8),
            ],
          ),
          // Candidatos expirados/cancelados salieron del flujo normal --
          // solo se muestra su etiqueta arriba, sin barra de pasos.
          if (!_fueraDeFlujo)
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                spacing: 8,
                children: [
                  StepTimeline(
                    length: CandidatoStage.values.length,
                    currentStep: candidato.stage.index,
                    stepLabels: const [
                      'Pendiente',
                      'Aprobado',
                      'Invitación enviada',
                      'Formulario completado',
                      'Contrato solicitado',
                      'Contratado',
                    ],
                  ),
                  Text(_label(), style: const TextStyle(fontSize: 11, color: Color(0xFF9A7B5A))),
                ],
              ),
            ),
          // Fase 2: seguimiento posterior a la contratación (alta IMSS,
          // contrato definitivo) -- continúa el mismo progreso, para el
          // candidato ya convertido en Empleado.
          if (candidato.estado == CandidatoEstado.contratado && candidato.empleado != null)
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ListenableBuilder(
                listenable: Listenable.merge([altasImssViewmodel, altasImssViewmodel.load]),
                builder: (context, _) {
                  AltaImssItem? item;
                  for (final i in altasImssViewmodel.items ?? const <AltaImssItem>[]) {
                    if (i.id == candidato.empleado) {
                      item = i;
                      break;
                    }
                  }
                  if (item == null) return const SizedBox.shrink();
                  return Fase2ProgressPanel(
                    item: item,
                    viewmodel: altasImssViewmodel,
                    mostrarAcciones: mostrarAccionesFase2,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

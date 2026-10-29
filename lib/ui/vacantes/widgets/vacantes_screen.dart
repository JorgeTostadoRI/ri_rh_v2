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
import 'package:ri_rh_v2/ui/vacantes/viewmodels/seguimiento_practicantes_viewmodel.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/vacantes_viewmodel.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/fase2_altas_imss_section.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/fase2_progress_panel.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/iniciar_candidato_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/iniciar_contratacion_practicante_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/practicantes_seguimiento_section.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/retroalimentacion_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/solicitud_vacante_edit_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/solicitud_vacante_form_dialog.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VacantesScreen extends StatefulWidget {
  const VacantesScreen({
    super.key,
    required this.viewmodel,
    required this.altasImssViewmodel,
    required this.seguimientoPracticantesViewmodel,
  });

  final VacantesViewmodel viewmodel;
  final AltasImssViewmodel altasImssViewmodel;
  final SeguimientoPracticantesViewmodel seguimientoPracticantesViewmodel;

  @override
  State<VacantesScreen> createState() => _VacantesScreenState();
}

class _VacantesScreenState extends State<VacantesScreen> {
  _Tab _tab = _Tab.pendientes;

  /// RH ve todas las pestañas; Dirección solo Pendientes e Historial.
  List<_Tab> get _tabs => [
    _Tab.pendientes,
    if (widget.viewmodel.esRH) ...[_Tab.altasImss, _Tab.practicantes],
    if (widget.viewmodel.esRH || widget.viewmodel.esDireccion) _Tab.historial,
  ];

  @override
  void initState() {
    super.initState();
    widget.viewmodel.createBatch.addListener(_onCreateBatch);
    widget.viewmodel.updateSolicitud.addListener(_onUpdateSolicitud);
    widget.viewmodel.cambiarEstatus.addListener(_onCambiarEstatus);
    widget.viewmodel.iniciarCandidatoBatch.addListener(_onIniciarCandidato);
    widget.viewmodel.retroalimentar.addListener(_onRetroalimentar);
    widget.viewmodel.iniciarContratacionPracticante.addListener(_onIniciarContratacionPracticante);
    widget.seguimientoPracticantesViewmodel.loadMisPendientes.execute();
  }

  @override
  void dispose() {
    widget.viewmodel.createBatch.removeListener(_onCreateBatch);
    widget.viewmodel.updateSolicitud.removeListener(_onUpdateSolicitud);
    widget.viewmodel.cambiarEstatus.removeListener(_onCambiarEstatus);
    widget.viewmodel.iniciarCandidatoBatch.removeListener(_onIniciarCandidato);
    widget.viewmodel.retroalimentar.removeListener(_onRetroalimentar);
    widget.viewmodel.iniciarContratacionPracticante.removeListener(_onIniciarContratacionPracticante);
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

  void _onRetroalimentar() {
    final command = widget.viewmodel.retroalimentar;
    if (command.completed) {
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se le regresó la evaluación al jefe con tu comentario')),
      );
    } else if (command.error) {
      final error = (command.result as Error).error;
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo regresar al jefe', error: error),
      );
    }
  }

  void _onIniciarContratacionPracticante() {
    final command = widget.viewmodel.iniciarContratacionPracticante;
    if (command.completed) {
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contratación iniciada: se le mandó el link por correo')),
      );
    } else if (command.error) {
      final error = (command.result as Error).error;
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo iniciar la contratación', error: error),
      );
    }
  }

  Future<void> _handleRetroalimentacion(SolicitudVacante solicitud) async {
    final comentario = await showDialog<String>(
      context: context,
      builder: (context) => RetroalimentacionDialog(nombre: solicitud.practicanteNombre ?? ''),
    );
    if (comentario == null) return;
    widget.viewmodel.retroalimentar.execute((id: solicitud.id!, comentario: comentario));
  }

  Future<void> _handleIniciarContratacionPracticante(SolicitudVacante solicitud) async {
    final fila = await showDialog<IniciarContratacionPracticanteRow>(
      context: context,
      builder: (context) => IniciarContratacionPracticanteDialog(
        nombre: solicitud.practicanteNombre ?? '',
        correoInicial: solicitud.practicanteCorreo ?? '',
      ),
    );
    if (fila == null) return;
    widget.viewmodel.iniciarContratacionPracticante.execute((
      id: solicitud.id!,
      correo: fila.correo,
      cartaOferta: fila.cartaOferta,
    ));
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
      EstatusVacante.retroalimentacion => Colors.orange,
    };
  }

  String _estatusLabel(EstatusVacante estatus) {
    return switch (estatus) {
      EstatusVacante.pendiente => 'Pendiente',
      EstatusVacante.aceptada => 'Aceptada',
      EstatusVacante.rechazada => 'Rechazada',
      EstatusVacante.retroalimentacion => 'Regresada al jefe',
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
              if (_tabs.length > 1)
                FieldSwitcher(
                  selectedIndex: _tabs.indexOf(_tab),
                  options: [for (final tab in _tabs) tab.label],
                  onSelected: (value) => setState(() => _tab = _tabs[value]),
                ),
              if (_tab == _Tab.altasImss)
                Fase2AltasImssSection(viewmodel: widget.altasImssViewmodel)
              else if (_tab == _Tab.practicantes)
                PracticantesSeguimientoSection(viewmodel: widget.seguimientoPracticantesViewmodel)
              else ...[
              if (_tab == _Tab.pendientes)
                _PracticantesPorEvaluar(viewmodel: widget.seguimientoPracticantesViewmodel),
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

                  // Pendientes e Historial son la misma lista, partida por
                  // si a la solicitud todavía le queda algo en proceso. A
                  // Dirección solo le toca aprobar o rechazar: en cuanto lo
                  // hace, ya va en su Historial (para RH sigue en Pendientes
                  // hasta que termina todo el proceso).
                  final enHistorial = _tab == _Tab.historial;
                  bool estaEnHistorial(SolicitudVacante s) => widget.viewmodel.esDireccion
                      ? s.estatus != EstatusVacante.pendiente
                      : s.enHistorial;
                  final solicitudes =
                      widget.viewmodel.solicitudes.where((s) => estaEnHistorial(s) == enHistorial).toList();
                  if (solicitudes.isEmpty) {
                    return Center(
                      child: Column(
                        spacing: 24,
                        children: [
                          Icon(enHistorial ? LucideIcons.history : LucideIcons.userPlus, size: 60, color: primaryColor),
                          Text(
                            enHistorial
                                ? 'Todavía no hay solicitudes terminadas'
                                : widget.viewmodel.esDireccion
                                ? 'No hay solicitudes de vacante pendientes'
                                : 'No tienes solicitudes de vacante pendientes',
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
                      // Contratación de un practicante: la creó sola su evaluación;
                      // la corrige el jefe (vía retroalimentación), no Dirección.
                      final dePracticante = solicitud.practicante != null;
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
                            if (dePracticante)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  avatar: Icon(LucideIcons.graduationCap, size: 16, color: primaryColor),
                                  label: Text('Contratación de practicante: ${solicitud.practicanteNombre ?? ''}'),
                                ),
                              ),
                            if (solicitud.justificacion.isNotEmpty)
                              Text('Justificación: ${solicitud.justificacion}'),
                            if (solicitud.comentarioDireccion.isNotEmpty)
                              Text(
                                'Retroalimentación de Dirección: ${solicitud.comentarioDireccion}',
                                style: TextStyle(color: Colors.orange[800]),
                              ),
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
                                        mostrarAccionesRH: widget.viewmodel.esRH,
                                      ),
                                  ],
                                ),
                              ),
                            // Ya aprobada o rechazada no se edita ni la solicitud ni el
                            // puesto (el backend también rechaza editar la solicitud
                            // o cambiarle el estatus).
                            if (esDireccion && pendiente)
                              Wrap(
                                spacing: 4,
                                children: [
                                  TextButton.icon(
                                    onPressed: () => widget.viewmodel.cambiarEstatus.execute((
                                      id: solicitud.id!,
                                      estatus: 'aceptada',
                                    )),
                                    icon: Icon(Icons.check, color: Colors.green),
                                    label: Text('Aceptar'),
                                  ),
                                  if (dePracticante)
                                    TextButton.icon(
                                      onPressed: () => _handleRetroalimentacion(solicitud),
                                      icon: Icon(Icons.reply, color: Colors.orange),
                                      label: Text('Retroalimentación'),
                                    ),
                                  TextButton.icon(
                                    onPressed: () => widget.viewmodel.cambiarEstatus.execute((
                                      id: solicitud.id!,
                                      estatus: 'rechazada',
                                    )),
                                    icon: Icon(Icons.close, color: errorColor),
                                    label: Text('Rechazar'),
                                  ),
                                  if (!dePracticante) ...[
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
                                ],
                              ),
                            if (esRH && aceptada && _vacantesDisponibles(solicitud) > 0)
                              Wrap(
                                spacing: 4,
                                children: [
                                  dePracticante
                                      ? TextButton.icon(
                                          onPressed: () => _handleIniciarContratacionPracticante(solicitud),
                                          icon: Icon(Icons.send_outlined),
                                          label: Text('Iniciar contratación'),
                                        )
                                      : TextButton.icon(
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
            ],
          ),
        ),
      ),
    );
  }
}

class _EvaluacionPendienteChip extends StatelessWidget {
  const _EvaluacionPendienteChip({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: const Icon(Icons.warning_amber_rounded, size: 16, color: Colors.orange),
      label: const Text('Evaluación pendiente'),
      backgroundColor: const Color(0xFFFFF7ED),
      onPressed: onPressed,
    );
  }
}

/// Practicantes de los que el usuario en sesión es jefe directo y que
/// esperan su evaluación -- arriba de sus solicitudes en Pendientes. No
/// se muestra si no tiene ninguno.
class _PracticantesPorEvaluar extends StatelessWidget {
  const _PracticantesPorEvaluar({required this.viewmodel});

  static final _fecha = DateFormat('dd/MM/yyyy');

  final SeguimientoPracticantesViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, _) {
        final items = viewmodel.misPendientes;
        if (items.isEmpty) return const SizedBox.shrink();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 4,
            children: [
              Text('Practicantes por evaluar', style: TextTheme.of(context).headlineSmall),
              for (final item in items)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    spacing: 12,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.orange.withValues(alpha: 0.2),
                        child: const Icon(Icons.school_outlined, size: 14, color: Colors.orange),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(item.nombreCompleto, overflow: .ellipsis),
                            Text(
                              '${item.tipo} · ${item.puesto} · termina el ${_fecha.format(item.fechaTerminacion)}',
                              style: const TextStyle(fontSize: 11, color: Color(0xFF9A7B5A)),
                              overflow: .ellipsis,
                            ),
                          ],
                        ),
                      ),
                      _EvaluacionPendienteChip(
                        onPressed: () => context.go(Routes.evaluacionPracticanteOfToken(item.evaluacionToken)),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

enum _Tab {
  pendientes('Pendientes'),
  altasImss('Altas IMSS'),
  practicantes('Practicantes'),
  // Solicitudes que ya no tienen nada en proceso (ver SolicitudVacante.enHistorial).
  historial('Historial');

  const _Tab(this.label);

  final String label;
}

class _CandidatoRow extends StatelessWidget {
  const _CandidatoRow({
    required this.candidato,
    required this.onRevisar,
    required this.altasImssViewmodel,
    required this.mostrarAccionesRH,
  });

  final Candidato candidato;
  final VoidCallback onRevisar;
  final AltasImssViewmodel altasImssViewmodel;

  /// "Revisar" y las acciones de Fase 2 son trabajo de RH -- Dirección solo
  /// ve el progreso.
  final bool mostrarAccionesRH;

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
    final puedeRevisar = mostrarAccionesRH &&
        (candidato.estado == CandidatoEstado.completado || candidato.estado == CandidatoEstado.contratado);
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
              // Solo viene para el jefe directo del empleado (el backend no
              // lo manda a nadie más) -- es quien contesta la evaluación.
              if (candidato.evaluacionTokenJefe != null) _EvaluacionPendienteChip(
                onPressed: () => context.go(Routes.evaluacionOfToken(candidato.evaluacionTokenJefe!)),
              ),
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
                    mostrarAcciones: mostrarAccionesRH,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

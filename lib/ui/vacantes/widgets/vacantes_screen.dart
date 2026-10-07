import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/vacantes_viewmodel.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/solicitud_vacante_edit_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/widgets/solicitud_vacante_form_dialog.dart';
import 'package:ri_rh_v2/utils/result.dart';

class VacantesScreen extends StatefulWidget {
  const VacantesScreen({super.key, required this.viewmodel});

  final VacantesViewmodel viewmodel;

  @override
  State<VacantesScreen> createState() => _VacantesScreenState();
}

class _VacantesScreenState extends State<VacantesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.createBatch.addListener(_onCreateBatch);
    widget.viewmodel.updateSolicitud.addListener(_onUpdateSolicitud);
    widget.viewmodel.cambiarEstatus.addListener(_onCambiarEstatus);
  }

  @override
  void dispose() {
    widget.viewmodel.createBatch.removeListener(_onCreateBatch);
    widget.viewmodel.updateSolicitud.removeListener(_onUpdateSolicitud);
    widget.viewmodel.cambiarEstatus.removeListener(_onCambiarEstatus);
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

  Future<void> _handleAdd() async {
    final filas = await showDialog<List<VacanteRowParams>>(
      context: context,
      builder: (context) => SolicitudVacanteFormDialog(puestos: widget.viewmodel.puestos),
    );
    if (filas != null && filas.isNotEmpty) {
      widget.viewmodel.createBatch.execute(filas);
    }
  }

  Future<void> _handleEditSolicitud(SolicitudVacante solicitud) async {
    final params = await showDialog<SolicitudEditParams>(
      context: context,
      builder: (context) => SolicitudVacanteEditDialog(solicitud: solicitud, puestos: widget.viewmodel.puestos),
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
                      final pendiente = solicitud.estatus == EstatusVacante.pendiente;
                      final subtitleParts = [
                        if (solicitud.createdAt != null) dateFormat.format(solicitud.createdAt!),
                        if (esDireccion && solicitud.solicitanteNombre != null)
                          'Solicitó: ${solicitud.solicitanteNombre}',
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

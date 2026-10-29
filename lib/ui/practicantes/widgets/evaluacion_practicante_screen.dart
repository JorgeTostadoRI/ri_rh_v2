import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/evaluacion_practicante_viewmodel.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';

/// Pantalla donde el jefe directo decide qué pasa con un practicante al
/// terminar sus prácticas: contratarlo como empleado o terminarlas. Llega
/// aquí por el link del correo que se le manda 7 días antes de su fecha de
/// terminación. "Terminar" lo pasa a proceso de baja al día siguiente de su
/// fecha; "Contratar" (con puesto, rol y justificación) se le manda a
/// Dirección para que la apruebe, como cualquier contratación -- Dirección
/// puede regresársela con un comentario para que la corrija. Mismo esquema
/// que `EvaluacionJefeScreen` (empleados).
class EvaluacionPracticanteScreen extends StatefulWidget {
  const EvaluacionPracticanteScreen({super.key, required this.viewmodel});

  final EvaluacionPracticanteViewmodel viewmodel;

  @override
  State<EvaluacionPracticanteScreen> createState() => _EvaluacionPracticanteScreenState();
}

class _EvaluacionPracticanteScreenState extends State<EvaluacionPracticanteScreen> {
  static final _fecha = DateFormat('dd/MM/yyyy');

  EvaluacionPracticanteRespuesta? _respuesta;
  final _motivo = TextEditingController();
  final _justificacion = TextEditingController();
  int? _puestoId;
  String? _rol;
  bool _prellenado = false;

  @override
  void initState() {
    super.initState();
    widget.viewmodel.responder.addListener(_onResponder);
    widget.viewmodel.deletePuesto.addListener(_onDeletePuestoResult);
    widget.viewmodel.addListener(_prellenar);
    _prellenar();
  }

  @override
  void dispose() {
    widget.viewmodel.responder.removeListener(_onResponder);
    widget.viewmodel.deletePuesto.removeListener(_onDeletePuestoResult);
    widget.viewmodel.removeListener(_prellenar);
    _motivo.dispose();
    _justificacion.dispose();
    super.dispose();
  }

  /// Puesto/rol/justificación: lo que ya tiene, o lo que propuso si
  /// Dirección se lo regresó -- solo la primera vez que llega el detalle.
  void _prellenar() {
    final detalle = widget.viewmodel.detalle;
    if (_prellenado || detalle == null) return;
    _prellenado = true;
    setState(() {
      _puestoId = detalle.puestos.any((p) => p.id == detalle.puestoId) ? detalle.puestoId : null;
      _rol = rolOptions.any((r) => r.$1 == detalle.rol) ? detalle.rol : null;
      _justificacion.text = detalle.justificacion;
    });
  }

  void _onResponder() {
    if (widget.viewmodel.responder.error) {
      final error = widget.viewmodel.responder.result;
      widget.viewmodel.responder.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo enviar la respuesta: $error')),
      );
    }
  }

  /// "sus prácticas" o "su residencia", según el tipo.
  String _periodo(EvaluacionPracticanteDetalle detalle) =>
      detalle.tipo == 'Residente' ? 'su residencia' : 'sus prácticas';

  void _aviso(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  Future<void> _enviar(EvaluacionPracticanteDetalle detalle) async {
    final respuesta = _respuesta;
    if (respuesta == null) return;
    final contratar = respuesta == EvaluacionPracticanteRespuesta.contratar;
    if (!contratar && _motivo.text.trim().isEmpty) return _aviso('Indica el motivo');
    if (contratar && (_puestoId == null || _rol == null || _justificacion.text.trim().isEmpty)) {
      return _aviso('Indica el puesto, el rol y la justificación');
    }
    final puestoNombre = widget.viewmodel.opcionesPuesto.where((p) => p.id == _puestoId).firstOrNull?.nombre ?? '';

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar respuesta'),
        content: Text(
          contratar
              ? '¿Confirmas que se contrate a ${detalle.nombreCompleto} como empleado ($puestoNombre)? '
                    '${detalle.requiereAprobacionDireccion ? 'Se le mandará a Dirección para su aprobación.' : 'Recursos Humanos iniciará su contratación.'}'
              : '¿Confirmas que terminan ${_periodo(detalle)} de ${detalle.nombreCompleto}? Pasará a proceso de baja al día siguiente de su fecha de terminación.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
    if (confirmado != true) return;

    widget.viewmodel.responder.execute((
      respuesta: respuesta,
      motivo: contratar ? null : _motivo.text.trim(),
      contratacion: contratar
          ? (puestoId: _puestoId!, rol: _rol!, justificacion: _justificacion.text.trim())
          : null,
    ));
  }

  /// Al elegir un puesto se prellena el rol con el que tiene definido --
  /// igual que en Nuevo Empleado (`_applyPuestoDefaults`); se puede cambiar.
  void _aplicarRolDelPuesto(String? rol) {
    if (rol != null && rolOptions.any((r) => r.$1 == rol)) _rol = rol;
  }

  void _onDeletePuestoResult() {
    final command = widget.viewmodel.deletePuesto;
    if (command.completed) {
      final deletedId = (command.result as Ok<int>).value;
      command.clearResult();
      if (_puestoId == deletedId) setState(() => _puestoId = null);
      return;
    }
    if (command.error) {
      final error = (command.result as Error).error;
      command.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo eliminar el puesto', error: error),
      );
    }
  }

  Puesto? get _puestoSeleccionado => widget.viewmodel.puestos.where((p) => p.id == _puestoId).firstOrNull;

  Future<void> _openCreatePuestoDialog() async {
    final puesto = await showDialog<Puesto>(
      context: context,
      builder: (context) => PuestoFormDialog(
        createPuesto: widget.viewmodel.createPuesto,
        editPuesto: widget.viewmodel.editPuesto,
        departamentos: widget.viewmodel.departamentos,
      ),
    );
    if (puesto != null) {
      setState(() {
        _puestoId = puesto.id;
        _aplicarRolDelPuesto(puesto.rol);
      });
    }
  }

  Future<void> _openEditPuestoDialog() async {
    final actual = _puestoSeleccionado;
    if (actual == null) return;
    final puesto = await showDialog<Puesto>(
      context: context,
      builder: (context) => PuestoFormDialog(
        createPuesto: widget.viewmodel.createPuesto,
        editPuesto: widget.viewmodel.editPuesto,
        departamentos: widget.viewmodel.departamentos,
        initialPuesto: actual,
      ),
    );
    if (puesto != null) {
      setState(() => _puestoId = puesto.id);
    }
  }

  Future<void> _confirmDeletePuesto() async {
    final actual = _puestoSeleccionado;
    if (actual == null) return;
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar puesto'),
        content: Text('¿Eliminar "${actual.nombre}"? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Eliminar')),
        ],
      ),
    );
    if (confirmado != true) return;
    if (!mounted) return;
    widget.viewmodel.deletePuesto.execute(actual.id!);
  }

  /// PUESTO COMO EMPLEADO, con los mismos botones que en Nuevo Empleado
  /// (crear, editar, eliminar) -- solo con sesión.
  Widget _puestoField() {
    final opciones = widget.viewmodel.opcionesPuesto;
    final valor = opciones.any((p) => p.id == _puestoId) ? _puestoId : null;
    final puedeEditar = widget.viewmodel.puedeEditarPuestos;
    return Row(
      spacing: 12,
      crossAxisAlignment: .end,
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            key: ValueKey('puesto-$valor-${opciones.length}'),
            initialValue: valor,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'PUESTO COMO EMPLEADO'),
            items: [
              for (final p in opciones)
                DropdownMenuItem(value: p.id, child: Text(p.nombre, overflow: TextOverflow.ellipsis)),
            ],
            onChanged: (value) => setState(() {
              _puestoId = value;
              _aplicarRolDelPuesto(opciones.where((p) => p.id == value).firstOrNull?.rol);
            }),
          ),
        ),
        if (puedeEditar) ...[
          IconButton(
            tooltip: 'Crear puesto nuevo',
            onPressed: _openCreatePuestoDialog,
            icon: const Icon(Icons.add_circle_outline),
          ),
          IconButton(
            tooltip: 'Editar puesto',
            onPressed: _puestoSeleccionado == null ? null : _openEditPuestoDialog,
            icon: const Icon(Icons.edit_outlined),
          ),
          ListenableBuilder(
            listenable: widget.viewmodel.deletePuesto,
            builder: (context, _) {
              final running = widget.viewmodel.deletePuesto.running;
              return IconButton(
                tooltip: 'Eliminar puesto',
                onPressed: _puestoSeleccionado == null || running ? null : _confirmDeletePuesto,
                icon: running
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.delete_outline),
              );
            },
          ),
        ],
      ],
    );
  }

  /// Ya contestó "contratar": en qué va con Dirección.
  String _estadoDireccion(EvaluacionPracticanteDetalle detalle) => switch (detalle.solicitudEstatus) {
    'aceptada' => detalle.requiereAprobacionDireccion
        ? 'Dirección ya la aprobó; Recursos Humanos iniciará su contratación.'
        : 'Recursos Humanos iniciará su contratación.',
    'rechazada' => 'Dirección no la aprobó: terminan ${_periodo(detalle)} y pasará a proceso de baja.',
    _ => 'Está en revisión de Dirección.',
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        constraints: const BoxConstraints(maxWidth: 640),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 20,
          children: [
            // A esta pantalla se llega directo desde un link de correo, sin
            // ruta previa a la cual "regresar" -- y el jefe no
            // necesariamente tiene acceso a Reclutamiento.
            if (!widget.viewmodel.publica) TextButton.icon(
              onPressed: () => context.go(Routes.home),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('Volver al inicio'),
            ),
            ListenableBuilder(
              listenable: Listenable.merge([widget.viewmodel, widget.viewmodel.load]),
              builder: (context, _) {
                if (widget.viewmodel.load.running && widget.viewmodel.detalle == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (widget.viewmodel.load.error && widget.viewmodel.detalle == null) {
                  return const Text(
                    'No se pudo cargar la evaluación -- confirma que tienes acceso a este link.',
                  );
                }

                final detalle = widget.viewmodel.detalle!;
                final periodo = _periodo(detalle);
                if (detalle.evaluacionRespondidaEn != null) {
                  final contestadaEl = _fecha.format(detalle.evaluacionRespondidaEn!);
                  return Column(
                    crossAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      const PageHeader(title: 'Evaluación ya contestada'),
                      Text(
                        detalle.evaluacionRespuesta == EvaluacionPracticanteRespuesta.contratar
                            ? 'El $contestadaEl contestaste que se contrata a ${detalle.nombreCompleto} como empleado. '
                                  '${_estadoDireccion(detalle)}'
                            : 'El $contestadaEl contestaste que terminan $periodo de ${detalle.nombreCompleto}.\n\n'
                                  'Motivo: ${detalle.evaluacionMotivo}',
                      ),
                    ],
                  );
                }

                final terminaEl = detalle.fechaTerminacion != null
                    ? ' el ${_fecha.format(detalle.fechaTerminacion!)}'
                    : '';
                final regresada = detalle.solicitudEstatus == 'retroalimentacion';
                return Column(
                  crossAxisAlignment: .start,
                  spacing: 20,
                  children: [
                    PageHeader(
                      title: 'Evaluación de ${detalle.nombreCompleto}',
                      subtitle: '${detalle.tipo} · ${detalle.puesto}',
                    ),
                    if (regresada)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Text(
                          'Dirección te regresó esta evaluación para que la corrijas:\n\n'
                          '${detalle.comentarioDireccion}',
                        ),
                      ),
                    Text(
                      '${detalle.nombreCompleto} termina $periodo$terminaEl. Como su jefe directo, evalúa su '
                      'desempeño y decide si se le contrata como empleado o si terminan $periodo.\n\n'
                      'Si eliges "Contratarlo como empleado", indica el puesto, el rol y por qué; '
                      '${detalle.requiereAprobacionDireccion ? 'se le mandará a Dirección para su aprobación' : 'Recursos Humanos iniciará su contratación'}. '
                      'Si eliges "Terminar $periodo", pasará a proceso de baja al día '
                      'siguiente de su fecha de terminación; en ese caso cuéntanos el motivo para que quede documentado.',
                    ),
                    Text(
                      '¿Qué sigue para ${detalle.nombreCompleto}?',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RadioGroup<EvaluacionPracticanteRespuesta>(
                      groupValue: _respuesta,
                      onChanged: (v) => setState(() => _respuesta = v),
                      child: Column(
                        children: [
                          const RadioListTile<EvaluacionPracticanteRespuesta>(
                            value: EvaluacionPracticanteRespuesta.contratar,
                            title: Text('Contratarlo como empleado'),
                          ),
                          RadioListTile<EvaluacionPracticanteRespuesta>(
                            value: EvaluacionPracticanteRespuesta.terminar,
                            title: Text('Terminar $periodo'),
                          ),
                        ],
                      ),
                    ),
                    if (_respuesta == EvaluacionPracticanteRespuesta.contratar) ...[
                      _puestoField(),
                      DropdownButtonFormField<String>(
                        key: ValueKey('rol-$_rol'),
                        initialValue: _rol,
                        isExpanded: true,
                        decoration: const InputDecoration(labelText: 'ROL'),
                        items: rolOptions.map((r) => DropdownMenuItem(value: r.$1, child: Text(r.$2))).toList(),
                        onChanged: (value) => setState(() => _rol = value),
                      ),
                      TextField(
                        controller: _justificacion,
                        maxLines: 3,
                        decoration: const InputDecoration(labelText: 'Justificación'),
                      ),
                    ],
                    if (_respuesta == EvaluacionPracticanteRespuesta.terminar)
                      TextField(
                        controller: _motivo,
                        maxLines: 3,
                        decoration: const InputDecoration(labelText: 'Motivo'),
                      ),
                    ListenableBuilder(
                      listenable: widget.viewmodel.responder,
                      builder: (context, _) => ElevatedButton(
                        onPressed: _respuesta == null || widget.viewmodel.responder.running
                            ? null
                            : () => _enviar(detalle),
                        child: const Text('Enviar respuesta'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

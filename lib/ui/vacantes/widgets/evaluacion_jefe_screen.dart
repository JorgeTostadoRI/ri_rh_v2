import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/evaluacion_jefe_viewmodel.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

/// Actividad 16: pantalla donde el jefe directo contesta la evaluación de
/// un empleado con contrato "determinado" que está por vencer -- a la que
/// llega por el link del correo de recordatorio (actividad 15), o por el
/// botón "Evaluación pendiente" del panel de RH en "Pendientes". La
/// respuesta ejecuta directo la solicitud del contrato nuevo a los
/// abogados, o el aviso de no renovación -- no hace falta que RH confirme
/// nada después.
class EvaluacionJefeScreen extends StatefulWidget {
  const EvaluacionJefeScreen({super.key, required this.viewmodel});

  final EvaluacionJefeViewmodel viewmodel;

  @override
  State<EvaluacionJefeScreen> createState() => _EvaluacionJefeScreenState();
}

class _EvaluacionJefeScreenState extends State<EvaluacionJefeScreen> {
  EvaluacionRespuesta? _respuesta;
  final _motivo = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewmodel.responder.addListener(_onResponder);
  }

  @override
  void dispose() {
    widget.viewmodel.responder.removeListener(_onResponder);
    _motivo.dispose();
    super.dispose();
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

  Future<void> _enviar() async {
    final respuesta = _respuesta;
    if (respuesta == null) return;
    if (respuesta == EvaluacionRespuesta.noRenovar &&
        _motivo.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Indica el motivo de la no renovación')),
      );
      return;
    }

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar respuesta'),
        content: Text(
          respuesta == EvaluacionRespuesta.renovar
              ? '¿Confirmas que se renueva el contrato? Se le pedirá de inmediato a los abogados el contrato nuevo.'
              : '¿Confirmas que no se renueva el contrato? Se avisará de inmediato a los abogados y se iniciará el proceso de baja.',
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
      motivo: respuesta == EvaluacionRespuesta.noRenovar
          ? _motivo.text.trim()
          : null,
    ));
  }

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
            // Navegación explícita (no Navigator.pop/showBackButton genérico)
            // porque a esta pantalla también se llega directo desde un link
            // de correo, sin ninguna ruta previa en el historial que
            // "regresar" pudiera reutilizar.
            if (!widget.viewmodel.publica) TextButton.icon(
              onPressed: () => context.go(Routes.reclutamiento),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('Volver a Reclutamiento'),
            ),
            ListenableBuilder(
              listenable: Listenable.merge([
                widget.viewmodel,
                widget.viewmodel.load,
              ]),
              builder: (context, _) {
                if (widget.viewmodel.load.running &&
                    widget.viewmodel.detalle == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (widget.viewmodel.load.error &&
                    widget.viewmodel.detalle == null) {
                  return const Text(
                    'No se pudo cargar la evaluación -- confirma que tienes acceso a este link.',
                  );
                }

                final detalle = widget.viewmodel.detalle!;
                if (detalle.evaluacionRespondidaEn != null) {
                  return Column(
                    crossAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      const PageHeader(title: 'Evaluación ya contestada'),
                      Text(
                        detalle.evaluacionRespuesta ==
                                EvaluacionRespuesta.renovar
                            ? 'Ya contestaste que se renueva el contrato de ${detalle.nombreCompleto} el '
                                  '${detalle.evaluacionRespondidaEn!.toShortIsoString()}.'
                            : 'Ya contestaste que no se renueva el contrato de ${detalle.nombreCompleto} el '
                                  '${detalle.evaluacionRespondidaEn!.toShortIsoString()}.\n\nMotivo: '
                                  '${detalle.evaluacionMotivoNoRenovacion}',
                      ),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: .start,
                  spacing: 20,
                  children: [
                    PageHeader(
                      title: 'Evaluación de ${detalle.nombreCompleto}',
                      subtitle: detalle.puesto,
                    ),
                    Text(
                      '${detalle.nombreCompleto} está por terminar su contrato (periodo a prueba, capacitación o determinado) en el '
                      'puesto de ${detalle.puesto}'
                      '${detalle.fechaVencimientoPeriodo != null ? ', que vence el ${detalle.fechaVencimientoPeriodo!.toShortIsoString()}' : ''}. '
                      'Como su jefe directo, nos ayudarías evaluando su desempeño durante este periodo y '
                      'decidiendo si continúa con la empresa de manera indefinida o no.\n\n'
                      'Si eliges "Sí, renovar", se le pedirá de inmediato a los abogados que preparen su contrato '
                      'definitivo (indeterminado) -- no hace falta que hagas nada más después. Si eliges "No '
                      'renovar", se les avisará de inmediato y arrancará el proceso de baja; en ese caso cuéntanos '
                      'el motivo para que quede documentado en su expediente.',
                    ),
                    const Text(
                      '¿Se renueva el contrato de manera indeterminada?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RadioGroup<EvaluacionRespuesta>(
                      groupValue: _respuesta,
                      onChanged: (v) => setState(() => _respuesta = v),
                      child: const Column(
                        children: [
                          RadioListTile<EvaluacionRespuesta>(
                            value: EvaluacionRespuesta.renovar,
                            title: Text('Sí, renovar'),
                          ),
                          RadioListTile<EvaluacionRespuesta>(
                            value: EvaluacionRespuesta.noRenovar,
                            title: Text('No renovar'),
                          ),
                        ],
                      ),
                    ),
                    if (_respuesta == EvaluacionRespuesta.noRenovar)
                      TextField(
                        controller: _motivo,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Motivo de la no renovación',
                        ),
                      ),
                    ListenableBuilder(
                      listenable: widget.viewmodel.responder,
                      builder: (context, _) => ElevatedButton(
                        onPressed:
                            _respuesta == null ||
                                widget.viewmodel.responder.running
                            ? null
                            : _enviar,
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

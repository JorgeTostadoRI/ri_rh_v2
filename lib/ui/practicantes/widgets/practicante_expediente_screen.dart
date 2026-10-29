import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/confirm_action_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_files.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/expediente_form.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/horario_card.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_expediente_viewmodel.dart';

class PracticanteExpedienteScreen extends StatefulWidget {
  const PracticanteExpedienteScreen({
    super.key,
    required this.viewmodel,
  });

  final PracticanteExpedienteViewmodel viewmodel;

  @override
  State<PracticanteExpedienteScreen> createState() => _PracticanteExpedienteScreenState();
}

class _PracticanteExpedienteScreenState extends State<PracticanteExpedienteScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.viewmodel.load,
            widget.viewmodel.loadHorarios,
            widget.viewmodel.loadJefes,
          ]),
          builder: (context, _) {
            if (widget.viewmodel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewmodel.load.error) {
              return Center(
                child: Column(
                  children: [
                    Text(widget.viewmodel.load.result.toString()),
                    ElevatedButton(
                      onPressed: () => widget.viewmodel.load.execute(),
                      child: Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }

            final practicante = widget.viewmodel.practicante;
            return Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                PageHeader(
                  title: 'Expediente Digital',
                  subtitle: practicante.base.nombre,
                  showBackButton: true,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: ExpedienteForm(
                        baseEmpleado: practicante.base,
                        readOnly: true,
                        jefeCandidates: widget.viewmodel.jefes,
                        assignJefe: widget.viewmodel.assignJefe,
                        fechaTerminacion: _FechaTerminacionField(viewmodel: widget.viewmodel),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          ExpedienteFiles(
                            files: practicante.base.files,
                            altaPracticante: practicante.alta,
                          ),
                          HorarioCard(
                            horarios: widget.viewmodel.horarios,
                            selectedHorarioId: practicante.base.user?.horarioId,
                            userNombre: practicante.base.nombre,
                            assignHorario: widget.viewmodel.assignHorario,
                            createCustomHorario: widget.viewmodel.createCustomHorario,
                            loadingHorarios: widget.viewmodel.loadHorarios.running,
                            hasUser: practicante.base.user != null,
                          ),
                          Badge(
                            backgroundColor: statusWarningColor,
                            label: const Text('!'),
                            isLabelVisible: practicante.status == StatusPracticante.alta && !practicante.base.hasSignature,
                            child: IconCard(
                              icon: LucideIcons.fingerprintPattern,
                              title: 'Huellas',
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.go(Routes.huellasOfPracticante(practicante));
                                  },
                                  child: Text('Ver')
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

/// Fecha en que terminan sus prácticas, en Datos Laborales debajo de
/// FECHA ALTA. Se asigna una sola vez (solo RH); corregirla solo se puede
/// desde el admin de Django -- el backend lo valida igual aunque se intente
/// por otro lado.
class _FechaTerminacionField extends StatelessWidget {
  const _FechaTerminacionField({required this.viewmodel});

  final PracticanteExpedienteViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    final fecha = viewmodel.practicante.fechaTerminacion;
    final falta = fecha == null && viewmodel.practicante.status == StatusPracticante.alta;

    return TextFormField(
      // Se recrea al asignarla, para que tome el valor nuevo.
      key: ValueKey(fecha),
      readOnly: true,
      initialValue: fecha != null ? DateFormat('dd/MM/yy').format(fecha) : 'Sin asignar',
      decoration: InputDecoration(
        labelText: 'FECHA DE TERMINACIÓN',
        prefixIcon: falta ? Icon(LucideIcons.triangleAlert, color: statusWarningColor) : null,
        suffixIcon: fecha == null && viewmodel.esRH
            ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => _AsignarFechaTerminacionDialog(viewmodel: viewmodel),
                  ),
                  child: const Text('Asignar'),
                ),
              )
            : null,
      ),
    );
  }
}

class _AsignarFechaTerminacionDialog extends StatefulWidget {
  const _AsignarFechaTerminacionDialog({required this.viewmodel});

  final PracticanteExpedienteViewmodel viewmodel;

  @override
  State<_AsignarFechaTerminacionDialog> createState() => _AsignarFechaTerminacionDialogState();
}

class _AsignarFechaTerminacionDialogState extends State<_AsignarFechaTerminacionDialog> {
  DateTime? _fecha;

  Command1<void, DateTime> get _command => widget.viewmodel.asignarFechaTerminacion;

  @override
  void initState() {
    super.initState();
    _command.addListener(_onResult);
  }

  @override
  void dispose() {
    _command.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (_command.completed) {
      _command.clearResult();
      if (mounted) Navigator.of(context).pop();
      return;
    }

    if (_command.error) {
      final error = (_command.result as Error).error;
      _command.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo asignar la fecha de terminación', error: error),
        );
      }
    }
  }

  Future<void> _confirmarYAsignar() async {
    final fecha = _fecha!;
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => ConfirmActionDialog(
        title: const Text('Asignar fecha de terminación'),
        content: Text(
          '¿Estás seguro de asignar el ${DateFormat('dd/MM/yyyy').format(fecha)} como fecha de terminación?',
        ),
      ),
    );
    if (confirmado == true) _command.execute(fecha);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _command,
      builder: (context, _) {
        final running = _command.running;
        return AlertDialog(
          title: const Text('Asignar fecha de terminación'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 12,
              children: [
                DateFormField(
                  decoration: const InputDecoration(labelText: 'FECHA DE TERMINACIÓN'),
                  required: true,
                  fourDigitYear: true,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                  onDateSaved: (value) => setState(() => _fecha = value),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || _fecha == null ? null : _confirmarYAsignar,
              child: running
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Asignar'),
            ),
          ],
        );
      },
    );
  }
}

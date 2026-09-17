import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/ui/core/ui/credenciales_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleados_viewmodel.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Solo MASTER/ADMINISTRADOR, o un LIDER del departamento de RH, pueden
/// regenerar la contraseña de otro usuario (el backend hace el mismo
/// chequeo en `CanRegenerarPasswordPermission`; aquí solo ocultamos la
/// opción para quien de todos modos no podría usarla).
bool _puedeRegenerarPassword(BuildContext context) {
  final user = context.read<AuthRepository>().getCurrentUser();
  if (user == null) return false;
  if (user.rol == 'MASTER' || user.rol == 'ADMINISTRADOR') return true;
  return user.rol == 'LIDER' && user.departamento?.nombre == 'Recursos Humanos';
}

class EmpleadoActionsMenu extends StatelessWidget {
  const EmpleadoActionsMenu({
    super.key,
    required this.empleado,
    required this.cambiarEstatus,
    required this.regenerarPassword,
  });

  final Empleado empleado;
  final Command1<String, CambiarEstatusEmpleadoParams> cambiarEstatus;
  final Command1<CredencialesGeneradas, int> regenerarPassword;

  @override
  Widget build(BuildContext context) {
    final items = <PopupMenuEntry<VoidCallback>>[];

    if (empleado.estatus == EmpleadoEstatus.activo) {
      items.add(PopupMenuItem(
        value: () => showDialog(
          context: context,
          builder: (context) => _ConfirmProcesoFiniquitoDialog(empleado: empleado, cambiarEstatus: cambiarEstatus),
        ),
        child: Text('Pasar a proceso de finiquito'),
      ));
    } else if (empleado.estatus == EmpleadoEstatus.procesoFiniquito) {
      items.add(PopupMenuItem(
        value: () => showDialog(
          context: context,
          builder: (context) => _FiniquitadoDialog(empleado: empleado, cambiarEstatus: cambiarEstatus),
        ),
        child: Text('Marcar como finiquitado'),
      ));
    }

    if (_puedeRegenerarPassword(context)) {
      items.add(PopupMenuItem(
        value: () => showDialog(
          context: context,
          builder: (context) => _ConfirmRegenerarPasswordDialog(empleado: empleado, regenerarPassword: regenerarPassword),
        ),
        child: Text('Regenerar contraseña'),
      ));
    }

    return PopupMenuButton<VoidCallback>(
      enabled: items.isNotEmpty,
      icon: Icon(LucideIcons.ellipsisVertical, size: 18),
      onSelected: (callback) => callback(),
      itemBuilder: (context) => items,
    );
  }
}

class _ConfirmRegenerarPasswordDialog extends StatefulWidget {
  const _ConfirmRegenerarPasswordDialog({
    required this.empleado,
    required this.regenerarPassword,
  });

  final Empleado empleado;
  final Command1<CredencialesGeneradas, int> regenerarPassword;

  @override
  State<_ConfirmRegenerarPasswordDialog> createState() => _ConfirmRegenerarPasswordDialogState();
}

class _ConfirmRegenerarPasswordDialogState extends State<_ConfirmRegenerarPasswordDialog> {
  @override
  void initState() {
    super.initState();
    widget.regenerarPassword.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.regenerarPassword.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.regenerarPassword.completed) {
      final credenciales = (widget.regenerarPassword.result as Ok<CredencialesGeneradas>).value;
      widget.regenerarPassword.clearResult();
      if (!mounted) return;
      Navigator.of(context).pop();
      CredencialesDialog.show(
        context,
        nombre: widget.empleado.base.nombre,
        credenciales: credenciales,
        isRegeneracion: true,
      );
      return;
    }

    if (widget.regenerarPassword.error) {
      final error = (widget.regenerarPassword.result as Error).error;
      widget.regenerarPassword.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo regenerar la contraseña', error: error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.regenerarPassword,
      builder: (context, _) {
        final running = widget.regenerarPassword.running;
        return AlertDialog(
          title: Text('Regenerar contraseña'),
          content: Text(
            '¿Confirmas que quieres regenerar la contraseña de ${widget.empleado.base.nombre}? '
            'La contraseña actual dejará de funcionar de inmediato.',
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running ? null : () => widget.regenerarPassword.execute(widget.empleado.base.id),
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}

/// Handles the shared result-listening/snackbar/close pattern for both
/// finiquito dialogs below.
mixin _CambiarEstatusResultHandler<T extends StatefulWidget> on State<T> {
  Command1<String, CambiarEstatusEmpleadoParams> get cambiarEstatus;

  void onCambiarEstatusResult() {
    if (cambiarEstatus.completed) {
      final message = (cambiarEstatus.result as Ok<String>).value;
      cambiarEstatus.clearResult();
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
      return;
    }

    if (cambiarEstatus.error) {
      final error = (cambiarEstatus.result as Error).error;
      cambiarEstatus.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo actualizar el estatus', error: error),
        );
      }
    }
  }
}

class _ConfirmProcesoFiniquitoDialog extends StatefulWidget {
  const _ConfirmProcesoFiniquitoDialog({
    required this.empleado,
    required this.cambiarEstatus,
  });

  final Empleado empleado;
  final Command1<String, CambiarEstatusEmpleadoParams> cambiarEstatus;

  @override
  State<_ConfirmProcesoFiniquitoDialog> createState() => _ConfirmProcesoFiniquitoDialogState();
}

class _ConfirmProcesoFiniquitoDialogState extends State<_ConfirmProcesoFiniquitoDialog>
    with _CambiarEstatusResultHandler<_ConfirmProcesoFiniquitoDialog> {
  @override
  Command1<String, CambiarEstatusEmpleadoParams> get cambiarEstatus => widget.cambiarEstatus;

  @override
  void initState() {
    super.initState();
    widget.cambiarEstatus.addListener(onCambiarEstatusResult);
  }

  @override
  void dispose() {
    widget.cambiarEstatus.removeListener(onCambiarEstatusResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.cambiarEstatus,
      builder: (context, _) {
        final running = widget.cambiarEstatus.running;
        return AlertDialog(
          title: Text('Pasar a proceso de finiquito'),
          content: Text(
            '¿Confirmas que quieres iniciar el proceso de finiquito de ${widget.empleado.base.nombre}? '
            'Se eliminarán las nóminas pendientes de pago que tenga registradas. '
            'Los documentos de separación se piden hasta marcarlo como finiquitado.'
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running ? null : () => widget.cambiarEstatus.execute(CambiarEstatusEmpleadoParams(
                empleadoId: widget.empleado.base.id,
                nuevoEstatus: EmpleadoEstatus.procesoFiniquito,
              )),
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}

class _FiniquitadoDialog extends StatefulWidget {
  const _FiniquitadoDialog({
    required this.empleado,
    required this.cambiarEstatus,
  });

  final Empleado empleado;
  final Command1<String, CambiarEstatusEmpleadoParams> cambiarEstatus;

  @override
  State<_FiniquitadoDialog> createState() => _FiniquitadoDialogState();
}

class _FiniquitadoDialogState extends State<_FiniquitadoDialog>
    with _CambiarEstatusResultHandler<_FiniquitadoDialog> {
  @override
  Command1<String, CambiarEstatusEmpleadoParams> get cambiarEstatus => widget.cambiarEstatus;

  DateTime? _fechaBaja;
  PlatformFile? _cartaRenuncia;
  PlatformFile? _finiquitoFirmado;
  PlatformFile? _bajaImss;
  PlatformFile? _comprobanteTransferencia;
  PlatformFile? _convenioTerminacion;

  bool get _allDocumentsAttached =>
      _cartaRenuncia != null &&
      _finiquitoFirmado != null &&
      _bajaImss != null &&
      _comprobanteTransferencia != null &&
      _convenioTerminacion != null;

  @override
  void initState() {
    super.initState();
    widget.cambiarEstatus.addListener(onCambiarEstatusResult);
  }

  @override
  void dispose() {
    widget.cambiarEstatus.removeListener(onCambiarEstatusResult);
    super.dispose();
  }

  Future<void> _pickFile(ValueChanged<PlatformFile> onPicked) async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => onPicked(result.files.first));
    }
  }

  Widget _docPicker(String label, PlatformFile? file, ValueChanged<PlatformFile> onPicked, bool running) {
    return DocumentPickerRow(
      label: label,
      file: file,
      enabled: !running,
      onPick: () => _pickFile(onPicked),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.cambiarEstatus,
      builder: (context, _) {
        final running = widget.cambiarEstatus.running;
        return AlertDialog(
          title: Text('Marcar como finiquitado'),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                spacing: 12,
                children: [
                  Text('Adjunta los 5 documentos de separación laboral para completar el proceso.'),
                  DateFormField(
                    decoration: InputDecoration(labelText: 'FECHA DE BAJA'),
                    onDateSaved: (value) => _fechaBaja = value,
                  ),
                  _docPicker('Carta de renuncia', _cartaRenuncia, (f) => _cartaRenuncia = f, running),
                  _docPicker('Finiquito firmado', _finiquitoFirmado, (f) => _finiquitoFirmado = f, running),
                  _docPicker('Baja IMSS', _bajaImss, (f) => _bajaImss = f, running),
                  _docPicker('Comprobante de transferencia', _comprobanteTransferencia, (f) => _comprobanteTransferencia = f, running),
                  _docPicker('Convenio de terminación', _convenioTerminacion, (f) => _convenioTerminacion = f, running),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || !_allDocumentsAttached
                  ? null
                  : () => widget.cambiarEstatus.execute(CambiarEstatusEmpleadoParams(
                      empleadoId: widget.empleado.base.id,
                      nuevoEstatus: EmpleadoEstatus.finiquitado,
                      fechaBaja: _fechaBaja,
                      cartaRenuncia: _cartaRenuncia,
                      finiquitoFirmado: _finiquitoFirmado,
                      bajaImss: _bajaImss,
                      comprobanteTransferencia: _comprobanteTransferencia,
                      convenioTerminacion: _convenioTerminacion,
                    )),
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}

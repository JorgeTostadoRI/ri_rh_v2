import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/ui/core/ui/credenciales_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicantes_viewmodel.dart';
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

class PracticanteActionsMenu extends StatelessWidget {
  const PracticanteActionsMenu({
    super.key,
    required this.practicante,
    required this.cambiarEstado,
    required this.regenerarPassword,
  });

  final Practicante practicante;
  final Command1<String, CambiarEstadoPracticanteParams> cambiarEstado;
  final Command1<CredencialesGeneradas, int> regenerarPassword;

  @override
  Widget build(BuildContext context) {
    final items = <PopupMenuEntry<VoidCallback>>[];

    if (practicante.status == StatusPracticante.alta) {
      items.add(PopupMenuItem(
        value: () => showDialog(
          context: context,
          builder: (context) => _BajaDialog(practicante: practicante, cambiarEstado: cambiarEstado),
        ),
        child: Text('Pasar a inactivo'),
      ));
    }

    if (_puedeRegenerarPassword(context)) {
      items.add(PopupMenuItem(
        value: () => showDialog(
          context: context,
          builder: (context) => _ConfirmRegenerarPasswordDialog(practicante: practicante, regenerarPassword: regenerarPassword),
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
    required this.practicante,
    required this.regenerarPassword,
  });

  final Practicante practicante;
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
        nombre: widget.practicante.base.nombre,
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
            '¿Confirmas que quieres regenerar la contraseña de ${widget.practicante.base.nombre}? '
            'La contraseña actual dejará de funcionar de inmediato.',
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running ? null : () => widget.regenerarPassword.execute(widget.practicante.base.id),
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

class _BajaDialog extends StatefulWidget {
  const _BajaDialog({
    required this.practicante,
    required this.cambiarEstado,
  });

  final Practicante practicante;
  final Command1<String, CambiarEstadoPracticanteParams> cambiarEstado;

  @override
  State<_BajaDialog> createState() => _BajaDialogState();
}

class _BajaDialogState extends State<_BajaDialog> {
  DateTime? _fechaBaja;
  PlatformFile? _cartaLiberacion;

  @override
  void initState() {
    super.initState();
    widget.cambiarEstado.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.cambiarEstado.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.cambiarEstado.completed) {
      final message = (widget.cambiarEstado.result as Ok<String>).value;
      widget.cambiarEstado.clearResult();
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
      return;
    }

    if (widget.cambiarEstado.error) {
      final error = (widget.cambiarEstado.result as Error).error;
      widget.cambiarEstado.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo actualizar el estado', error: error),
        );
      }
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _cartaLiberacion = result.files.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.cambiarEstado,
      builder: (context, _) {
        final running = widget.cambiarEstado.running;
        return AlertDialog(
          title: Text('Pasar a inactivo'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 12,
              children: [
                Text(
                  '¿Confirmas que quieres dar de baja a ${widget.practicante.base.nombre}? '
                  'Se eliminarán las nóminas pendientes de pago que tenga registradas.'
                ),
                DateFormField(
                  decoration: InputDecoration(labelText: 'FECHA DE BAJA'),
                  onDateSaved: (value) => _fechaBaja = value,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _cartaLiberacion == null ? 'Carta de liberación (requerida)' : 'Carta de liberación — ${_cartaLiberacion!.name}',
                        style: TextStyle(fontWeight: _cartaLiberacion == null ? .normal : .w700),
                      ),
                    ),
                    TextButton(
                      onPressed: running ? null : _pickFile,
                      child: Text(_cartaLiberacion == null ? 'Adjuntar' : 'Cambiar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || _cartaLiberacion == null
                  ? null
                  : () => widget.cambiarEstado.execute(CambiarEstadoPracticanteParams(
                      practicanteId: widget.practicante.base.id,
                      nuevoEstado: StatusPracticante.baja,
                      fechaBaja: _fechaBaja,
                      cartaLiberacion: _cartaLiberacion,
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

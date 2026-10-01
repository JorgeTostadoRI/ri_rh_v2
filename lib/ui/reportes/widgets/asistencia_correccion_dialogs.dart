import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';

/// Dialogo para corregir el codigo de nomina de un dia -- en realidad edita
/// el status real de AsistenciaDaily (no el codigo derivado), porque el
/// codigo no es reversible a un status especifico (LATE y AUTHORIZED_LATE
/// comparten codigo 'R'). Regresa el AsistenciaStatus elegido via
/// Navigator.pop, o null si se cancela.
class EditCodigoDialog extends StatefulWidget {
  const EditCodigoDialog({super.key, required this.status});

  final AsistenciaStatus status;

  @override
  State<EditCodigoDialog> createState() => _EditCodigoDialogState();
}

class _EditCodigoDialogState extends State<EditCodigoDialog> {
  // TERMINATION ('Baja') no tiene codigo de nomina asociado en el backend
  // (STATUS_CODE_MAP no la incluye) -- se excluye para no dejar la celda
  // en blanco a proposito.
  static const _excluidos = {AsistenciaStatus.termination};

  late AsistenciaStatus _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    // El status actual del dia siempre debe estar en la lista aunque sea
    // uno excluido (ej. termination) -- si no, initialValue no coincide con
    // ningun item y DropdownButtonFormField truena. Se puede salir de un
    // status excluido eligiendo otro, pero no se puede volver a elegir.
    final opciones = {
      ...AsistenciaStatus.values.where((s) => !_excluidos.contains(s)),
      widget.status,
    }.toList();

    return AlertDialog(
      title: Text('Corregir código de nómina'),
      content: SizedBox(
        width: 400,
        child: DropdownButtonFormField<AsistenciaStatus>(
          initialValue: _selected,
          items: [
            for (final status in opciones)
              DropdownMenuItem(value: status, child: Text(status.label)),
          ],
          onChanged: (value) {
            if (value != null) setState(() => _selected = value);
          },
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => context.pop(_selected),
          child: Text('Guardar'),
        ),
      ],
    );
  }
}

/// Dialogo para corregir un valor numerico (minutos de retardo u horas
/// extra) de un solo dia. Regresa el texto ingresado via Navigator.pop, o
/// null si se cancela.
class EditNumeroDialog extends StatefulWidget {
  const EditNumeroDialog({
    super.key,
    required this.titulo,
    required this.valorInicial,
    this.decimales = false,
  });

  final String titulo;
  final num valorInicial;
  final bool decimales;

  @override
  State<EditNumeroDialog> createState() => _EditNumeroDialogState();
}

class _EditNumeroDialogState extends State<EditNumeroDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.valorInicial.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 300,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(decimal: widget.decimales),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Ingrese un valor';
              final parsed = widget.decimales ? double.tryParse(value) : int.tryParse(value);
              if (parsed == null) return 'Valor inválido';
              return null;
            },
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.pop(_controller.text);
            }
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }
}

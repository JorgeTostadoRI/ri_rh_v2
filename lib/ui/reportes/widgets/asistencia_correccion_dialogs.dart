import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/asistencia_daily/asistencia_daily.dart';

/// Resultado de [EditCodigoDialog]: el status elegido, y los minutos de
/// retardo capturados junto con el (solo no-null cuando status == late,
/// ver [EditCodigoDialog]).
typedef EditCodigoResult = ({AsistenciaStatus status, int? minutosRetardo});

/// Dialogo para corregir el codigo de nomina de un dia -- en realidad edita
/// el status real de AsistenciaDaily (no el codigo derivado), porque el
/// codigo no es reversible a un status especifico (LATE y AUTHORIZED_LATE
/// comparten codigo 'R'). Cuando el status elegido es Retardo (LATE,
/// nunca AUTHORIZED_LATE -- ver _excluidos), tambien pide los minutos de
/// retardo de ese dia, para poder corregir ambos de una sola vez. Regresa
/// un [EditCodigoResult] via Navigator.pop, o null si se cancela.
class EditCodigoDialog extends StatefulWidget {
  const EditCodigoDialog({
    super.key,
    required this.status,
    required this.minutosActual,
  });

  final AsistenciaStatus status;
  final int minutosActual;

  @override
  State<EditCodigoDialog> createState() => _EditCodigoDialogState();
}

class _EditCodigoDialogState extends State<EditCodigoDialog> {
  // TERMINATION ('Baja') no tiene codigo de nomina asociado en el backend
  // (STATUS_CODE_MAP no la incluye) -- se excluye para no dejar la celda
  // en blanco a proposito.
  // AUTHORIZED_LATE es un estado transitorio/invisible en el reporte de
  // nomina (comparte codigo 'R' con LATE, nunca se distingue en pantalla) --
  // solo lo asigna el sistema mientras espera a que alguien checque, nunca
  // debe poder elegirse a mano.
  static const _excluidos = {AsistenciaStatus.termination, AsistenciaStatus.authorizedLate};

  final _formKey = GlobalKey<FormState>();
  late AsistenciaStatus _selected;
  late final TextEditingController _minutosController;

  @override
  void initState() {
    super.initState();
    _selected = widget.status;
    _minutosController = TextEditingController(text: widget.minutosActual.toString());
  }

  @override
  void dispose() {
    _minutosController.dispose();
    super.dispose();
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
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              DropdownButtonFormField<AsistenciaStatus>(
                initialValue: _selected,
                items: [
                  for (final status in opciones)
                    DropdownMenuItem(
                      value: status,
                      // AUTHORIZED_LATE nunca debe leerse como tal -- en el
                      // reporte comparte el mismo codigo visible ("R") que
                      // LATE, asi que si es el valor actual de un dia
                      // pendiente se muestra con la misma etiqueta que
                      // Retardo. El valor seleccionado sigue siendo el real
                      // (authorizedLate) hasta que se elija otra cosa, solo
                      // cambia lo que se lee.
                      child: Text(
                        status == AsistenciaStatus.authorizedLate
                          ? AsistenciaStatus.late.label
                          : status.label,
                      ),
                    ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _selected = value);
                },
              ),
              // Solo Retardo pide minutos aqui -- Retardo autorizado nunca
              // es seleccionable (ver _excluidos) y el resto de estados no
              // tiene un concepto de minutos de retardo asociado.
              if (_selected == AsistenciaStatus.late)
                TextFormField(
                  controller: _minutosController,
                  decoration: InputDecoration(labelText: 'Minutos de retardo'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Ingrese un valor';
                    final parsed = int.tryParse(value);
                    if (parsed == null || parsed < 0) return 'Valor inválido';
                    return null;
                  },
                ),
            ],
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
            if (_selected == AsistenciaStatus.late && !_formKey.currentState!.validate()) {
              return;
            }
            final minutos = _selected == AsistenciaStatus.late
              ? int.parse(_minutosController.text)
              : null;
            context.pop((status: _selected, minutosRetardo: minutos));
          },
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

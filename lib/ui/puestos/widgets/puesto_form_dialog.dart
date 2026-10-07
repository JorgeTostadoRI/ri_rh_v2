import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto_params.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

// Mismas opciones (y mismo criterio de exclusión de MASTER/ADMINISTRADOR/
// COMPRADOR) que usa home_screen.dart para el auto-cambio de rol.
const rolOptions = [
  ('OPERADOR', 'Operador'),
  ('LIDER', 'Lider'),
];

/// Diálogo para crear o editar un Puesto. Usado tanto desde el alta de
/// empleados (crear/editar el catálogo de puestos) como desde Reclutamiento
/// (Dirección editando el puesto asociado a una solicitud de vacante).
class PuestoFormDialog extends StatefulWidget {
  const PuestoFormDialog({
    super.key,
    required this.createPuesto,
    required this.editPuesto,
    required this.departamentos,
    this.initialPuesto,
  });

  final Command1<Puesto, PuestoCreateParams> createPuesto;
  final Command1<Puesto, PuestoEditParams> editPuesto;
  final List<Departamento> departamentos;
  /// Si viene distinto de null, el diálogo abre en modo edición
  /// (precargado con sus datos y llamando a [editPuesto] en vez de
  /// [createPuesto] al guardar).
  final Puesto? initialPuesto;

  bool get _isEditing => initialPuesto != null;

  @override
  State<PuestoFormDialog> createState() => _PuestoFormDialogState();
}

class _PuestoFormDialogState extends State<PuestoFormDialog> {
  final _nombre = TextEditingController();
  final _responsabilidades = TextEditingController();
  TipoPuesto _tipo = TipoPuesto.administrativo;
  String? _rol;
  PlatformFile? _tabuladorSalarial;
  final Set<int> _departamentosSeleccionados = {};
  final List<TextEditingController> _preguntasEntrevista = [];
  final List<TextEditingController> _preguntasPuesto = [];

  @override
  void initState() {
    super.initState();
    widget.createPuesto.addListener(_onResult);
    widget.editPuesto.addListener(_onResult);

    final puesto = widget.initialPuesto;
    if (puesto != null) {
      _nombre.text = puesto.nombre;
      _tipo = puesto.tipo;
      _rol = puesto.rol;
      _responsabilidades.text = puesto.responsabilidades;
      _departamentosSeleccionados.addAll(puesto.departamentos);
      for (final p in puesto.preguntas) {
        final controller = TextEditingController(text: p.texto);
        if (p.categoria == CategoriaPregunta.entrevista) {
          _preguntasEntrevista.add(controller);
        } else {
          _preguntasPuesto.add(controller);
        }
      }
    }
  }

  @override
  void dispose() {
    widget.createPuesto.removeListener(_onResult);
    widget.editPuesto.removeListener(_onResult);
    _nombre.dispose();
    _responsabilidades.dispose();
    for (final c in _preguntasEntrevista) {
      c.dispose();
    }
    for (final c in _preguntasPuesto) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickTabuladorSalarial() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['xlsx', 'xls'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _tabuladorSalarial = result.files.first);
    }
  }

  List<PreguntaPuesto> get _preguntas => [
        for (var i = 0; i < _preguntasEntrevista.length; i++)
          if (_preguntasEntrevista[i].text.trim().isNotEmpty)
            PreguntaPuesto(
              categoria: CategoriaPregunta.entrevista,
              texto: _preguntasEntrevista[i].text.trim(),
              orden: i,
            ),
        for (var i = 0; i < _preguntasPuesto.length; i++)
          if (_preguntasPuesto[i].text.trim().isNotEmpty)
            PreguntaPuesto(
              categoria: CategoriaPregunta.puesto,
              texto: _preguntasPuesto[i].text.trim(),
              orden: i,
            ),
      ];

  void _submitPuesto() {
    if (widget._isEditing) {
      widget.editPuesto.execute((
        id: widget.initialPuesto!.id!,
        nombre: _nombre.text.trim(),
        tipos: _tipo.name,
        rol: _rol,
        responsabilidades: _responsabilidades.text.trim(),
        tabuladorSalarial: _tabuladorSalarial,
        departamentoIds: _departamentosSeleccionados.toList(),
        preguntas: _preguntas,
      ));
    } else {
      widget.createPuesto.execute((
        nombre: _nombre.text.trim(),
        tipos: _tipo.name,
        rol: _rol,
        responsabilidades: _responsabilidades.text.trim(),
        tabuladorSalarial: _tabuladorSalarial,
        departamentoIds: _departamentosSeleccionados.toList(),
        preguntas: _preguntas,
      ));
    }
  }

  void _onResult() {
    final command = widget._isEditing ? widget.editPuesto : widget.createPuesto;
    if (command.completed) {
      final puesto = (command.result as Ok<Puesto>).value;
      command.clearResult();
      if (mounted) Navigator.of(context).pop(puesto);
      return;
    }
    if (command.error) {
      final error = (command.result as Error).error;
      command.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(
            context,
            widget._isEditing ? 'No se pudo editar el puesto' : 'No se pudo crear el puesto',
            error: error,
          ),
        );
      }
    }
  }

  Widget _preguntasSection(String title, List<TextEditingController> controllers) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(title, style: TextTheme.of(context).labelMedium),
        for (var i = 0; i < controllers.length; i++)
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(labelText: 'Pregunta ${i + 1}'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => setState(() {
                  controllers[i].dispose();
                  controllers.removeAt(i);
                }),
              ),
            ],
          ),
        TextButton.icon(
          icon: Icon(Icons.add),
          label: Text('Agregar pregunta'),
          onPressed: () => setState(() => controllers.add(TextEditingController())),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([widget.createPuesto, widget.editPuesto]),
      builder: (context, _) {
        final running = widget.createPuesto.running || widget.editPuesto.running;
        return AlertDialog(
          title: Text(widget._isEditing ? 'Editar puesto' : 'Crear puesto'),
          content: SizedBox(
            width: 560,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                spacing: 16,
                children: [
                  TextField(
                    controller: _nombre,
                    decoration: InputDecoration(labelText: 'NOMBRE'),
                  ),
                  DropdownButtonFormField<TipoPuesto>(
                    initialValue: _tipo,
                    decoration: InputDecoration(labelText: 'TIPO'),
                    items: TipoPuesto.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name))).toList(),
                    onChanged: (value) => setState(() => _tipo = value ?? _tipo),
                  ),
                  DropdownButtonFormField<String>(
                    initialValue: _rol,
                    decoration: InputDecoration(labelText: 'ROL'),
                    items: rolOptions.map((r) => DropdownMenuItem(value: r.$1, child: Text(r.$2))).toList(),
                    onChanged: (value) => setState(() => _rol = value),
                  ),
                  Text('DEPARTAMENTOS ENCARGADOS', style: TextTheme.of(context).labelMedium),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.departamentos.map((d) {
                      final selected = _departamentosSeleccionados.contains(d.id);
                      return FilterChip(
                        label: Text(d.nombre),
                        selected: selected,
                        onSelected: (sel) => setState(() {
                          if (sel) {
                            _departamentosSeleccionados.add(d.id);
                          } else {
                            _departamentosSeleccionados.remove(d.id);
                          }
                        }),
                      );
                    }).toList(),
                  ),
                  TextField(
                    controller: _responsabilidades,
                    maxLines: 4,
                    decoration: InputDecoration(labelText: 'RESPONSABILIDADES'),
                  ),
                  DocumentPickerRow(
                    label: _tabuladorSalarial == null && widget.initialPuesto?.tabuladorSalarialUrl != null
                        ? 'Tabulador salarial (Excel) — ya hay uno adjuntado, elige otro para reemplazarlo'
                        : 'Tabulador salarial (Excel)',
                    file: _tabuladorSalarial,
                    onPick: _pickTabuladorSalarial,
                  ),
                  _preguntasSection('CUESTIONARIO DE ENTREVISTA', _preguntasEntrevista),
                  _preguntasSection('CUESTIONARIO DEL PUESTO', _preguntasPuesto),
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
              onPressed: running || _nombre.text.trim().isEmpty ? null : _submitPuesto,
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(widget._isEditing ? 'Guardar cambios' : 'Crear'),
            ),
          ],
        );
      },
    );
  }
}

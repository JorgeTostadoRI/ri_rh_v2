import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';

class DiaFestivoFormDialog extends StatefulWidget {
  const DiaFestivoFormDialog({super.key});

  @override
  State<DiaFestivoFormDialog> createState() => _DiaFestivoFormDialogState();
}

class _DiaFestivoFormDialogState extends State<DiaFestivoFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  DateTime? _fecha;

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.pop(
        DiaFestivo(fecha: _fecha!, nombre: _nombreController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nuevo día festivo'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: .min,
          spacing: 16,
          children: [
            Text(
              'Ese día, todos los empleados aparecerán como "Festivo no trabajado" en los reportes, sin importar su asistencia u otras incidencias aprobadas.',
            ),
            DateFormField(
              decoration: InputDecoration(
                labelText: 'FECHA',
                hintText: 'dd/mm/aa',
              ),
              required: true,
              onDateSaved: (date) => _fecha = date,
            ),
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'NOMBRE (OPCIONAL)',
                hintText: 'Ej. Día de la Independencia',
              ),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        ElevatedButton(onPressed: _submit, child: Text('Guardar')),
      ],
    );
  }
}

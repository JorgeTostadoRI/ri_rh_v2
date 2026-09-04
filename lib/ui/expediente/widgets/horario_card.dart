import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/domain/models/horario/horario_dia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/form/time_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:ri_rh_v2/utils/time/time.dart';

const _customDayLabels = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie'];

/// Nombre a mostrar para un [Horario], construido a partir de sus horas y
/// días reales en vez del campo `name` del catálogo (que puede venir con
/// nombres inconsistentes, ej. nombres de personas o abreviaciones sueltas).
/// Esto es puramente de presentación: no modifica ni depende del `name`
/// guardado en la base de datos.
String horarioDisplayName(Horario horario) {
  if (horario.scheduleType == HorarioScheduleType.custom) {
    return _customDisplayName(horario);
  }

  final entrada = _formatTime(horario.firstStartTime!);
  final salida = _formatTime(horario.secondEndTime!);
  final dias = _formatDays(horario);
  return '$entrada - $salida ($dias)';
}

String _customDisplayName(Horario horario) {
  if (horario.dias.isEmpty) return 'Personalizado (sin días configurados)';

  final sorted = [...horario.dias]..sort((a, b) => a.day.compareTo(b.day));
  final lines = sorted.map((dia) {
    final label = _customDayLabels[dia.day];
    return '$label ${_formatTime(dia.startTime)} - ${_formatTime(dia.endTime)}';
  }).join('\n');
  return 'Personalizado:\n$lines';
}

String _formatTime(Time time) {
  final period = time.hour >= 12 ? 'PM' : 'AM';
  final hour12 = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour12:$minute $period';
}

String _formatDays(Horario horario) {
  const labels = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
  final flags = [horario.mon, horario.tue, horario.wed, horario.thu, horario.fri, horario.sat, horario.sun];

  final groups = <String>[];
  int i = 0;
  while (i < flags.length) {
    if (!flags[i]) {
      i++;
      continue;
    }
    int j = i;
    while (j + 1 < flags.length && flags[j + 1]) {
      j++;
    }
    groups.add(j > i ? '${labels[i]}-${labels[j]}' : labels[i]);
    i = j + 1;
  }

  return groups.isEmpty ? 'Sin días asignados' : groups.join(', ');
}

TimeOfDay _timeToTimeOfDay(Time time) => TimeOfDay(hour: time.hour, minute: time.minute);

Time _timeOfDayToTime(TimeOfDay time) => Time(time.hour, time.minute);

String _timeOfDayToInitialValue(TimeOfDay? time) {
  if (time == null) return '';
  final hh = time.hour.toString().padLeft(2, '0');
  final mm = time.minute.toString().padLeft(2, '0');
  return '$hh:$mm';
}

class HorarioCard extends StatelessWidget {
  const HorarioCard({
    super.key,
    required this.horarios,
    required this.selectedHorarioId,
    required this.userNombre,
    required this.assignHorario,
    required this.createCustomHorario,
  });

  final List<Horario> horarios;
  final int? selectedHorarioId;
  final String userNombre;
  final Command1<void, int> assignHorario;
  final Command1<Horario, Horario> createCustomHorario;

  Horario? _findSelected() {
    if (selectedHorarioId == null) return null;
    for (final horario in horarios) {
      if (horario.id == selectedHorarioId) return horario;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final current = _findSelected();

    return Badge(
      backgroundColor: statusWarningColor,
      label: const Text('!'),
      isLabelVisible: current == null,
      child: IconCard(
        icon: LucideIcons.clock,
        title: 'Horario',
        children: [
          Text(current == null ? 'Sin horario de entrada asignado' : horarioDisplayName(current)),
          ElevatedButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return _AssignHorarioDialog(
                  horarios: horarios,
                  initialHorario: current,
                  userNombre: userNombre,
                  assignHorario: assignHorario,
                  createCustomHorario: createCustomHorario,
                );
              },
            ),
            child: Text(current == null ? 'Asignar' : 'Cambiar'),
          ),
        ],
      ),
    );
  }
}

enum _AssignMode { existing, custom }

class _DayRowData {
  _DayRowData({required this.day, required this.label});

  final int day;
  final String label;
  bool dayOff = false;
  TimeOfDay? start;
  TimeOfDay? end;
  bool hasLunch = false;
  TimeOfDay? lunchStart;
  TimeOfDay? lunchEnd;
}

class _AssignHorarioDialog extends StatefulWidget {
  const _AssignHorarioDialog({
    required this.horarios,
    required this.initialHorario,
    required this.userNombre,
    required this.assignHorario,
    required this.createCustomHorario,
  });

  final List<Horario> horarios;
  final Horario? initialHorario;
  final String userNombre;
  final Command1<void, int> assignHorario;
  final Command1<Horario, Horario> createCustomHorario;

  @override
  State<_AssignHorarioDialog> createState() => _AssignHorarioDialogState();
}

class _AssignHorarioDialogState extends State<_AssignHorarioDialog> {
  Horario? _selected;
  late _AssignMode _mode;
  late final List<_DayRowData> _dayRows;

  @override
  void initState() {
    super.initState();
    _dayRows = List.generate(
      _customDayLabels.length,
      (day) => _DayRowData(day: day, label: _customDayLabels[day]),
    );

    final initial = widget.initialHorario;
    if (initial != null && initial.scheduleType == HorarioScheduleType.custom) {
      _mode = _AssignMode.custom;
      final presentDays = <int>{};
      for (final dia in initial.dias) {
        presentDays.add(dia.day);
        final row = _dayRows[dia.day];
        row.start = _timeToTimeOfDay(dia.startTime);
        row.end = _timeToTimeOfDay(dia.endTime);
        if (dia.lunchStartTime != null && dia.lunchEndTime != null) {
          row.hasLunch = true;
          row.lunchStart = _timeToTimeOfDay(dia.lunchStartTime!);
          row.lunchEnd = _timeToTimeOfDay(dia.lunchEndTime!);
        }
      }
      for (final row in _dayRows) {
        row.dayOff = !presentDays.contains(row.day);
      }
    } else {
      _mode = _AssignMode.existing;
      _selected = initial;
    }

    widget.assignHorario.addListener(_onAssignResult);
  }

  @override
  void dispose() {
    widget.assignHorario.removeListener(_onAssignResult);
    super.dispose();
  }

  void _onAssignResult() {
    if (widget.assignHorario.completed) {
      widget.assignHorario.clearResult();
      if (mounted) Navigator.of(context).pop();
      return;
    }

    if (widget.assignHorario.error) {
      final error = (widget.assignHorario.result as Error).error;
      widget.assignHorario.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo asignar el horario', error: error),
        );
      }
    }
  }

  Horario? _buildCustomHorario() {
    final activeRows = _dayRows.where((row) => !row.dayOff).toList();

    if (activeRows.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona al menos un día de trabajo')),
      );
      return null;
    }

    for (final row in activeRows) {
      if (row.start == null || row.end == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Completa la hora de entrada y salida de ${row.label}')),
        );
        return null;
      }
      if (row.hasLunch && (row.lunchStart == null || row.lunchEnd == null)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Completa las horas de comida de ${row.label} o desactiva esa opción')),
        );
        return null;
      }
    }

    final dias = activeRows.map((row) {
      return HorarioDia(
        day: row.day,
        startTime: _timeOfDayToTime(row.start!),
        endTime: _timeOfDayToTime(row.end!),
        lunchStartTime: row.hasLunch ? _timeOfDayToTime(row.lunchStart!) : null,
        lunchEndTime: row.hasLunch ? _timeOfDayToTime(row.lunchEnd!) : null,
      );
    }).toList();

    return Horario(
      name: 'Personalizado - ${widget.userNombre}',
      scheduleType: HorarioScheduleType.custom,
      dias: dias,
    );
  }

  Future<void> _onSavePressed() async {
    if (_mode == _AssignMode.existing) {
      if (_selected == null) return;
      widget.assignHorario.execute(_selected!.id);
      return;
    }

    final horario = _buildCustomHorario();
    if (horario == null) return;

    await widget.createCustomHorario.execute(horario);
    final createResult = widget.createCustomHorario.result;

    if (createResult is Error) {
      final error = createResult.error;
      widget.createCustomHorario.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo crear el horario personalizado', error: error),
        );
      }
      return;
    }

    final created = (createResult as Ok<Horario>).value;
    widget.createCustomHorario.clearResult();
    widget.assignHorario.execute(created.id);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([widget.assignHorario, widget.createCustomHorario]),
      builder: (context, _) {
        final running = widget.assignHorario.running || widget.createCustomHorario.running;

        return AlertDialog(
          title: Text('Asignar Horario de Entrada'),
          content: SizedBox(
            width: 480,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                spacing: 16,
                children: [
                  SegmentedButton<_AssignMode>(
                    segments: const [
                      ButtonSegment(value: _AssignMode.existing, label: Text('Horario existente')),
                      ButtonSegment(value: _AssignMode.custom, label: Text('Personalizado por día')),
                    ],
                    selected: {_mode},
                    onSelectionChanged: running ? null : (value) => setState(() => _mode = value.first),
                  ),
                  if (_mode == _AssignMode.existing)
                    _ExistingHorarioPicker(
                      horarios: widget.horarios.where((h) => h.scheduleType == HorarioScheduleType.uniform).toList(),
                      selected: _selected,
                      enabled: !running,
                      onChanged: (value) => setState(() => _selected = value),
                    )
                  else
                    Column(
                      mainAxisSize: .min,
                      crossAxisAlignment: .start,
                      spacing: 12,
                      children: [
                        for (final row in _dayRows)
                          _CustomDayRow(
                            key: ValueKey(row.day),
                            data: row,
                            enabled: !running,
                            onChanged: () => setState(() {}),
                          ),
                      ],
                    ),
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
              onPressed: running || (_mode == _AssignMode.existing && _selected == null) ? null : _onSavePressed,
              child: running
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}

class _ExistingHorarioPicker extends StatelessWidget {
  const _ExistingHorarioPicker({
    required this.horarios,
    required this.selected,
    required this.enabled,
    required this.onChanged,
  });

  final List<Horario> horarios;
  final Horario? selected;
  final bool enabled;
  final ValueChanged<Horario?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Horario>(
      initialValue: selected,
      items: horarios
          .map((horario) => DropdownMenuItem(value: horario, child: Text(horarioDisplayName(horario))))
          .toList(),
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(labelText: 'HORARIO'),
    );
  }
}

class _CustomDayRow extends StatelessWidget {
  const _CustomDayRow({
    super.key,
    required this.data,
    required this.enabled,
    required this.onChanged,
  });

  final _DayRowData data;
  final bool enabled;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(data.label, style: TextStyle(fontWeight: .w700)),
              ),
              Text('Día libre'),
              Checkbox(
                value: data.dayOff,
                onChanged: enabled
                    ? (value) {
                        data.dayOff = value ?? false;
                        onChanged();
                      }
                    : null,
              ),
            ],
          ),
          if (!data.dayOff) ...[
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: TimeFormField(
                    key: ValueKey('${data.day}-start'),
                    initialValue: _timeOfDayToInitialValue(data.start),
                    decoration: InputDecoration(labelText: 'ENTRADA'),
                    required: true,
                    onTimeSaved: enabled ? (value) => data.start = value : null,
                  ),
                ),
                Expanded(
                  child: TimeFormField(
                    key: ValueKey('${data.day}-end'),
                    initialValue: _timeOfDayToInitialValue(data.end),
                    decoration: InputDecoration(labelText: 'SALIDA'),
                    required: true,
                    onTimeSaved: enabled ? (value) => data.end = value : null,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Tiene hora de comida'),
                Checkbox(
                  value: data.hasLunch,
                  onChanged: enabled
                      ? (value) {
                          data.hasLunch = value ?? false;
                          onChanged();
                        }
                      : null,
                ),
              ],
            ),
            if (data.hasLunch)
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: TimeFormField(
                      key: ValueKey('${data.day}-lunch-start'),
                      initialValue: _timeOfDayToInitialValue(data.lunchStart),
                      decoration: InputDecoration(labelText: 'SALIDA A COMER'),
                      required: true,
                      onTimeSaved: enabled ? (value) => data.lunchStart = value : null,
                    ),
                  ),
                  Expanded(
                    child: TimeFormField(
                      key: ValueKey('${data.day}-lunch-end'),
                      initialValue: _timeOfDayToInitialValue(data.lunchEnd),
                      decoration: InputDecoration(labelText: 'REGRESO DE COMER'),
                      required: true,
                      onTimeSaved: enabled ? (value) => data.lunchEnd = value : null,
                    ),
                  ),
                ],
              ),
          ],
        ],
      ),
    );
  }
}

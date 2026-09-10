import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Campo de "Jefe Directo" pensado para embeberse dentro de un formulario
/// (junto a los demás datos laborales), en vez de ser una tarjeta aparte.
/// Muestra el jefe actual como texto de solo lectura, con un ícono para
/// abrir el diálogo de asignación.
class JefeField extends StatelessWidget {
  const JefeField({
    super.key,
    required this.candidates,
    required this.currentUserId,
    required this.selectedJefeId,
    required this.assignJefe,
  });

  final List<User> candidates;
  final int currentUserId;
  final int? selectedJefeId;
  final Command1<void, int> assignJefe;

  User? _findSelected() {
    if (selectedJefeId == null) return null;
    for (final user in candidates) {
      if (user.id == selectedJefeId) return user;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final current = _findSelected();
    final available = candidates.where((u) => u.id != currentUserId).toList();

    return TextFormField(
      key: ValueKey('jefe-${current?.id}'),
      readOnly: true,
      initialValue: current?.nombre ?? 'Sin asignar',
      decoration: InputDecoration(
        labelText: 'JEFE DIRECTO',
        suffixIcon: available.isEmpty
            ? null
            : MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return _AssignJefeDialog(
                        candidates: available,
                        initialJefe: current,
                        assignJefe: assignJefe,
                      );
                    },
                  ),
                  child: Icon(LucideIcons.pen, color: labelTextColor),
                ),
              ),
      ),
    );
  }
}

class _AssignJefeDialog extends StatefulWidget {
  const _AssignJefeDialog({
    required this.candidates,
    required this.initialJefe,
    required this.assignJefe,
  });

  final List<User> candidates;
  final User? initialJefe;
  final Command1<void, int> assignJefe;

  @override
  State<_AssignJefeDialog> createState() => _AssignJefeDialogState();
}

class _AssignJefeDialogState extends State<_AssignJefeDialog> {
  User? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialJefe;
    widget.assignJefe.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.assignJefe.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.assignJefe.completed) {
      widget.assignJefe.clearResult();
      if (mounted) Navigator.of(context).pop();
      return;
    }

    if (widget.assignJefe.error) {
      final error = (widget.assignJefe.result as Error).error;
      widget.assignJefe.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo asignar el jefe directo', error: error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.assignJefe,
      builder: (context, _) {
        final running = widget.assignJefe.running;
        return AlertDialog(
          title: Text('Asignar Jefe Directo'),
          content: SizedBox(
            width: 360,
            child: Autocomplete<User>(
              initialValue: TextEditingValue(text: _selected?.nombre ?? ''),
              displayStringForOption: (user) => user.nombre,
              optionsBuilder: (textEditingValue) {
                final query = textEditingValue.text.toLowerCase();
                if (query.isEmpty) return widget.candidates;
                return widget.candidates.where((u) => u.nombre.toLowerCase().contains(query));
              },
              onSelected: running ? null : (user) => setState(() => _selected = user),
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  enabled: !running,
                  decoration: InputDecoration(labelText: 'JEFE DIRECTO'),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || _selected == null
                  ? null
                  : () => widget.assignJefe.execute(_selected!.id),
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

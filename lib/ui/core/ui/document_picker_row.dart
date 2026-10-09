import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

/// A labeled row for attaching an optional document: shows the label (and
/// the picked file's name once attached), and a button to pick/replace it.
/// The actual [FilePicker.pickFiles] call is left to the caller via [onPick]
/// so each screen can decide its own allowed extensions/multi-select needs.
///
/// [onView] is optional: when provided, shows an extra "Ver" button to
/// preview/open the current document (ya sea el archivo recién elegido o
/// uno ya subido antes) sin afectar las pantallas que no lo necesitan.
class DocumentPickerRow extends StatelessWidget {
  const DocumentPickerRow({
    super.key,
    required this.label,
    required this.file,
    required this.onPick,
    this.enabled = true,
    this.onView,
  });

  final String label;
  final PlatformFile? file;
  final VoidCallback onPick;
  final bool enabled;
  final VoidCallback? onView;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            file == null ? label : '$label — ${file!.name}',
            style: TextStyle(fontWeight: file == null ? .normal : .w700),
          ),
        ),
        if (onView != null)
          TextButton(
            onPressed: onView,
            child: Text('Ver'),
          ),
        TextButton(
          onPressed: enabled ? onPick : null,
          child: Text(file == null ? 'Adjuntar' : 'Cambiar'),
        ),
      ],
    );
  }
}

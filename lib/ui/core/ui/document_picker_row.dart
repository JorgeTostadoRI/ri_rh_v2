import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

/// A labeled row for attaching an optional document: shows the label (and
/// the picked file's name once attached), and a button to pick/replace it.
/// The actual [FilePicker.pickFiles] call is left to the caller via [onPick]
/// so each screen can decide its own allowed extensions/multi-select needs.
class DocumentPickerRow extends StatelessWidget {
  const DocumentPickerRow({
    super.key,
    required this.label,
    required this.file,
    required this.onPick,
    this.enabled = true,
  });

  final String label;
  final PlatformFile? file;
  final VoidCallback onPick;
  final bool enabled;

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
        TextButton(
          onPressed: enabled ? onPick : null,
          child: Text(file == null ? 'Adjuntar' : 'Cambiar'),
        ),
      ],
    );
  }
}

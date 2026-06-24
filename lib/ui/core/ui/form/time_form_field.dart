import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class TimeFormField extends StatefulWidget {
  const TimeFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.onTimeSaved,
    this.validatorMessage,
    this.decoration,
    this.required = false,
  });

  final TextEditingController? controller;
  final String? initialValue; // e.g. "14:30"
  final ValueChanged<TimeOfDay?>? onTimeSaved;
  final String? validatorMessage;
  final InputDecoration? decoration;
  final bool required;

  @override
  State<TimeFormField> createState() => _TimeFormFieldState();
}


class _TimeFormFieldState extends State<TimeFormField> {
  late final TextEditingController _controller;
  late final bool _createdController;
  final _focusNode = FocusNode();

  TimeOfDay? _parseStrict(String value) {
    // Expect exactly hh:mm
    if (!RegExp(r'^\d{2}:\d{2}$').hasMatch(value)) return null;

    final parts = value.split(':');
    final hh = int.parse(parts[0]);
    final mm = int.parse(parts[1]);

    if (hh > 23) return null;
    if (mm > 59) return null;

    final tod = TimeOfDay(hour: hh, minute: mm);
    if (tod.hour != hh || tod.minute != mm) return null;

    return tod;
  }

  String? _validator(String? raw) {
    final value = (raw ?? '').trim();
    if (value.isEmpty) {
      return widget.required ? 'Hora requerida' : null;
    }

    final tod = _parseStrict(value);
    if (tod == null) return widget.validatorMessage ?? 'Ingresa una hora válida (hh:mm)';

    return null;
  }

  Future<void> _pickerHandler() async {
    final initialTime = _parseStrict(_controller.text) ?? TimeOfDay.now();

    final tod = await showTimePicker(context: context, initialTime: initialTime);
    if (tod != null) {
      final paddedH = _padNumber(tod.hour);
      final paddedM = _padNumber(tod.minute);
      _controller.text = '$paddedH:$paddedM';
    }
  }

  String _padNumber(int n) {
    return n.toString().padLeft(2, '0');
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController();
      _controller.text = widget.initialValue ?? '';
      _createdController = true;
    } else {
      _controller = widget.controller!;
      _createdController = false;
    }
    _controller.addListener(() {
      final parsed = _parseStrict(_controller.text);
      widget.onTimeSaved?.call(parsed);
    });
  }

  @override
  void dispose() {
    if (_createdController) _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final decoration = widget.decoration ?? InputDecoration();

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: decoration.copyWith(
        suffixIcon: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _pickerHandler,
            child: Icon(LucideIcons.clock, color: labelTextColor),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _DDMMYYFormatter(),
      ],
      autovalidateMode: .onUserInteraction,
      validator: _validator,
    );
  }
}

/// Formats a digit-only stream into hh:mm while typing.
/// - Accepts up to 4 digits: HHmm
/// - Produces: HH:mm
class _DDMMYYFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final limited = digits.length > 4 ? digits.substring(0, 4) : digits;

    String out = '';
    if (limited.length >= 1) out += limited.substring(0, 1);
    if (limited.length >= 2) out += limited.substring(1, 2);
    if (limited.length >= 3) out += ':' + limited.substring(2, 3);
    if (limited.length >= 4) out += limited.substring(3, 4);

    // Keep cursor at end for simplicity.
    return TextEditingValue(
      text: out,
      selection: TextSelection.collapsed(offset: out.length),
    );
  }
}

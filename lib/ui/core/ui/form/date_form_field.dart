import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.onDateSaved,
    this.validatorMessage,
    this.decoration,
    this.required = false,
  });

  final TextEditingController? controller;
  final String? initialValue; // e.g. "04/11/23"
  final ValueChanged<DateTime?>? onDateSaved;
  final String? validatorMessage;
  final InputDecoration? decoration;
  final bool required;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}


class _DateFormFieldState extends State<DateFormField> {
  late final TextEditingController _controller;
  late final bool _createdController;
  final _focusNode = FocusNode();

  int _twoDigitYearToFull(int yy) {
    final full = 2000 + yy;
    return full;
  }

  DateTime? _parseStrict(String value) {
    // Expect exactly dd/mm/aa
    if (!RegExp(r'^\d{2}/\d{2}/\d{2}$').hasMatch(value)) return null;

    final parts = value.split('/');
    final dd = int.parse(parts[0]);
    final mm = int.parse(parts[1]);
    final yy = int.parse(parts[2]);

    final fullYear = _twoDigitYearToFull(yy);

    // Strict check: DateTime will “roll over” invalid dates,
    // so we verify it matches the original components.
    final dt = DateTime(fullYear, mm, dd);
    if (dt.day != dd || dt.month != mm || dt.year != fullYear) return null;

    return dt;
  }

  String? _validator(String? raw) {
    final value = (raw ?? '').trim();
    if (value.isEmpty) {
      return widget.required ? 'Fecha requerida' : null;
    }

    final dt = _parseStrict(value);
    if (dt == null) return widget.validatorMessage ?? 'Ingresa una fecha válida (dd/mm/aa)';

    return null;
  }

  Future<void> _pickerHandler() async {
    final oneYear = const Duration(days: 365);
    final initialDate = _parseStrict(_controller.text) ?? DateTime.now();
    final earliestDate = _minDate(initialDate, DateTime.now());

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: earliestDate.subtract(oneYear),
      lastDate: earliestDate.add(oneYear),
    );
    if (date != null) {
      final paddedD = _padNumber(date.day);
      final paddedM = _padNumber(date.month);
      final paddedY = _padNumber(date.year);
      _controller.text = '$paddedD/$paddedM/$paddedY';
    }
  }

  DateTime _minDate(DateTime a, DateTime b) {
    if (a.millisecondsSinceEpoch < b.millisecondsSinceEpoch) {
      return a;
    }
    return b;
  }

  String _padNumber(int n) {
    if (n > 100) {
      final length = n.toString().length;
      final twoDigit = n.toString().substring(length - 2);
      return twoDigit;
    }
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
      widget.onDateSaved?.call(parsed);
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
            child: Icon(LucideIcons.calendar, color: labelTextColor),
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

/// Formats a digit-only stream into dd/mm/aa while typing.
/// - Accepts up to 6 digits: DDMMYY
/// - Produces: DD/MM/AA
class _DDMMYYFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final limited = digits.length > 6 ? digits.substring(0, 6) : digits;

    String out = '';
    if (limited.length >= 1) out += limited.substring(0, 1);
    if (limited.length >= 2) out += limited.substring(1, 2);
    if (limited.length >= 3) out += '/' + limited.substring(2, 3);
    if (limited.length >= 4) out += limited.substring(3, 4);
    if (limited.length >= 5) out += '/' + limited.substring(4, 5);
    if (limited.length >= 6) out += limited.substring(5, 6);

    // Keep cursor at end for simplicity.
    return TextEditingValue(
      text: out,
      selection: TextSelection.collapsed(offset: out.length),
    );
  }
}

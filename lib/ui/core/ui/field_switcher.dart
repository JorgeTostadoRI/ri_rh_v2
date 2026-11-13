import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class FieldSwitcher extends StatelessWidget {
  const FieldSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.options,
    this.expandir = false,
    this.porRenglon,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<String> options;

  /// Las opciones se reparten todo el ancho disponible, con el texto
  /// centrado (puede bajar de renglón si no cabe).
  final bool expandir;

  /// Opciones por renglón (ej. 2: cuatro opciones en dos renglones de dos),
  /// repartidas a todo el ancho como con [expandir]. Null: todas en una fila.
  final int? porRenglon;

  bool get _centrar => expandir || porRenglon != null;

  Widget option(int index, String label) {
    final selected = index == selectedIndex;

    return InkWell(
      onTap: selected ? null : () => onSelected(index),
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: _centrar ? 8 : 20),
        alignment: _centrar ? Alignment.center : null,
        decoration: BoxDecoration(
          color: selected ? Colors.white : Color(0xFFF5EDE0),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: optionTextStyle(selected),
          textAlign: _centrar ? TextAlign.center : null,
        ),
      ),
    );
  }

  TextStyle optionTextStyle(bool selected) {
    final baseColor = Color(0xFF9A7B5A);
    return TextStyle(
      fontSize: 14,
      fontWeight: .w700,
      color: selected ? primaryColor : baseColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFFF5EDE0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: porRenglon != null ? _renglones() : Row(
        spacing: 4,
        children: [
          for (final (index, label) in options.indexed)
            if (expandir)
              Expanded(child: option(index, label))
            else
              option(index, label)
        ],
      ),
    );
  }

  Widget _renglones() {
    final n = porRenglon!;
    return Column(
      spacing: 4,
      children: [
        for (var i = 0; i < options.length; i += n)
          Row(
            spacing: 4,
            children: [
              for (var j = i; j < i + n; j++)
                Expanded(child: j < options.length ? option(j, options[j]) : const SizedBox.shrink()),
            ],
          ),
      ],
    );
  }
}
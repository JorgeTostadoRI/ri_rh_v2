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

  Widget option(RhColores c, int index, String label) {
    final selected = index == selectedIndex;

    return InkWell(
      onTap: selected ? null : () => onSelected(index),
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: _centrar ? 8 : 20),
        alignment: _centrar ? Alignment.center : null,
        decoration: BoxDecoration(
          color: selected ? c.superficie : c.pista,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: optionTextStyle(c, selected),
          textAlign: _centrar ? TextAlign.center : null,
        ),
      ),
    );
  }

  TextStyle optionTextStyle(RhColores c, bool selected) {
    final baseColor = c.etiqueta;
    return TextStyle(
      fontSize: 14,
      fontWeight: .w700,
      color: selected ? primaryColor : baseColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.rh;
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: c.pista,
        borderRadius: BorderRadius.circular(16),
      ),
      child: porRenglon != null ? _renglones(c) : Row(
        spacing: 4,
        children: [
          for (final (index, label) in options.indexed)
            if (expandir)
              Expanded(child: option(c, index, label))
            else
              option(c, index, label)
        ],
      ),
    );
  }

  Widget _renglones(RhColores c) {
    final n = porRenglon!;
    return Column(
      spacing: 4,
      children: [
        for (var i = 0; i < options.length; i += n)
          Row(
            spacing: 4,
            children: [
              for (var j = i; j < i + n; j++)
                Expanded(child: j < options.length ? option(c, j, options[j]) : const SizedBox.shrink()),
            ],
          ),
      ],
    );
  }
}
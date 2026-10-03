import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

/// Envuelve una tabla dividida en dos `DataTable` -- una angosta con solo la
/// primera columna (ej. EMPLEADO), que se queda fija, y otra con el resto de
/// columnas, que se desliza horizontalmente -- para dar el efecto de
/// "columna congelada" sin depender de una libreria de tablas externa.
///
/// Ambas tablas NO deben traer su propia `decoration` (fondo/borde/radio) --
/// ese estilo lo pone este wrapper en un solo `Container` para que ambas
/// mitades se vean como una sola caja continua, sin costura entre ellas.
class FrozenColumnTableWrapper extends StatefulWidget {
  const FrozenColumnTableWrapper({
    super.key,
    required this.frozenColumn,
    required this.scrollableColumns,
  });

  final Widget frozenColumn;
  final Widget scrollableColumns;

  @override
  State<FrozenColumnTableWrapper> createState() => _FrozenColumnTableWrapperState();
}

class _FrozenColumnTableWrapperState extends State<FrozenColumnTableWrapper> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF5),
        borderRadius: BorderRadius.circular(20),
        border: Border.fromBorderSide(BorderSide(color: borderColor, width: 0.8)),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            widget.frozenColumn,
            Container(width: 0.8, color: borderColor),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: .horizontal,
                  controller: _scrollController,
                  child: widget.scrollableColumns,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

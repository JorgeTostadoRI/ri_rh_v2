import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/pending_incidencias_viewmodel.dart';

class IncidenciaFilters extends StatefulWidget {
  const IncidenciaFilters({
    super.key,
    required this.viewmodel,
  });

  final PendingIncidenciasViewmodel viewmodel;

  @override
  State<IncidenciaFilters> createState() => _IncidenciaFiltersState();
}

class _IncidenciaFiltersState extends State<IncidenciaFilters> {
  late DateTimeRange? _range;
  late List<int> _solicitores;
  late List<IncidenciaCategory> _categories; 

  final yMd = DateFormat.yMd();

  @override
  void initState() {
    super.initState();
    final query = widget.viewmodel.query;
    _range = query.startRange;
    _solicitores = query.solicitores;
    _categories = query.categories;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: BoxBorder.fromBorderSide(BorderSide(
          color: borderColor,
          width: 0.8,
        )),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        spacing: 12,
        children: [
          IconButton(
            onPressed: () async {
              final today = DateTime.now();
              final selection = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2026, 01, 01),
                lastDate: today,
              );
              if (selection == null) {
                return;
              }
              setState(() => _range = selection);
            },
            icon: Badge(
              isLabelVisible: _range != null,
              child: Icon(LucideIcons.calendar),
            ),
            tooltip: _range == null
              ? 'Todos'
              : '${yMd.format(_range!.start)} - ${yMd.format(_range!.end)}'
          ),
          IconButton(
            onPressed: () {},
            icon: Badge.count(
              count: _solicitores.length,
              isLabelVisible: _solicitores.isNotEmpty,
              child: Icon(LucideIcons.user),
            ),
            tooltip: 'Solicitor',
          ),
          IconButton(
            onPressed: () async {
              final selection = await showDialog<List<IncidenciaCategory>?>(
                context: context,
                builder: (context) => _CategoriesDialog(categories: _categories),
              );
              if (selection != null) {
                setState(() => _categories = selection);
              }
            },
            icon: Badge.count(
              count: _categories.length,
              isLabelVisible: _categories.isNotEmpty,
              child: Icon(LucideIcons.shapes),
            ),
            tooltip: 'Categorías',
          ),
          Spacer(),
          OutlinedButton(
            onPressed: clearFilters,
            child: Text('Limpiar'),
          ),
          ElevatedButton(
            onPressed: applyFilters,
            child: Text('Aplicar'),
          ),
        ],
      ),
    );
  }

  void clearFilters() {
    setState(() {
      _range = null;
      _solicitores = [];
      _categories = [];
    });
    widget.viewmodel.query = IncidenciaQuery();
    widget.viewmodel.load.execute();
  }

  void applyFilters() {
    widget.viewmodel.query = IncidenciaQuery(
      startRange: _range,
      solicitores: _solicitores,
      categories: _categories,
    );
    widget.viewmodel.load.execute();
  }
}

class _CategoriesDialog extends StatefulWidget {
  const _CategoriesDialog({
    required this.categories,
  });

  // Initial selection
  final List<IncidenciaCategory> categories;

  @override
  State<_CategoriesDialog> createState() => _CategoriesDialogState();
}

class _CategoriesDialogState extends State<_CategoriesDialog> {
  late List<IncidenciaCategory> _currentSelection;

  @override
  void initState() {
    super.initState();
    _currentSelection = widget.categories;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Categorías'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          height: 400,
          child: ListView.builder(
            itemCount: IncidenciaCategory.values.length,
            itemBuilder: (context, index) {
              final category = IncidenciaCategory.values[index];
          
              return CheckboxListTile(
                title: Text(category.label),
                value: _currentSelection.contains(category),
                onChanged: (value) {
                  if (value == true) {
                    _currentSelection.add(category);
                  }
                  else if (value == false) {
                    _currentSelection.remove(category);
                  }
                  setState(() {});
                },
                tristate: false,
              );
            },
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => setState(() => _currentSelection = []),
          child: Text('Limpiar todos'),
        ),
        ElevatedButton(
          onPressed: () => context.pop(_currentSelection),
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}
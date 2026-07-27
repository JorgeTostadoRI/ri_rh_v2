import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/base_empleado_card.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicantes_viewmodel.dart';
import 'package:ri_rh_v2/ui/practicantes/widgets/practicante_status_chip.dart';
import 'package:ri_rh_v2/utils/debouncer.dart';

class PracticantesScreen extends StatefulWidget {
  const PracticantesScreen({
    super.key,
    required this.viewmodel,
  });

  final PracticantesViewmodel viewmodel;

  @override
  State<PracticantesScreen> createState() => _PracticantesScreenState();
}

class _PracticantesScreenState extends State<PracticantesScreen> {
  late final TextEditingController _search;
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  void _performSearch() {
    _debouncer.run(() {
      if (_search.text.compareTo(widget.viewmodel.searchText) == 0) {
        return;
      }
      
      widget.viewmodel.searchText = _search.text;
      widget.viewmodel.search.execute();
    });
  }

  @override
  void initState() {
    super.initState();
    _search = TextEditingController(text: widget.viewmodel.searchText);
    _search.addListener(_performSearch);
  }

  @override
  void didUpdateWidget(covariant PracticantesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _search.removeListener(_performSearch);
    _search.addListener(_performSearch);
  }

  @override
  void dispose() {
    _search.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          spacing: 32,
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Text(
                  'Listado de Practicantes',
                  style: TextTheme.of(context).headlineLarge?.copyWith(
                    fontSize: 48,
                  ),
                ),
                Text(
                  'Gestiona y visualiza la información de todos los practicantes y residentes.',
                  style: TextTheme.of(context).titleSmall,
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.search),
                prefixIconColor: const Color(0xFFC4A47A),
              ),
              controller: _search,
            ),
            ListenableBuilder(
              listenable: widget.viewmodel.search,
              builder: (context, _) {
                if (widget.viewmodel.search.running) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (widget.viewmodel.search.error) {
                  return Center(
                    child: Column(
                      spacing: 32,
                      mainAxisSize: .min,
                      children: [
                        const Text('No se pudieron cargar los practicantes'),
                        ElevatedButton.icon(
                          onPressed: () => widget.viewmodel.search.execute(),
                          icon: Icon(LucideIcons.rotateCcw),
                          label: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.viewmodel.practicantes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 350,
                  ),
                  itemBuilder: (context, index) {
                    final practicante = widget.viewmodel.practicantes[index];
                    return BaseEmpleadoCard(
                      baseEmpleado: practicante.base,
                      statusChip: PracticanteStatusChip(status: practicante.status!),
                      onExpedientePressed: () => context.go(Routes.expedienteOfPracticante(practicante)),
                    );
                  }
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

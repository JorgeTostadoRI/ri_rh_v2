import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleados_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleado_card.dart';

class EmpleadosScreen extends StatefulWidget {
  const EmpleadosScreen({
    super.key,
    required this.viewmodel,
  });

  final EmpleadosViewmodel viewmodel;

  @override
  State<EmpleadosScreen> createState() => _EmpleadosScreenState();
}

class _EmpleadosScreenState extends State<EmpleadosScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Text(
                  'Listado de Empleados',
                  style: TextTheme.of(context).headlineLarge?.copyWith(
                    fontSize: 48,
                  ),
                ),
                Text(
                  'Gestiona y visualiza la información de todo el personal activo.',
                  style: TextTheme.of(context).titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Flex(
              direction: .horizontal,
              children: [
                Flexible(
                  flex: 7,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(LucideIcons.search),
                      prefixIconColor: const Color(0xFFC4A47A),
                    ),
                    onChanged: (value) => setState(() => _search = value),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () => widget.viewmodel.load.execute(_search),
                    child: Text('Buscar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ListenableBuilder(
              listenable: widget.viewmodel.load,
              builder: (context, _) {
                if (widget.viewmodel.load.running) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                if (widget.viewmodel.load.error) {
                  return const Center(child: Text('No se pudieron cargar los empleados'));
                }
            
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.viewmodel.empleados.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 350,
                  ),
                  itemBuilder: (context, index) {
                    return EmpleadoCard(
                      empleado: widget.viewmodel.empleados[index],
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
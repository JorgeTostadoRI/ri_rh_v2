import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/empleados_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/widgets/empleado_card.dart';

class EmpleadosScreen extends StatelessWidget {
  const EmpleadosScreen({
    super.key,
    required this.viewmodel,
  });

  final EmpleadosViewmodel viewmodel;

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
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.search),
                prefixIconColor: const Color(0xFFC4A47A),
              ),
            ),
            const SizedBox(height: 32),
            ListenableBuilder(
              listenable: viewmodel.load,
              builder: (context, _) {
                if (viewmodel.load.running) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                if (viewmodel.load.error) {
                  return const Center(child: Text('No se pudieron cargar los empleados'));
                }
            
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewmodel.empleados.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    mainAxisExtent: 310,
                  ),
                  itemBuilder: (context, index) {
                    return EmpleadoCard(
                      empleado: viewmodel.empleados[index],
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
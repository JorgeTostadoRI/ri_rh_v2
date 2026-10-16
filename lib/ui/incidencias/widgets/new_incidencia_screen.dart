import 'package:flutter/material.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/incidencia_form.dart';
import 'package:ri_rh_v2/ui/core/ui/app_back_button.dart';

class NewIncidenciaScreen extends StatefulWidget {
  const NewIncidenciaScreen({
    super.key,
    required this.category,
    required this.viewmodel,
  });

  final IncidenciaCategory category;
  final NewIncidenciaViewmodel viewmodel;

  @override
  State<NewIncidenciaScreen> createState() => _NewIncidenciaScreenState();
}

class _NewIncidenciaScreenState extends State<NewIncidenciaScreen> {
  // Capturado una sola vez: el router puede reconstruir esta ruta (ej.
  // refreshListenable de GoRouter al completarse un login por huella en
  // cualquier parte de la app), lo que nos pasaría una instancia nueva de
  // NewIncidenciaViewmodel en widget.viewmodel. Seguimos usando siempre
  // esta misma instancia para no perder lo que ya se capturo en el
  // formulario -- mismo patron que ya usa MisIncidenciasScreen.
  late final NewIncidenciaViewmodel _viewmodel;

  @override
  void initState() {
    super.initState();
    _viewmodel = widget.viewmodel;
  }

  @override
  void didUpdateWidget(covariant NewIncidenciaScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewmodel != _viewmodel) {
      // Instancia huerfana creada por la reconstruccion de la ruta: se
      // descarta de inmediato para que no se quede escuchando el sensor de
      // huella para siempre (antes de este fix, esto nunca pasaba -- cada
      // visita a "Nueva Incidencia" dejaba un listener fantasma vivo, que
      // podia terminar logueando a quien sea con cualquier huella escaneada
      // en cualquier otra pantalla de la app, ej. al enrolar un empleado
      // nuevo).
      widget.viewmodel.dispose();
    }
  }

  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewmodel,
      builder: (context, _) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    AppBackButton(),
                    Text(
                      'Nueva Incidencia - ${widget.category.label}',
                      style: TextTheme.of(context).headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                IncidenciaForm(viewmodel: _viewmodel, category: widget.category),
              ],
            ),
          ),
        );
      }
    );
  }
}

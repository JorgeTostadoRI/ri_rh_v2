import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/ui/avisos/viewmodels/avisos_viewmodel.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/aviso_form_dialog.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/avisos_calendar.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/avisos_list_view.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/collapsible_sidebar.dart';

class AvisosScreen extends StatefulWidget {
  const AvisosScreen({
    super.key,
    required this.viewmodel,
  });

  final AvisosViewmodel viewmodel;

  @override
  State<AvisosScreen> createState() => _AvisosScreenState();
}

class _AvisosScreenState extends State<AvisosScreen> {
  void _onCreate() {
    if (widget.viewmodel.create.completed) {
      widget.viewmodel.create.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se ha creado el aviso'),
        ),
      );
    }

    if (widget.viewmodel.create.error) {
      widget.viewmodel.create.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se ha podido crear el aviso, vuelva a intentarlo'),
        ),
      );
    }
  }

  void _onDelete() {
    if (widget.viewmodel.delete.completed) {
      widget.viewmodel.delete.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se ha eliminado el aviso'),
        ),
      );
    }

    if (widget.viewmodel.delete.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo eliminar el aviso'),
        ),
      );
      widget.viewmodel.delete.clearResult();
    }
  }

  @override
  void initState() {
    super.initState();
    widget.viewmodel.create.addListener(_onCreate);
    widget.viewmodel.delete.addListener(_onDelete);
  }

  @override
  void didUpdateWidget(covariant AvisosScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.create.removeListener(_onCreate);
    widget.viewmodel.create.addListener(_onCreate);
    widget.viewmodel.delete.removeListener(_onDelete);
    widget.viewmodel.delete.addListener(_onDelete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final aviso = await showDialog<Aviso>(
            context: context,
            builder: (context) => AvisoFormDialog(day: widget.viewmodel.focusedDay),
          );
          if (aviso != null) {
            widget.viewmodel.create.execute(aviso);
          }
        },
        tooltip: 'Agregar aviso',
        child: Icon(LucideIcons.plus),
      ),
      body: Row(
        crossAxisAlignment: .start,
        children: [
          CollapsibleSidebar(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: .start,
                  children: [
                    // PAGE HEADING
                    Row(
                      spacing: 12,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: borderColor,
                              width: 0.8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 1),
                                blurRadius: 3,
                              ),
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                spreadRadius: -1,
                              ),
                            ],
                          ),
                          child: Icon(
                            LucideIcons.megaphone,
                            color: primaryColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text('Gestión de Avisos', style: TextTheme.of(context).headlineLarge),
                            Text(
                              'Configura los mensajes que verán los empleados al registrar su asistencia.',
                              style: TextTheme.of(context).titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Flex(
                      direction: .horizontal,
                      crossAxisAlignment: .start,
                      spacing: 32,
                      children: [
                        Flexible(
                          flex: 1,
                          child: AvisosCalendar(viewmodel: widget.viewmodel),
                        ),
                        Flexible(
                          flex: 1,
                          fit: .tight,
                          child: AvisosListView(viewmodel: widget.viewmodel),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

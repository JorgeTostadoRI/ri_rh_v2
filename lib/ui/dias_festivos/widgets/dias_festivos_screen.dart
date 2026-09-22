import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/dias_festivos/dia_festivo.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/confirm_action_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/dias_festivos/viewmodels/dias_festivos_viewmodel.dart';
import 'package:ri_rh_v2/ui/dias_festivos/widgets/dia_festivo_form_dialog.dart';
import 'package:ri_rh_v2/utils/result.dart' as result;

class DiasFestivosScreen extends StatefulWidget {
  const DiasFestivosScreen({super.key, required this.viewmodel});

  final DiasFestivosViewmodel viewmodel;

  @override
  State<DiasFestivosScreen> createState() => _DiasFestivosScreenState();
}

class _DiasFestivosScreenState extends State<DiasFestivosScreen> {
  void _onCreate() {
    if (widget.viewmodel.create.completed) {
      widget.viewmodel.create.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Día festivo agregado, reprocesando reportes de esa fecha',
          ),
        ),
      );
    }

    if (widget.viewmodel.create.error) {
      final error = (widget.viewmodel.create.result as result.Error).error;
      widget.viewmodel.create.clearResult();

      if (error is ApiException && error.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Esa fecha ya está marcada como festiva')),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se pudo agregar el día festivo, vuelve a intentarlo',
          ),
        ),
      );
    }
  }

  void _onDelete() {
    if (widget.viewmodel.delete.completed) {
      widget.viewmodel.delete.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Día festivo eliminado, reprocesando reportes de esa fecha',
          ),
        ),
      );
    }

    if (widget.viewmodel.delete.error) {
      widget.viewmodel.delete.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo eliminar el día festivo')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    widget.viewmodel.create.addListener(_onCreate);
    widget.viewmodel.delete.addListener(_onDelete);
  }

  @override
  void dispose() {
    widget.viewmodel.create.removeListener(_onCreate);
    widget.viewmodel.delete.removeListener(_onDelete);
    super.dispose();
  }

  Future<void> _handleAdd() async {
    final diaFestivo = await showDialog<DiaFestivo>(
      context: context,
      builder: (context) => const DiaFestivoFormDialog(),
    );
    if (diaFestivo != null) {
      widget.viewmodel.create.execute(diaFestivo);
    }
  }

  Future<void> _handleDelete(DiaFestivo diaFestivo) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (context) => ConfirmActionDialog(
            content: Text(
              '¿Deseas eliminar este día festivo? La asistencia de todos los empleados para esa fecha se recalculará.',
            ),
          ),
        ) ??
        false;

    if (confirmed) {
      widget.viewmodel.delete.execute(diaFestivo.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMMd();

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: ListenableBuilder(
        listenable: widget.viewmodel,
        builder: (context, _) {
          if (!widget.viewmodel.hasPermissions) {
            return SizedBox.shrink();
          }

          return FloatingActionButton(
            onPressed: _handleAdd,
            tooltip: 'Agregar día festivo',
            child: Icon(LucideIcons.plus),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            spacing: 32,
            crossAxisAlignment: .start,
            children: [
              PageHeader(
                title: 'Días Festivos',
                subtitle:
                    'Marca fechas en las que ningún empleado debía trabajar.',
              ),
              ListenableBuilder(
                listenable: Listenable.merge([
                  widget.viewmodel,
                  widget.viewmodel.load,
                ]),
                builder: (context, _) {
                  if (widget.viewmodel.load.running) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (widget.viewmodel.load.error) {
                    return Center(
                      child: Column(
                        spacing: 16,
                        mainAxisSize: .min,
                        children: [
                          Text('No se pudieron cargar los días festivos'),
                          ElevatedButton.icon(
                            onPressed: () => widget.viewmodel.load.execute(),
                            icon: Icon(LucideIcons.rotateCcw),
                            label: Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }

                  final diasFestivos = widget.viewmodel.diasFestivos;
                  if (diasFestivos.isEmpty) {
                    return Center(
                      child: Column(
                        spacing: 24,
                        children: [
                          Icon(
                            LucideIcons.calendarOff,
                            size: 60,
                            color: primaryColor,
                          ),
                          Text(
                            'No hay días festivos marcados',
                            style: TextTheme.of(context).headlineSmall,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: diasFestivos.length,
                    separatorBuilder: (context, _) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final diaFestivo = diasFestivos[index];
                      return ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: Icon(
                          LucideIcons.calendarOff,
                          color: primaryColor,
                        ),
                        title: Text(
                          dateFormat.format(diaFestivo.fecha),
                          style: TextTheme.of(context).headlineSmall,
                        ),
                        subtitle: diaFestivo.nombre.isEmpty
                            ? null
                            : Text(diaFestivo.nombre),
                        trailing: widget.viewmodel.hasPermissions
                            ? IconButton(
                                icon: Icon(
                                  LucideIcons.trash2,
                                  color: errorColor,
                                ),
                                onPressed: () => _handleDelete(diaFestivo),
                              )
                            : null,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

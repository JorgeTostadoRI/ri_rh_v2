import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/ui/avisos/viewmodels/avisos_viewmodel.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/aviso_form_dialog.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/box_container.dart';
import 'package:ri_rh_v2/ui/core/ui/hoverable.dart';

class AvisosListView extends StatelessWidget {
  const AvisosListView({
    super.key,
    required this.viewmodel,
  });

  final AvisosViewmodel viewmodel;

  String formatAvisosAmountText(int amount) {
    if (amount == 0) {
      return 'No hay avisos programados';
    } else if (amount == 1) {
      return '1 aviso programado';
    } else {
      return '$amount avisos programados';
    }
  }

  void _onUpdateHandler(Aviso aviso) {
    viewmodel.edit.execute(aviso);
  }

  void _onDeleteHandler(int id) {
    viewmodel.delete.execute(id);
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat("d 'de' MMMM");
    return BoxContainer(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ListenableBuilder(
            listenable: viewmodel,
            builder: (context, _) {
              return Text(
                'Avisos para el ${formatter.format(viewmodel.focusedDay)}',
                style: TextStyle(
                  color: headingTextColor,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: .w700,
                  height: 1.4,
                ),
              );
            }
          ),
          ListenableBuilder(
            listenable: viewmodel.load,
            builder: (context, _) {
              if (viewmodel.load.running) {
                return Text(
                  'Cargando avisos...',
                  style: TextTheme.of(context).titleSmall,
                );
              }

              if (viewmodel.load.error) {
                return Text(
                  'No se han podido cargar los avisos',
                  style: TextTheme.of(context).titleSmall,
                );
              }

              return Text(
                formatAvisosAmountText(viewmodel.avisos.length),
                style: TextTheme.of(context).titleSmall,
              );
            }
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 300,
            child: ListenableBuilder(
              listenable: viewmodel,
              builder: (context, _) {
                if (viewmodel.load.running) {
                  return Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }

                if (viewmodel.load.error) {
                  return Center(
                    child: ElevatedButton.icon(
                      onPressed: () => viewmodel.load.execute(viewmodel.focusedDay),
                      icon: Icon(LucideIcons.rotateCcw),
                      label: Text('Reintentar'),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: viewmodel.avisos.length,
                  itemBuilder: (context, index) {
                    final aviso = viewmodel.avisos[index];
                    if (index == 0) {
                      return AvisoCard(
                        aviso: aviso,
                        onUpdate: _onUpdateHandler,
                        onDelete: _onDeleteHandler,
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: AvisoCard(
                        aviso: aviso,
                        onUpdate: _onUpdateHandler,
                        onDelete: _onDeleteHandler,
                      ),
                    );
                  }
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class AvisoCard extends StatefulWidget {
  const AvisoCard({
    super.key,
    required this.aviso,
    required this.onUpdate,
    required this.onDelete,
  });

  final Aviso aviso;
  final void Function(Aviso aviso) onUpdate;
  final void Function(int id) onDelete;

  @override
  State<AvisoCard> createState() => _AvisoCardState();
}

class _AvisoCardState extends State<AvisoCard> {
  bool _hovering = false;
  
  Color get _bgColor => _hovering ? Colors.white : const Color(0xFFFDF6EE);

  @override
  Widget build(BuildContext context) {
    return Hoverable(
      onHover: (isHovering) => setState(() => _hovering = isHovering),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: borderColor,
            width: 0.8,
          ),
        ),
        child: Column(
          spacing: 16,
          children: [
            Row(
              crossAxisAlignment: .start,
              spacing: 16,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.aviso.content,
                    style: TextStyle(
                      color: headingTextColor,
                      fontSize: 14,
                      fontWeight: .w700,
                      height: 1.625,
                      overflow: .ellipsis,
                    ),
                  ),
                ),
                if (_hovering) ...[
                  IconButton(
                    iconSize: 16,
                    tooltip: 'Editar',
                    onPressed: () async {
                      final updatedAviso = await showDialog<Aviso>(
                        context: context,
                        builder: (context) {
                          return AvisoFormDialog(
                            aviso: widget.aviso,
                            day: widget.aviso.showAt,
                          );
                        }
                      );
                      if (updatedAviso != null) {
                        widget.onUpdate(updatedAviso);
                      }
                    },
                    icon: Icon(LucideIcons.pen),
                  ),
                  IconButton(
                    iconSize: 16,
                    tooltip: 'Eliminar',
                    onPressed: () => widget.onDelete(widget.aviso.id!),
                    icon: Icon(LucideIcons.trash),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
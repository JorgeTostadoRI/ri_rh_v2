import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/ui/avisos/viewmodels/avisos_viewmodel.dart';
import 'package:ri_rh_v2/ui/avisos/widgets/aviso_card.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/box_container.dart';

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

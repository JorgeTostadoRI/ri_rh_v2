import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/avisos/viewmodels/avisos_viewmodel.dart';
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
              listenable: viewmodel.load,
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
                      return AvisoCard(content: aviso.content);
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: AvisoCard(content: aviso.content),
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

class AvisoCard extends StatelessWidget {
  const AvisoCard({
    super.key,
    required this.content,
    this.attachment,
  });

  final String content;
  final String? attachment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFFDF6EE),
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
              Text(
                content,
                style: TextStyle(
                  color: headingTextColor,
                  fontSize: 14,
                  fontWeight: .w700,
                  height: 1.625,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
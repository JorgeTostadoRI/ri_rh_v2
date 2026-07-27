import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/app_back_button.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/practicante_expediente_viewmodel.dart';

class PracticanteExpedienteScreen extends StatefulWidget {
  const PracticanteExpedienteScreen({
    super.key,
    required this.viewmodel,
  });

  final PracticanteExpedienteViewmodel viewmodel;

  @override
  State<PracticanteExpedienteScreen> createState() => _PracticanteExpedienteScreenState();
}

class _PracticanteExpedienteScreenState extends State<PracticanteExpedienteScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            if (widget.viewmodel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewmodel.load.error) {
              return Center(
                child: Column(
                  children: [
                    Text(widget.viewmodel.load.result.toString()),
                    ElevatedButton(
                      onPressed: () => widget.viewmodel.load.execute(),
                      child: Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }

            final practicante = widget.viewmodel.practicante;
            return Column(
              mainAxisSize: .min,
              mainAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      spacing: 16,
                      mainAxisSize: .min,
                      children: [
                        AppBackButton(),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text('Expediente Digital', style: TextTheme.of(context).headlineLarge?.copyWith(fontSize: 48)),
                            Text(practicante.base.nombre, style: TextTheme.of(context).titleSmall),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .stretch,
                        mainAxisSize: .min,
                        children: [
                          _DataCard(
                            icon: LucideIcons.user,
                            title: 'Datos Generales',
                          ),
                          _DataCard(
                            icon: LucideIcons.briefcase,
                            title: 'Datos Laborales',
                          ),
                          _DataCard(
                            icon: LucideIcons.phone,
                            title: 'Contacto y Dirección',
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(

                        crossAxisAlignment: .stretch,
                        children: [
                          _DataCard(
                            icon: LucideIcons.fingerprintPattern,
                            title: 'Huellas',
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.go(Routes.huellasOfPracticante(practicante));
                                },
                                child: Text('Ver')
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class _DataCard extends StatelessWidget {
  const _DataCard({
    required this.icon,
    required this.title,
    this.children = const <Widget>[],
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          spacing: 24,
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            Row(
              spacing: 12,
              children: [
                _IconContainer(icon: icon),
                Text(
                  title,
                  style: TextTheme.of(context).headlineSmall?.copyWith(fontWeight: .w700),
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        color: primaryColor,
        size: 20,
      ),
    );
  }
}
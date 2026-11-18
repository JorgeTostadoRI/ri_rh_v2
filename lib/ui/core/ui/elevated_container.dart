import 'package:flutter/material.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

class ElevatedContainer extends StatelessWidget {
  const ElevatedContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.rh.superficie,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.fromBorderSide(BorderSide(
          color: context.rh.borde,
          width: 0.8,
        )),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 48,
            color: Color.fromARGB(25, 232, 123, 30),
          ),
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 12,
            color: Color.fromARGB(15, 232, 123, 30),
          ),
        ],
      ),
      // En celular el margen interno de 40 se come demasiado ancho.
      padding: EdgeInsets.all(esNavegadorMovil ? 20 : 40),
      child: child,
    );
  }
}
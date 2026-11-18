import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/pantalla_completa_viewmodel.dart';

/// Al entrar a pantalla completa (app de Windows) avisa unos segundos cómo
/// salir: no hay botón ni barra de título con la X.
class AvisoPantallaCompleta extends StatefulWidget {
  const AvisoPantallaCompleta({super.key, required this.child});

  final Widget child;

  static const mensaje = 'Pulsa F11 o Esc para salir de pantalla completa';

  @override
  State<AvisoPantallaCompleta> createState() => _AvisoPantallaCompletaState();
}

class _AvisoPantallaCompletaState extends State<AvisoPantallaCompleta> {
  PantallaCompletaViewmodel? _pantalla;
  bool _estabaActiva = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final pantalla = context.read<PantallaCompletaViewmodel?>();
    if (pantalla == _pantalla) return;
    _pantalla?.removeListener(_cambio);
    _pantalla = pantalla?..addListener(_cambio);
    _estabaActiva = pantalla?.activa ?? false;
  }

  void _cambio() {
    final activa = _pantalla!.activa;
    if (activa && !_estabaActiva) {
      ScaffoldMessenger.maybeOf(context)
        ?..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text(AvisoPantallaCompleta.mensaje),
          duration: Duration(seconds: 4),
        ));
    }
    _estabaActiva = activa;
  }

  @override
  void dispose() {
    _pantalla?.removeListener(_cambio);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

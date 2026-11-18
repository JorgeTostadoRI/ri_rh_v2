import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/pantalla_completa_viewmodel.dart';

/// En pantalla completa (app de Windows) Windows quita la barra de título.
/// Esta es una copia de esa barra que baja al acercar el mouse a la esquina
/// de arriba a la derecha (donde normalmente están los botones de cerrar) y
/// se esconde sola al alejarlo. Va encima del contenido, sin moverlo.
///
/// Fuera de pantalla completa (y en web) no existe.
class BarraTituloPantallaCompleta extends StatefulWidget {
  const BarraTituloPantallaCompleta({super.key, required this.child});

  final Widget child;

  static const alto = 32.0;
  static const anchoBoton = 46.0;

  /// Esquina donde hay que acercar el mouse: el ancho de los 3 botones.
  static const zonaAncho = anchoBoton * 3;
  static const zonaAlto = 8.0;

  @override
  State<BarraTituloPantallaCompleta> createState() => _BarraTituloPantallaCompletaState();
}

class _BarraTituloPantallaCompletaState extends State<BarraTituloPantallaCompleta> {
  static const _esperaAlSalir = Duration(seconds: 1);
  static const _esperaSinEntrar = Duration(seconds: 2);

  // La barra vive en su propio Overlay para que los botones tengan tooltip
  // (aquí todavía no existe el Overlay de las pantallas).
  late final _entrada = OverlayEntry(builder: _construirBarra);
  final _visible = ValueNotifier(false);
  final _titulo = ValueNotifier('');
  PantallaCompletaViewmodel? _pantalla;
  Timer? _ocultar;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final pantalla = context.read<PantallaCompletaViewmodel?>();
    if (pantalla == _pantalla) return;
    _pantalla?.removeListener(_cambioPantalla);
    _pantalla = pantalla?..addListener(_cambioPantalla);
    if (pantalla != null && pantalla.disponible) _leerTitulo(pantalla);
  }

  Future<void> _leerTitulo(PantallaCompletaViewmodel pantalla) async {
    try {
      final titulo = await pantalla.ventana.titulo();
      if (mounted) _titulo.value = titulo;
    } catch (_) {}
  }

  /// Al salir de pantalla completa la barra se va con ella.
  void _cambioPantalla() {
    if (_pantalla?.activa ?? false) return;
    _ocultar?.cancel();
    _visible.value = false;
  }

  void _mostrar() {
    _programarOcultar(_esperaSinEntrar);
    _visible.value = true;
  }

  void _programarOcultar(Duration espera) {
    _ocultar?.cancel();
    _ocultar = Timer(espera, () => _visible.value = false);
  }

  @override
  void dispose() {
    _ocultar?.cancel();
    _pantalla?.removeListener(_cambioPantalla);
    _visible.dispose();
    _titulo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        // Fuera de la barra y de la esquina deja pasar los clics al contenido.
        Positioned.fill(child: Overlay(initialEntries: [_entrada])),
      ],
    );
  }

  Widget _construirBarra(BuildContext context) {
    final pantalla = _pantalla;
    if (pantalla == null) return const SizedBox.shrink();

    return ListenableBuilder(
      listenable: Listenable.merge([pantalla, _visible, _titulo]),
      builder: (context, _) {
        if (!pantalla.activa) return const SizedBox.shrink();
        final visible = _visible.value;

        return Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              width: BarraTituloPantallaCompleta.zonaAncho,
              height: BarraTituloPantallaCompleta.zonaAlto,
              child: MouseRegion(
                key: const Key('zonaBarraTitulo'),
                onEnter: (_) => _mostrar(),
                child: const SizedBox.expand(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: BarraTituloPantallaCompleta.alto,
              child: IgnorePointer(
                ignoring: !visible,
                child: AnimatedSlide(
                  offset: visible ? Offset.zero : const Offset(0, -1),
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  child: MouseRegion(
                    onEnter: (_) => _ocultar?.cancel(),
                    onExit: (_) => _programarOcultar(_esperaAlSalir),
                    child: _Barra(
                      oscuro: MediaQuery.platformBrightnessOf(context) == Brightness.dark,
                      titulo: _titulo.value,
                      onMinimizar: pantalla.ventana.minimizar,
                      onSalir: () => pantalla.cambiar(false),
                      onCerrar: pantalla.ventana.cerrar,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Se ve como la barra de título de Windows: ícono, título y los botones de
/// minimizar / salir de pantalla completa / cerrar (rojo al pasar el mouse).
class _Barra extends StatelessWidget {
  const _Barra({
    required this.oscuro,
    required this.titulo,
    required this.onMinimizar,
    required this.onSalir,
    required this.onCerrar,
  });

  final bool oscuro;
  final String titulo;
  final VoidCallback onMinimizar;
  final VoidCallback onSalir;
  final VoidCallback onCerrar;

  @override
  Widget build(BuildContext context) {
    return Material(
      key: const Key('barraTitulo'),
      color: oscuro ? const Color(0xFF202020) : Colors.white,
      elevation: 2,
      child: Row(
        children: [
          const SizedBox(width: 12),
          Image.asset('assets/icons/app_icon.png', width: 16, height: 16),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontFamily: 'Segoe UI', fontSize: 12, color: oscuro ? Colors.white : Colors.black),
            ),
          ),
          _BotonVentana(icono: '', tooltip: 'Minimizar', oscuro: oscuro, onPressed: onMinimizar),
          _BotonVentana(icono: '', tooltip: 'Salir de pantalla completa', oscuro: oscuro, onPressed: onSalir),
          _BotonVentana(icono: '', tooltip: 'Cerrar', oscuro: oscuro, onPressed: onCerrar, esCerrar: true),
        ],
      ),
    );
  }
}

class _BotonVentana extends StatefulWidget {
  const _BotonVentana({
    required this.icono,
    required this.tooltip,
    required this.oscuro,
    required this.onPressed,
    this.esCerrar = false,
  });

  /// Carácter de la letra de íconos de Windows (Segoe Fluent Icons en
  /// Windows 11, Segoe MDL2 Assets en Windows 10).
  final String icono;
  final String tooltip;
  final bool oscuro;
  final VoidCallback onPressed;
  final bool esCerrar;

  @override
  State<_BotonVentana> createState() => _BotonVentanaState();
}

class _BotonVentanaState extends State<_BotonVentana> {
  bool _encima = false;
  bool _presionado = false;

  // Colores de los botones de la barra de título de Windows 11.
  Color get _fondo {
    if (widget.esCerrar) {
      if (_presionado) return const Color(0xFFC83F31);
      return _encima ? const Color(0xFFC42B1C) : Colors.transparent;
    }
    if (_presionado) return widget.oscuro ? const Color(0xFF292929) : const Color(0xFFCCCCCC);
    if (_encima) return widget.oscuro ? const Color(0xFF2D2D2D) : const Color(0xFFE5E5E5);
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final blanco = widget.oscuro || (widget.esCerrar && (_encima || _presionado));

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _encima = true),
        onExit: (_) => setState(() => _encima = _presionado = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _presionado = true),
          onTapCancel: () => setState(() => _presionado = false),
          onTap: () {
            setState(() => _presionado = false);
            widget.onPressed();
          },
          child: Container(
            width: BarraTituloPantallaCompleta.anchoBoton,
            height: BarraTituloPantallaCompleta.alto,
            color: _fondo,
            alignment: Alignment.center,
            child: Text(
              widget.icono,
              style: TextStyle(
                fontFamily: 'Segoe Fluent Icons',
                fontFamilyFallback: const ['Segoe MDL2 Assets'],
                fontSize: 10,
                color: blanco ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Colores de RH por su uso (fondo, tarjeta, texto...), en versión clara y
/// oscura. Las pantallas los toman con `context.rh` en lugar de escribir el
/// color fijo, así cambian solos con el tema.
///
/// [RhColores.claro] tiene exactamente los colores de siempre: migrar una
/// pantalla a estos colores no debe cambiar ni un pixel en tema claro.
@immutable
class RhColores extends ThemeExtension<RhColores> {
  const RhColores({
    required this.esOscuro,
    required this.primario,
    required this.fondo,
    required this.superficie,
    required this.titulo,
    required this.etiqueta,
    required this.etiquetaSuave,
    required this.borde,
    required this.bordeAcento,
    required this.relleno,
    required this.exito,
    required this.error,
    required this.exitoFondo,
    required this.avisoFondo,
    required this.falloFondo,
    required this.exitoTexto,
    required this.avisoTexto,
    required this.falloTexto,
    required this.pista,
    required this.acentoSuave,
    required this.superficieAlterna,
    required this.errorFondo,
    required this.inactivo,
    required this.exitoSuave,
    required this.exitoFuerte,
    required this.superficieTenue,
  });

  final bool esOscuro;

  /// Naranja de RH: botones principales, íconos, opción seleccionada.
  final Color primario;

  /// Fondo detrás de todo el contenido (crema en claro).
  final Color fondo;

  /// Tarjetas, menú lateral, ventanas (blanco en claro).
  final Color superficie;

  /// Títulos y texto principal.
  final Color titulo;

  /// Texto secundario y etiquetas (café claro).
  final Color etiqueta;

  /// Etiquetas de los campos de captura.
  final Color etiquetaSuave;

  /// Bordes y líneas divisorias.
  final Color borde;

  /// Borde con un poco de naranja (p. ej. el botón de colapsar el menú).
  final Color bordeAcento;

  /// Relleno de los campos de captura.
  final Color relleno;

  final Color exito;
  final Color error;

  /// Etiquetas de estado (aprobada, pendiente, rechazada...).
  final Color exitoFondo;
  final Color avisoFondo;
  final Color falloFondo;
  final Color exitoTexto;
  final Color avisoTexto;
  final Color falloTexto;

  /// Fondo de los selectores de pestañas (la opción elegida va en [superficie]).
  final Color pista;

  /// Fondo naranja muy suave detrás de íconos.
  final Color acentoSuave;

  /// Fondo de tablas (un poco distinto de [superficie]).
  final Color superficieAlterna;

  /// Fondo de avisos de error dentro de ventanas.
  final Color errorFondo;

  /// Pasos pendientes de la línea de pasos.
  final Color inactivo;

  /// Recuadros de "documento subido" / "listo": fondo verde muy suave y su
  /// texto verde fuerte.
  final Color exitoSuave;
  final Color exitoFuerte;

  /// Recuadros de "pendiente" (crema tenue).
  final Color superficieTenue;

  static const claro = RhColores(
    esOscuro: false,
    primario: Color(0xFFE87B1E),
    fondo: Color(0xFFFFF0DC),
    superficie: Colors.white,
    titulo: Color(0xFF2D1E0F),
    etiqueta: Color(0xFF9A7B5A),
    etiquetaSuave: Color(0xFFC4A47A),
    borde: Color(0xFFF5E8D8),
    bordeAcento: Color(0xFFFDDEB0),
    relleno: Color(0xFFFDFBF7),
    exito: Color(0xFF52C41A),
    error: Color(0xFFDB4444),
    exitoFondo: Color(0xFFDCFCE7),
    avisoFondo: Color(0xFFFFEDD4),
    falloFondo: Color(0xFFFFE2E2),
    exitoTexto: Color(0xFF00A63E),
    avisoTexto: Color(0xFFF54900),
    falloTexto: Color(0xFFE7000B),
    pista: Color(0xFFF5EDE0),
    acentoSuave: Color(0xFFFFF7ED),
    superficieAlterna: Color(0xFFFFFAF5),
    errorFondo: Color(0xFFFDEBEB),
    inactivo: Color(0xFFE0E0E0), // Colors.grey[300]
    exitoSuave: Color(0xFFF0FDF4),
    exitoFuerte: Color(0xFF008236),
    superficieTenue: Color(0xFFFDF6EE),
  );

  /// Cálido: cafés muy oscuros, letra crema y el mismo naranja de RH.
  static const oscuro = RhColores(
    esOscuro: true,
    primario: Color(0xFFE87B1E),
    fondo: Color(0xFF17110B),
    superficie: Color(0xFF221A12),
    titulo: Color(0xFFF6EBDD),
    etiqueta: Color(0xFFC9AA86),
    etiquetaSuave: Color(0xFFA88A66),
    borde: Color(0xFF3A2C1F),
    bordeAcento: Color(0xFF5A3F22),
    relleno: Color(0xFF1C150E),
    exito: Color(0xFF6BD03A),
    error: Color(0xFFF06A6A),
    exitoFondo: Color(0xFF16301F),
    avisoFondo: Color(0xFF3A2312),
    falloFondo: Color(0xFF3B1A1A),
    exitoTexto: Color(0xFF5BD68A),
    avisoTexto: Color(0xFFFF9254),
    falloTexto: Color(0xFFFF7070),
    pista: Color(0xFF2E2318),
    acentoSuave: Color(0xFF3A2614),
    superficieAlterna: Color(0xFF1E160F),
    errorFondo: Color(0xFF3B1A1A),
    inactivo: Color(0xFF4A3C2E),
    exitoSuave: Color(0xFF12291A),
    exitoFuerte: Color(0xFF5BD68A),
    superficieTenue: Color(0xFF1E160F),
  );

  /// Para un color de una sola pantalla que no vale la pena agregar a la
  /// paleta: [claro] en tema claro (el de siempre) y [oscuro] en modo oscuro.
  Color segun({required Color claro, required Color oscuro}) => esOscuro ? oscuro : claro;

  /// Fondo pastel detrás de un ícono de color (p. ej. las categorías de
  /// incidencias): en claro, [claro] tal cual; en oscuro, un poco de [acento]
  /// sobre la superficie.
  Color tinte(Color claro, Color acento) =>
      esOscuro ? Color.alphaBlend(acento.withAlpha(0x38), superficie) : claro;

  @override
  RhColores copyWith({
    bool? esOscuro,
    Color? primario,
    Color? fondo,
    Color? superficie,
    Color? titulo,
    Color? etiqueta,
    Color? etiquetaSuave,
    Color? borde,
    Color? bordeAcento,
    Color? relleno,
    Color? exito,
    Color? error,
    Color? exitoFondo,
    Color? avisoFondo,
    Color? falloFondo,
    Color? exitoTexto,
    Color? avisoTexto,
    Color? falloTexto,
    Color? pista,
    Color? acentoSuave,
    Color? superficieAlterna,
    Color? errorFondo,
    Color? inactivo,
    Color? exitoSuave,
    Color? exitoFuerte,
    Color? superficieTenue,
  }) {
    return RhColores(
      esOscuro: esOscuro ?? this.esOscuro,
      primario: primario ?? this.primario,
      fondo: fondo ?? this.fondo,
      superficie: superficie ?? this.superficie,
      titulo: titulo ?? this.titulo,
      etiqueta: etiqueta ?? this.etiqueta,
      etiquetaSuave: etiquetaSuave ?? this.etiquetaSuave,
      borde: borde ?? this.borde,
      bordeAcento: bordeAcento ?? this.bordeAcento,
      relleno: relleno ?? this.relleno,
      exito: exito ?? this.exito,
      error: error ?? this.error,
      exitoFondo: exitoFondo ?? this.exitoFondo,
      avisoFondo: avisoFondo ?? this.avisoFondo,
      falloFondo: falloFondo ?? this.falloFondo,
      exitoTexto: exitoTexto ?? this.exitoTexto,
      avisoTexto: avisoTexto ?? this.avisoTexto,
      falloTexto: falloTexto ?? this.falloTexto,
      pista: pista ?? this.pista,
      acentoSuave: acentoSuave ?? this.acentoSuave,
      superficieAlterna: superficieAlterna ?? this.superficieAlterna,
      errorFondo: errorFondo ?? this.errorFondo,
      inactivo: inactivo ?? this.inactivo,
      exitoSuave: exitoSuave ?? this.exitoSuave,
      exitoFuerte: exitoFuerte ?? this.exitoFuerte,
      superficieTenue: superficieTenue ?? this.superficieTenue,
    );
  }

  @override
  RhColores lerp(RhColores? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return RhColores(
      esOscuro: t < 0.5 ? esOscuro : other.esOscuro,
      primario: l(primario, other.primario),
      fondo: l(fondo, other.fondo),
      superficie: l(superficie, other.superficie),
      titulo: l(titulo, other.titulo),
      etiqueta: l(etiqueta, other.etiqueta),
      etiquetaSuave: l(etiquetaSuave, other.etiquetaSuave),
      borde: l(borde, other.borde),
      bordeAcento: l(bordeAcento, other.bordeAcento),
      relleno: l(relleno, other.relleno),
      exito: l(exito, other.exito),
      error: l(error, other.error),
      exitoFondo: l(exitoFondo, other.exitoFondo),
      avisoFondo: l(avisoFondo, other.avisoFondo),
      falloFondo: l(falloFondo, other.falloFondo),
      exitoTexto: l(exitoTexto, other.exitoTexto),
      avisoTexto: l(avisoTexto, other.avisoTexto),
      falloTexto: l(falloTexto, other.falloTexto),
      pista: l(pista, other.pista),
      acentoSuave: l(acentoSuave, other.acentoSuave),
      superficieAlterna: l(superficieAlterna, other.superficieAlterna),
      errorFondo: l(errorFondo, other.errorFondo),
      inactivo: l(inactivo, other.inactivo),
      exitoSuave: l(exitoSuave, other.exitoSuave),
      exitoFuerte: l(exitoFuerte, other.exitoFuerte),
      superficieTenue: l(superficieTenue, other.superficieTenue),
    );
  }
}

extension RhColoresDelTema on BuildContext {
  /// Colores de RH del tema actual. Si no hay tema de RH (algunas pruebas),
  /// usa los de tema claro.
  RhColores get rh => Theme.of(this).extension<RhColores>() ?? RhColores.claro;
}

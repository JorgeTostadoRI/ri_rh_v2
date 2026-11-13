import 'package:flutter/foundation.dart';

/// `true` solo cuando la app corre en el navegador de un teléfono Android o
/// iPhone. Ahí se usa el acomodo móvil; en la web de computadora (cualquier
/// tamaño de ventana) y en la app de Windows siempre es `false`, así que esas
/// versiones se quedan exactamente como están.
///
/// Notas: Safari de iPad se presenta como Mac (ve la versión de computadora) y
/// "Sitio de escritorio" en el celular también muestra la de computadora.
bool get esNavegadorMovil =>
    debugNavegadorMovil ??
    esNavegadorMovilPara(esWeb: kIsWeb, plataforma: defaultTargetPlatform);

/// Solo para pruebas: en `flutter test` nunca es web, así que esto permite
/// ver las pantallas con el acomodo móvil. Siempre regresarlo a `null`.
@visibleForTesting
bool? debugNavegadorMovil;

@visibleForTesting
bool esNavegadorMovilPara({required bool esWeb, required TargetPlatform plataforma}) =>
    esWeb && (plataforma == TargetPlatform.android || plataforma == TargetPlatform.iOS);

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/data/repositories/notificaciones/compras_notificaciones_repository.dart';
import 'package:ri_rh_v2/domain/models/notificaciones/aviso_compra.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Avisos de requisiciones y órdenes de compra para la campanita de RH v2.
class ComprasNotificacionesViewmodel extends ChangeNotifier {
  ComprasNotificacionesViewmodel({
    required this._repository,
  }) {
    load();
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => load(),
    );
  }

  final ComprasNotificacionesRepository _repository;
  Timer? _timer;

  bool _loading = false;
  int _noLeidas = 0;
  List<AvisoCompra> _avisos = const [];

  bool get isLoading => _loading;
  int get noLeidas => _noLeidas;
  List<AvisoCompra> get avisos => _avisos;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> load() async {
    if (_loading) return;
    _loading = true;
    notifyListeners();

    final result = await _repository.getResumen();
    switch (result) {
      case Ok(value: final resumen):
        _noLeidas = resumen.noLeidas;
        _avisos = resumen.avisos;
      case Error():
        // Se conserva el último estado conocido.
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> marcarLeida(AvisoCompra aviso) async {
    final result = await _repository.marcarLeida(aviso.id);
    if (result is Ok) {
      _avisos = _avisos.where((item) => item.id != aviso.id).toList();
      if (_noLeidas > 0) _noLeidas--;
      notifyListeners();
    }
  }
}

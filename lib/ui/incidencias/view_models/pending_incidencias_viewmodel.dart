import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/auth/auth_repository.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/data/repositories/users/users_repository.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/query/incidencia/incidencia_query.dart';
import 'package:ri_rh_v2/domain/models/query/user/user_query.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';
import 'package:url_launcher/url_launcher.dart';

typedef RejectParams = ({Incidencia incidencia, String rejectionReason});
typedef SolicitorOption = ({int id, String name});
typedef DownloadParams = ({Incidencia incidencia, bool force});

class PendingIncidenciasViewmodel extends ChangeNotifier {
  final AppLogger _log;
  final AuthRepository _authRepository;
  final IncidenciasRepository _incidenciasRepository;
  final UsersRepository _usersRepository;
  
  PendingIncidenciasViewmodel({
    required this._log,
    required this._authRepository,
    required this._incidenciasRepository,
    required this._usersRepository,
  }) {
    _query = IncidenciaQuery();

    load = Command0(_load)..execute();
    approve = Command1(_approve);
    reject = Command1(_reject);
    download = Command1(_download);
  }

  late final Command0 load;
  late final Command1<void, Incidencia> approve;
  late final Command1<void, RejectParams> reject;
  late final Command1<void, DownloadParams> download;

  // FIXME: when hot reloading, resets to 0 instead of keeping the tab index
  int selection = 0;

  List<Incidencia>? _pendingToReview;
  List<Incidencia>? get pendingToReview => _pendingToReview;

  List<Incidencia>? _historial;
  List<Incidencia>? get historial => _historial;

  List<User> _users = [];
  List<User> get users => _users;
  bool _cachedUsers = false;

  late IncidenciaQuery _query;
  IncidenciaQuery get query => _query;
  set query(IncidenciaQuery incidenciaQuery) {
    _query = incidenciaQuery;
    notifyListeners();
  }

  Future<Result<void>> _load() async {
    final currentUser = _authRepository.getCurrentUser();
    if (currentUser == null) {
      return Result.error(Exception('Not authenticated'));
    }

    _getUsers();

    switch (selection) {
      case 0:
        _log.info('Loading incidencias to review');
        final result = await _loadToReview();
        notifyListeners();
        return result;
      case 1:
        _log.info('Loading incidencias historic');
        final result = await _loadHistoric();
        notifyListeners();
        return result;
      default:
        return Result.error(Exception('Invalid selection for loading incidencias'));
    }
  }

  Future<Result<void>> _approve(Incidencia incidencia) async {
    final resultApproval = await _incidenciasRepository.approveIncidencia(incidencia);
    switch (resultApproval) {
      case Error():
        _log.warning('Failed to approve ${incidencia.category.id} #${incidencia.id}', error: resultApproval.error);
        return Result.error(resultApproval.error);
      case Ok():
    }

    _pendingToReview!.remove(incidencia);
    if (const [IncidenciaState.approved, IncidenciaState.rejected].contains(resultApproval.value.state)) {
      _historial?.add(resultApproval.value);
    } else {
      final isRH = await _authRepository.isRH;
      if (isRH) {
        _pendingToReview!.add(resultApproval.value);
      }
    }
    notifyListeners();
    return Result.ok(null);
  }

  Future<Result<void>> _reject(RejectParams params) async {
    final incidencia = params.incidencia;
    final rejectionReason = params.rejectionReason;

    final incidenciaWithRejection = incidencia.copyWith(
      rejectionReason: rejectionReason,
    );
    final resultReject = await _incidenciasRepository.rejectIncidencia(incidenciaWithRejection);
    switch (resultReject) {
      case Error():
        _log.warning('Failed to reject ${incidencia.category.id} #${incidencia.id}', error: resultReject.error);
        return Result.error(resultReject.error);
      case Ok():
    }

    _pendingToReview!.remove(incidencia);
    if (const [IncidenciaState.approved, IncidenciaState.rejected].contains(resultReject.value.state)) {
      _historial?.add(resultReject.value);
    }
    notifyListeners();
    return Result.ok(null);
  }

  Future<Result<void>> _loadToReview() async {
    try {
      final query = _query.copyWith(state: const [IncidenciaState.pending]);
      _log.debug(query.toString());
      final resultIncidencias = await _incidenciasRepository.getIncidenciasToReview(query: query);

      switch (resultIncidencias) {
        case Error():
          _log.warning('Failed to fetch incidencias', error: resultIncidencias.error);
          return Result.error(resultIncidencias.error);
        case Ok():
      }
      _pendingToReview = resultIncidencias.value;
      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('Failed to load incidencias to review', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }

  Future<Result<void>> _loadHistoric() async {
    try {
      final query = _query.copyWith(
        state: const [IncidenciaState.approved, IncidenciaState.rejected],
      );
      _log.debug(query.toString());
      final resultIncidencias = await _incidenciasRepository.getIncidencias(query: query);

      switch (resultIncidencias) {
        case Error():
          _log.warning('Failed to fetch incidencias', error: resultIncidencias.error);
          return Result.error(resultIncidencias.error);
        case Ok():
      }
      _historial = resultIncidencias.value;
      return const Result.ok(null);
    } on Exception catch (e, stackTrace) {
      _log.error('Failed to load historic incidencias', error: e, stackTrace: stackTrace);
      return Result.error(e);
    }
  }

  Future<Result<void>> _download(DownloadParams params) async {
    if (params.incidencia.state != IncidenciaState.approved) {
      return Result.error(Exception('Incidencia is not approved'));
    }

    late final Uri url;
    if (params.incidencia.pdfUrl == null || params.force) {
      final resultPDF = await _incidenciasRepository.generatePDF(params.incidencia, params.force);

      switch (resultPDF) {
        case Error():
          _log.error('Failed to generate PDF', error: resultPDF.error);
          return Result.error(resultPDF.error);
        case Ok():
          _log.info('Generated PDF for incidencia');
      }

      final incidenciaWithPDF = resultPDF.value;

      // Replace the old version
      if (historial != null) {
        final index = _historial!.indexOf(params.incidencia);
        _historial![index] = incidenciaWithPDF;
        notifyListeners();
      }

      url = Uri.parse(incidenciaWithPDF.pdfUrl!);
    } else {
      url = Uri.parse(params.incidencia.pdfUrl!);
    }

    if (!await launchUrl(url)) {
      _log.error('Failed to open incidencia PDF');
      return Result.error(Exception('Could not open URL'));
    }

    return const Result.ok(null);
  }

  Future<void> _getUsers() async {
    if (_cachedUsers) return;

    try {
      final resultUsers = await _usersRepository.getUsers(query: const UserQuery(active: true, order: UserQueryOrder.nombre));
      switch (resultUsers) {
        case Error():
          _log.error('Error when fetching users', error: resultUsers.error);
          return;
        case Ok():
      }
      _users = resultUsers.value;
      _cachedUsers = true;
      _log.info('Fetched users');
    } catch (e, stackTrace) {
      _log.error('Unexpected error when fetching users', error: e, stackTrace: stackTrace);
    }
  }
}
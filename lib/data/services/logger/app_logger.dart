import 'package:logger/logger.dart';
import 'package:ri_rh_v2/data/services/logger/printers.dart';

import 'log_output_stub.dart'
  if (dart.library.io) 'log_output_io.dart';

class AppLogger {
  AppLogger({
    required this._loggers,
  });

  final List<Logger> _loggers;

  void debug(String message) {
    for (final logger in _loggers) {
      logger.d(message);
    }
  }

  void info(String message) {
    for (final logger in _loggers) {
      logger.i(message);
    }
  }

  void warning(String message, {Object? error, StackTrace? stackTrace}) {
    for (final logger in _loggers) {
      logger.w(message, error: error, stackTrace: stackTrace);
    }
  }

  void error(String message, {Object? error, StackTrace? stackTrace}) {
    for (final logger in _loggers) {
      logger.w(message, error: error, stackTrace: stackTrace);
    }
  }

  void fatal(String message, {Object? error, StackTrace? stackTrace}) {
    for (final logger in _loggers) {
      logger.f(message, error: error, stackTrace: stackTrace);
    }
  }

  Future<void> close() async {
    final closeFutures = _loggers.map((logger) => logger.close());
    await Future.wait(closeFutures);
  }
}

class LogManager {
  static AppLogger? _applogger;

  static AppLogger get logger {
    if (_applogger == null) {
      throw StateError('LogManager has not been initialized');
    }
    return _applogger!;
  }

  /// Initializes an [AppLogger] with a configuration for debug or production.
  static Future<void> init({bool debug = false}) async {
    if (_applogger != null) {
      throw StateError('LogManager has already been initialized');
    }

    final loggers = await _createLoggers(debug: debug);

    _applogger = AppLogger(
      loggers: loggers,
    );
  }

  /// Releases all resources used by the [AppLogger].
  static Future<void> close() async {
    if (_applogger == null) {
      return;
    }

    await _applogger!.close();
    _applogger = null;
  }

  // Factory method for creating logger instances
  static Future<List<Logger>> _createLoggers({bool debug = false}) async {
    if (debug) {
      final consoleLogger = Logger(
        filter: DevelopmentFilter(),
        printer: CustomSimplePrinter(),
        output: ConsoleOutput(),
        level: Level.all,
      );
      return [consoleLogger];
    } else {
      final filter = ProductionFilter();
      final logOutput = await getLogOutput();
      final level = Level.info;

      final consoleLogger = Logger(
        filter: filter,
        printer: CustomSimplePrinter(),
        output: ConsoleOutput(),
        level: level,
      );

      // This will only output in platforms that use dart.io
      final fileLogger = Logger(
        filter: filter,
        printer: LogJsonPrinter(),
        output: logOutput,
        level: level,
      );
      return [consoleLogger, fileLogger];
    }
  }
}

import 'dart:convert';

import 'package:logger/logger.dart';

/// Output a simple message.
/// ```
/// [WARN] 2026-07-23T13:53:09.004428 | Login failed | ERROR: Exception: Invalid credentials
/// ```
class CustomSimplePrinter extends LogPrinter {
  static final levelPrefixes = {
    Level.trace: '[TRACE]',
    Level.debug: '[DEBUG]',
    Level.info: '[INFO]',
    Level.warning: '[WARN]',
    Level.error: '[ERROR]',
    Level.fatal: '[FATAL]',
  };

  static final levelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.none(),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  CustomSimplePrinter({this.colors = true});

  final bool colors;

  @override
  List<String> log(LogEvent event) {
    final time = event.time.toIso8601String();
    final messageStr = _stringifyMessage(event.message);
    final errStr = event.error != null ? ' | ERROR: ${event.error}' : ''; 
    return ['${_labelFor(event.level)} $time | $messageStr$errStr'];
  }

  String _labelFor(Level level) {
    var prefix = levelPrefixes[level]!;
    var color = levelColors[level]!;

    return colors ? color(prefix) : prefix;
  }

  String _stringifyMessage(dynamic message) {
    final finalMessage = message is Function ? message() : message;
    if (finalMessage is Map || finalMessage is Iterable) {
      var encoder = const JsonEncoder.withIndent(null);
      return encoder.convert(finalMessage);
    } else {
      return finalMessage.toString();
    }
  }
}

/// Outputs a [LogEvent] in JSON:
/// ```
/// {"level"="debug","msg"="hi there" "time"="2015-03-26T01:27:38-04:00" username="johndoe" number=8}
/// ```
class LogJsonPrinter extends LogPrinter {
  static final levelPrefixes = {
    Level.trace: 'trace',
    Level.debug: 'debug',
    Level.info: 'info',
    Level.warning: 'warning',
    Level.error: 'error',
    Level.fatal: 'fatal',
  };

  static final redactedKeys = {
    'password',
    'phone',
    'creditcard',
    'credit_card',
    'token',
    'api_token',
    'nss',
    'curp',
    'rfc',
  };

  @override
  List<String> log(LogEvent event) {
    final Map<String, dynamic> output = {
      'level': levelPrefixes[event.level],
      'time': event.time.toIso8601String(),
    };
    if (event.message is String) {
      output.addAll({'msg': event.message});
    } else if (event.message is Map) {
      event.message.entries.forEach((entry) {
        if (redactedKeys.contains(entry.key)) {
          output.addAll({entry.key: "[REDACTED]"});
          return;
        }

        output.addAll({entry.key: entry.value});
      });
    }
    if (event.error != null) {
      output.addAll({'error': '${event.error}'});
    }
    if (event.stackTrace != null) {
      output.addAll({'stacktrace': '${event.stackTrace}'});
    }

    final encoder = const JsonEncoder.withIndent(null);
    return [encoder.convert(output)];
  }
}
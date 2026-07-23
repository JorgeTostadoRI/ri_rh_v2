import 'dart:convert';

import 'package:logger/logger.dart';

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

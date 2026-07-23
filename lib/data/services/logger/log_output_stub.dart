import 'package:logger/logger.dart';

Future<LogOutput> getLogOutput() async {
  return NoLogOutput();
}

class NoLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {}
}
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

Future<LogOutput> getLogOutput() async {
  // Windows: %APPDATA%/Roaming/com.example/ri_rh_v2/
  final docsDir = await getApplicationSupportDirectory();
  final logsDir = '${docsDir.path}/logs';

  await Directory(logsDir).create(recursive: true);

  final fileOutput = AdvancedFileOutput(
    path: logsDir,
    maxRotatedFilesCount: 10,
    writeImmediately: [
      Level.warning,
      Level.error,
    ],
  );
  return fileOutput;
}
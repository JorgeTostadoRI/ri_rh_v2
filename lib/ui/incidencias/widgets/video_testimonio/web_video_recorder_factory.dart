import 'web_video_recorder.dart';
import 'web_video_recorder_stub.dart'
    if (dart.library.js_interop) 'web_video_recorder_web.dart';

/// Mismo patron de import condicional por plataforma que
/// `lib/data/services/file_download/file_download_service_factory.dart`.
WebVideoRecorder createWebVideoRecorder() => WebVideoRecorderImpl();

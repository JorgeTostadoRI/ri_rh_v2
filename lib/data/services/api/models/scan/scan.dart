import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan.freezed.dart';

@freezed
abstract class Scan with _$Scan {
  const factory Scan({
    required Uint8List template,
    required Uint8List image,
    required int width,
    required int height,
  }) = _Scan;
}
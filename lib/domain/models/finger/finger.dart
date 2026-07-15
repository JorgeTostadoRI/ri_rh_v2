import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finger.freezed.dart';

enum Hand {
  right,
  left;

  factory Hand.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'r':
      case 'right':
        return Hand.right;
      case 'l':
      case 'left':
        return Hand.left;
      default:
        throw Exception('Unrecognized value for Hand');
    }
  }
}

enum FingerName {
  thumb,
  pointer,
  middle,
  ring,
  pinky;

  factory FingerName.fromString(String value) {
    switch (value.toLowerCase()) {
      case 'thumb':
        return FingerName.thumb;
      case 'pointer':
      case 'index':
        return FingerName.pointer;
      case 'middle':
        return FingerName.middle;
      case 'ring':
        return FingerName.ring;
      case 'pinky':
        return FingerName.pinky;
      default:
        throw Exception('Unrecognized value for FingerName');
    }
  }
}

@freezed
abstract class Finger with _$Finger {
  const factory Finger({
    required int id,
    required Hand hand,
    required FingerName fingerName,
    required bool scanned,
  }) = _Finger;
}
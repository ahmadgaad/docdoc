import 'dart:developer';
import 'package:flutter/foundation.dart';

// ANSI color codes
class AnsiColorCodes {
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';
  static const String reset = '\x1B[0m';
}

void _coloredLog(String message, {String color = AnsiColorCodes.white}) {
  if (kDebugMode) {
    log('$color$message${AnsiColorCodes.reset}');
  }
}

void infoLog(String message) {
  _coloredLog(message, color: AnsiColorCodes.green);
}

void errorLog(String message) {
  _coloredLog(message, color: AnsiColorCodes.red);
}

void warningLog(String message) {
  _coloredLog(message, color: AnsiColorCodes.yellow);
}
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Centralized logger used across the app instead of raw `print`.
/// Every category is tagged with an emoji so it's easy to scan in the
/// console, and everything is stripped out of release builds.
class Logger {
  static const String tag = 'Weather Forecast';

  static void log(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('$msg', name: tag);
    }
  }

  static void logInfo(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('$msg', name: '📘 $tag');
    }
  }

  static void logSuccess(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('$msg', name: '📗 $tag');
    }
  }

  static void logWarning(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('$msg', name: '📒 $tag');
    }
  }

  static void logError(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('🛑 $msg 🛑', name: '📕 $tag');
    }
  }

  /// Singleton factory
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();
}

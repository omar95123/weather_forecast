import 'package:dio/dio.dart';

import '../../utils/logger.dart';

/// Thin, generic wrapper around every API response so controllers never
/// have to reach into `response.data` directly.
class APIResultModel<T> {
  final bool success;
  final String? message;
  final T? data;

  static const String tag = 'API Result Model';

  APIResultModel({required this.success, this.message, this.data});

  /// [dataKey] lets you unwrap a nested field (e.g. `"data"`) when the API
  /// wraps its payload; leave it null to use the raw response body.
  factory APIResultModel.fromResponse({Response? response, String? dataKey}) {
    if (response == null) {
      Logger.logError('Response is null', tag: tag);
      return APIResultModel(success: false, data: null, message: 'Response is null');
    }

    try {
      final ok = response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
      final body = response.data;
      final unwrapped = (dataKey != null && body is Map<String, dynamic>) ? body[dataKey] : body;

      return APIResultModel<T>(success: ok, data: unwrapped, message: ok ? null : 'Request failed (${response.statusCode})');
    } catch (error) {
      Logger.logError('Error parsing response:\n$error', tag: tag);
      return APIResultModel(success: false, data: null, message: 'Could not parse API response');
    }
  }
}

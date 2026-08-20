import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/logger.dart';
import 'url_constants.dart';

/// Thin wrapper around [Dio] with logging baked in. There's no auth on this
/// API, so unlike the token-refresh version used in the bigger apps this
/// stays intentionally simple.
class DioClient {
  late final Dio _dio;

  DioClient({String baseUrl = ''}) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: false,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: false,
          maxWidth: 90,
          logPrint: (object) => log(object.toString(), name: 'Weather API'),
        ),
      );
  }

  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get(url, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
    } on DioException catch (e) {
      Logger.logError('GET $url failed: ${e.message}', tag: '❌ API ERROR');
      rethrow;
    }
  }
}

/// Convenience singletons for the two Open-Meteo hosts used by this app.
class DioManager {
  static final DioClient geocoding = DioClient(baseUrl: UrlConstants.geocodingBaseUrl);
  static final DioClient forecast = DioClient(baseUrl: UrlConstants.forecastBaseUrl);
}

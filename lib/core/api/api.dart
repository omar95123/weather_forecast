import 'dio_manager.dart';
import 'url_constants.dart';
import '../../shared/models/api_result_model.dart';

class API {
  /// Search a city by free-text name.
  static Future<APIResultModel<T>> searchCity<T>(String query) async {
    return APIResultModel.fromResponse(
      response: await DioManager.geocoding.get(
        UrlConstants.searchCityEndpoint,
        queryParameters: {'name': query, 'count': 8, 'language': 'en', 'format': 'json'},
      ),
      dataKey: 'results',
    );
  }

  /// Current weather + 5-day daily forecast for a given coordinate.
  static Future<APIResultModel<T>> getForecast<T>({
    required double latitude,
    required double longitude,
  }) async {
    return APIResultModel.fromResponse(
      response: await DioManager.forecast.get(
        UrlConstants.forecastEndpoint,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'current': 'temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m',
          'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
          'forecast_days': 5,
          'timezone': 'auto',
        },
      ),
    );
  }
}

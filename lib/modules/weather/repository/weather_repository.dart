import '../../../core/api/api.dart';
import '../../../utils/logger.dart';
import '../models/city_model.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  Future<List<CityModel>> searchCity(String query) async {
    final result = await API.searchCity(query);
    if (!result.success) {
      throw Exception(result.message ?? 'Could not search for that city');
    }

    final results = (result.data as List<dynamic>? ?? []);
    return results.map((e) => CityModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<WeatherModel> getForecast(CityModel city) async {
    final result = await API.getForecast(latitude: city.latitude, longitude: city.longitude);
    if (!result.success || result.data == null) {
      Logger.logError('Failed to load forecast for ${city.name}', tag: 'WeatherRepository');
      throw Exception(result.message ?? 'Could not load the forecast');
    }

    return WeatherModel.fromJson(result.data as Map<String, dynamic>);
  }
}

/// URL constants for the Open-Meteo API (free, no API key required).
/// https://open-meteo.com/en/docs
class UrlConstants {
  UrlConstants._();

  static const String geocodingBaseUrl = 'https://geocoding-api.open-meteo.com/v1';
  static const String forecastBaseUrl = 'https://api.open-meteo.com/v1';

  static const String searchCityEndpoint = '/search';
  static const String forecastEndpoint = '/forecast';
}

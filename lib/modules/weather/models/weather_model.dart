/// Maps Open-Meteo's WMO weather codes to a short description + emoji icon.
/// https://open-meteo.com/en/docs#weathervariables
class WeatherCode {
  static String description(int code) {
    if (code == 0) return 'Clear sky';
    if ([1, 2, 3].contains(code)) return 'Partly cloudy';
    if ([45, 48].contains(code)) return 'Foggy';
    if ([51, 53, 55, 56, 57].contains(code)) return 'Drizzle';
    if ([61, 63, 65, 66, 67].contains(code)) return 'Rain';
    if ([71, 73, 75, 77].contains(code)) return 'Snow';
    if ([80, 81, 82].contains(code)) return 'Rain showers';
    if ([85, 86].contains(code)) return 'Snow showers';
    if ([95, 96, 99].contains(code)) return 'Thunderstorm';
    return 'Unknown';
  }

  static String icon(int code) {
    if (code == 0) return '☀️';
    if ([1, 2, 3].contains(code)) return '⛅';
    if ([45, 48].contains(code)) return '🌫️';
    if ([51, 53, 55, 56, 57].contains(code)) return '🌦️';
    if ([61, 63, 65, 66, 67].contains(code)) return '🌧️';
    if ([71, 73, 75, 77].contains(code)) return '🌨️';
    if ([80, 81, 82].contains(code)) return '🌧️';
    if ([85, 86].contains(code)) return '🌨️';
    if ([95, 96, 99].contains(code)) return '⛈️';
    return '🌡️';
  }
}

class DailyForecast {
  final DateTime date;
  final int weatherCode;
  final double maxTemp;
  final double minTemp;

  DailyForecast({
    required this.date,
    required this.weatherCode,
    required this.maxTemp,
    required this.minTemp,
  });
}

class WeatherModel {
  final double temperature;
  final int humidity;
  final int weatherCode;
  final double windSpeed;
  final List<DailyForecast> daily;

  WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.weatherCode,
    required this.windSpeed,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>? ?? {};
    final daily = json['daily'] as Map<String, dynamic>? ?? {};

    final List<dynamic> dates = daily['time'] as List<dynamic>? ?? [];
    final List<dynamic> codes = daily['weather_code'] as List<dynamic>? ?? [];
    final List<dynamic> maxTemps = daily['temperature_2m_max'] as List<dynamic>? ?? [];
    final List<dynamic> minTemps = daily['temperature_2m_min'] as List<dynamic>? ?? [];

    final forecasts = <DailyForecast>[
      for (var i = 0; i < dates.length; i++)
        DailyForecast(
          date: DateTime.parse(dates[i] as String),
          weatherCode: (codes.length > i ? codes[i] : 0) as int,
          maxTemp: ((maxTemps.length > i ? maxTemps[i] : 0) as num).toDouble(),
          minTemp: ((minTemps.length > i ? minTemps[i] : 0) as num).toDouble(),
        ),
    ];

    return WeatherModel(
      temperature: ((current['temperature_2m'] ?? 0) as num).toDouble(),
      humidity: ((current['relative_humidity_2m'] ?? 0) as num).toInt(),
      weatherCode: ((current['weather_code'] ?? 0) as num).toInt(),
      windSpeed: ((current['wind_speed_10m'] ?? 0) as num).toDouble(),
      daily: forecasts,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../shared/view/helper/export.dart';
import '../../models/city_model.dart';
import '../../models/weather_model.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key, required this.city, required this.weather});

  final CityModel city;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette().primary, Palette().primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(city.displayName, style: TextStyles().title.copyWith(color: Palette().white), textAlign: TextAlign.center),
          const VerticalSpace(12),
          Text(WeatherCode.icon(weather.weatherCode), style: const TextStyle(fontSize: 56)),
          const VerticalSpace(4),
          Text(
            '${weather.temperature.round()}°C',
            style: TextStyles().largeTitle.copyWith(color: Palette().white, fontSize: 48),
          ),
          Text(WeatherCode.description(weather.weatherCode), style: TextStyles().base.copyWith(color: Palette().white)),
          const VerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _InfoChip(icon: Icons.water_drop_outlined, label: '${weather.humidity}%'),
              _InfoChip(icon: Icons.air, label: '${weather.windSpeed.round()} km/h'),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Palette().white, size: 18),
        const HorizontalSpace(6),
        Text(label, style: TextStyles().base.copyWith(color: Palette().white)),
      ],
    );
  }
}

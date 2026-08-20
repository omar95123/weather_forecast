import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/view/helper/export.dart';
import '../../models/weather_model.dart';

class ForecastListItem extends StatelessWidget {
  const ForecastListItem({super.key, required this.forecast});

  final DailyForecast forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Palette().surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Palette().border),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(DateFormat('EEE, MMM d').format(forecast.date), style: TextStyles().base),
          ),
          Text(WeatherCode.icon(forecast.weatherCode), style: const TextStyle(fontSize: 22)),
          const HorizontalSpace(10),
          Expanded(child: Text(WeatherCode.description(forecast.weatherCode), style: TextStyles().hint)),
          Text('${forecast.maxTemp.round()}°', style: TextStyles().base),
          const HorizontalSpace(6),
          Text('${forecast.minTemp.round()}°', style: TextStyles().hint),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/view/components/loading_widget.dart';
import '../../../shared/view/helper/export.dart';
import '../controller/weather_cubit.dart';
import '../models/city_model.dart';
import 'widgets/city_search_field.dart';
import 'widgets/current_weather_card.dart';
import 'widgets/forecast_list_item.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette().background,
      appBar: AppBar(title: const Text('Weather Forecast')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CitySearchField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                    context.read<WeatherCubit>().onQueryChanged(value);
                  },
                ),
                const VerticalSpace(16),
                Expanded(child: _buildBody(context, state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WeatherState state) {
    if (state is CitySearchLoading) {
      return const LoadingWidget();
    }

    if (state is CitySearchLoaded) {
      if (state.cities.isEmpty) {
        return Center(child: Text('No cities found', style: TextStyles().hint));
      }
      return ListView.separated(
        itemCount: state.cities.length,
        separatorBuilder: (_, __) => const VerticalSpace(4),
        itemBuilder: (context, index) {
          final CityModel city = state.cities[index];
          return ListTile(
            tileColor: Palette().surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.location_on_outlined),
            title: Text(city.displayName),
            onTap: () {
              _searchController.text = city.name;
              context.read<WeatherCubit>().selectCity(city);
            },
          );
        },
      );
    }

    if (state is CitySearchError) {
      return Center(child: Text(state.message, style: TextStyles().hint));
    }

    if (state is WeatherLoading) {
      return const LoadingWidget();
    }

    if (state is WeatherLoaded) {
      return ListView(
        children: [
          CurrentWeatherCard(city: state.city, weather: state.weather),
          const VerticalSpace(20),
          Text('5-day forecast', style: TextStyles().title),
          const VerticalSpace(10),
          ...state.weather.daily.map((f) => ForecastListItem(forecast: f)),
        ],
      );
    }

    if (state is WeatherError) {
      return Center(child: Text(state.message, style: TextStyles().hint));
    }

    return Center(
      child: Text('Search for a city to see its weather', style: TextStyles().hint, textAlign: TextAlign.center),
    );
  }
}

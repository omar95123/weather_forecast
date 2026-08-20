import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/logger.dart';
import '../models/city_model.dart';
import '../models/weather_model.dart';
import '../repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;
  Timer? _debounce;

  WeatherCubit({required this.repository}) : super(WeatherInitial());

  /// Debounced so we don't hit the geocoding API on every keystroke.
  void onQueryChanged(String query) {
    _debounce?.cancel();
    if (query.trim().length < 2) {
      emit(WeatherInitial());
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), () => searchCity(query.trim()));
  }

  Future<void> searchCity(String query) async {
    emit(CitySearchLoading());
    try {
      final cities = await repository.searchCity(query);
      emit(CitySearchLoaded(cities));
    } catch (e) {
      Logger.logError(e, tag: 'WeatherCubit');
      emit(CitySearchError(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  Future<void> selectCity(CityModel city) async {
    emit(WeatherLoading(city));
    try {
      final weather = await repository.getForecast(city);
      emit(WeatherLoaded(city, weather));
    } catch (e) {
      Logger.logError(e, tag: 'WeatherCubit');
      emit(WeatherError(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  void reset() => emit(WeatherInitial());

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

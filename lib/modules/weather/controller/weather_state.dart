part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class CitySearchLoading extends WeatherState {}

class CitySearchLoaded extends WeatherState {
  final List<CityModel> cities;
  const CitySearchLoaded(this.cities);

  @override
  List<Object?> get props => [cities];
}

class CitySearchError extends WeatherState {
  final String message;
  const CitySearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class WeatherLoading extends WeatherState {
  final CityModel city;
  const WeatherLoading(this.city);

  @override
  List<Object?> get props => [city];
}

class WeatherLoaded extends WeatherState {
  final CityModel city;
  final WeatherModel weather;
  const WeatherLoaded(this.city, this.weather);

  @override
  List<Object?> get props => [city, weather];
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}

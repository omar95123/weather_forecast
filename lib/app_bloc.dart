import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/application/application_bloc/application_cubit.dart';
import 'modules/weather/controller/weather_cubit.dart';
import 'modules/weather/repository/weather_repository.dart';
import 'shared/controllers/error_cubit.dart';
import 'shared/controllers/loading_cubit.dart';
import 'theme/theme_cubit.dart';

/// Central place where every Bloc/Cubit in the app is instantiated and
/// exposed to the widget tree via [providers]. Mirrors the pattern used
/// across the rest of the codebase so every project bootstraps the same way.
class AppBloc {
  static final applicationCubit = ApplicationCubit();
  static final themeCubit = ThemeCubit();
  static final loadingCubit = LoadingCubit();
  static final errorCubit = ErrorCubit();
  static final weatherCubit = WeatherCubit(repository: WeatherRepository());

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationCubit>(create: (context) => applicationCubit),
    BlocProvider<ThemeCubit>(create: (context) => themeCubit),
    BlocProvider<LoadingCubit>(create: (context) => loadingCubit),
    BlocProvider<ErrorCubit>(create: (context) => errorCubit),
    BlocProvider<WeatherCubit>(create: (context) => weatherCubit),
  ];

  static void dispose() {
    applicationCubit.close();
    themeCubit.close();
    loadingCubit.close();
    errorCubit.close();
    weatherCubit.close();
  }

  /// Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() => _instance;

  AppBloc._internal();
}

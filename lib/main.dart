import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_bloc.dart';
import 'core/navigation/named_routes.dart';
import 'theme/theme_cubit.dart';
import 'theme/theme_model.dart';
import 'utils/logger.dart';

/// Logs every Bloc/Cubit lifecycle event so state transitions are easy to
/// trace in the console during development.
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Logger.logInfo('Created ${bloc.runtimeType}', tag: 'BlocObserver');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.log('${change.currentState} => ${change.nextState}', tag: '📦 ${bloc.runtimeType} CHANGE 📦');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.logError('Error in ${bloc.runtimeType}: $error', tag: '📦🛑 BLOC ERROR 🛑📦');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger.logInfo('Closed ${bloc.runtimeType}', tag: 'BlocObserver');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppBloc.applicationCubit.setupApplication();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: BlocBuilder<ThemeCubit, ThemeModel>(
        builder: (context, theme) {
          return MaterialApp.router(
            title: 'Weather Forecast',
            debugShowCheckedModeBanner: false,
            theme: theme.themeData,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en')],
            routerDelegate: appRouter.routerDelegate,
            routeInformationParser: appRouter.routeInformationParser,
            routeInformationProvider: appRouter.routeInformationProvider,
          );
        },
      ),
    );
  }
}

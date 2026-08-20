import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/weather/views/weather_home_screen.dart';
import '../../shared/view/helper/palette.dart';
import 'navigation_service.dart';

class NamedRoutes {
  NamedRoutes._();

  static const String home = '/';
}

/// Wraps every screen in a [Scaffold] + [SafeArea] with the app background,
/// mirroring how routes are declared across the other apps.
class AppRoute extends GoRoute {
  AppRoute({
    required String super.name,
    required super.path,
    required Widget Function(GoRouterState state, BuildContext context) builder,
    List<GoRoute> super.routes = const [],
  }) : super(
          builder: (context, state) => Scaffold(
            backgroundColor: Palette().background,
            body: SafeArea(child: builder(state, context)),
          ),
        );
}

final appRouter = GoRouter(
  navigatorKey: NavigationService.navigationKey,
  initialLocation: NamedRoutes.home,
  routes: [
    AppRoute(
      name: NamedRoutes.home,
      path: NamedRoutes.home,
      builder: (s, c) => const WeatherHomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    backgroundColor: Palette().background,
    body: Center(child: Text(state.error?.message ?? 'Page not found')),
  ),
);

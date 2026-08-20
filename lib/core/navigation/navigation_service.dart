import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Thin wrapper around [GoRouter] so screens/repositories can navigate or
/// read a Bloc without needing a [BuildContext] passed down explicitly.
class NavigationService {
  factory NavigationService() => _instance;

  NavigationService._internal();

  static final NavigationService _instance = NavigationService._internal();

  static final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static BuildContext get context {
    if (navigationKey.currentContext == null) {
      throw FlutterError('Navigation context is not yet available');
    }
    return navigationKey.currentContext!;
  }

  T read<T>() => context.read<T>();

  void back([dynamic result]) {
    if (canPop()) GoRouter.of(context).pop(result);
  }

  Future<dynamic> pushNamed(String routeName, {Map<String, String>? pathParams, Object? extra}) {
    return GoRouter.of(context).pushNamed(routeName, pathParameters: pathParams ?? {}, extra: extra);
  }

  bool canPop() => GoRouter.of(context).canPop();
}

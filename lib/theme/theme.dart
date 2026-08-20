import 'package:flutter/material.dart';

import '../shared/view/helper/palette.dart';
import 'theme_model.dart';

/// Builds the light/dark [ThemeData] used across the app. Kept as static
/// getters (rather than a generated theme file) so it's easy to scan.
class AppTheme {
  AppTheme._();

  static ThemeModel get light => ThemeModel(
        isDark: false,
        themeData: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Palette().background,
          colorScheme: ColorScheme.fromSeed(seedColor: Palette().primary, brightness: Brightness.light),
          appBarTheme: AppBarTheme(
            backgroundColor: Palette().background,
            foregroundColor: Palette().black,
            elevation: 0,
            centerTitle: true,
          ),
          fontFamily: 'Roboto',
        ),
      );

  static ThemeModel get dark => ThemeModel(
        isDark: true,
        themeData: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Palette().night,
          colorScheme: ColorScheme.fromSeed(seedColor: Palette().primary, brightness: Brightness.dark),
          appBarTheme: AppBarTheme(
            backgroundColor: Palette().night,
            foregroundColor: Palette().white,
            elevation: 0,
            centerTitle: true,
          ),
          fontFamily: 'Roboto',
        ),
      );
}

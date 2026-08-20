import 'package:flutter/painting.dart';

/// This class contains all colors used across the app.
class Palette {
  final Color transparent = const Color(0x00FFFFFF);
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);
  final Color background = const Color(0xFFF5F7FA);
  final Color surface = const Color(0xFFFFFFFF);
  final Color primary = const Color(0xFF2E7BF6);
  final Color primaryDark = const Color(0xFF1B4FA0);
  final Color secondaryGray = const Color(0xFF6D7A8A);
  final Color border = const Color(0xFFE1E6EC);
  final Color success = const Color(0xFF34A853);
  final Color error = const Color(0xFFEF4444);
  final Color warning = const Color(0xFFF59E0B);
  final Color night = const Color(0xFF1E293B);

  factory Palette() => _instance;

  Palette._internal();

  /// Singleton Factory
  static final Palette _instance = Palette._internal();
}

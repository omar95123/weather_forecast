import 'package:flutter/material.dart';

import 'palette.dart';

/// This class holds all TextStyles for the app.
class TextStyles {
  final TextStyle button = TextStyle(color: Palette().white, fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle label = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle hint = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Palette().secondaryGray);
  final TextStyle base = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  final TextStyle title = const TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
  final TextStyle largeTitle = const TextStyle(fontSize: 32, fontWeight: FontWeight.w700);
  final TextStyle small = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Palette().secondaryGray);

  factory TextStyles() => _instance;

  TextStyles._internal();

  /// Singleton Factory
  static final TextStyles _instance = TextStyles._internal();
}

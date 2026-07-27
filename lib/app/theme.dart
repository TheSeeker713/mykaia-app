import 'package:flutter/material.dart';

ThemeData buildMyKaiaTheme() {
  const seed = Color(0xFF2F5D50);
  final scheme = ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light);
  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
  );
}

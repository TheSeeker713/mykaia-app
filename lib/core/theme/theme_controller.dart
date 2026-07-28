import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'kaia_colors.dart';

enum KaiaBrightness { light, dark }

final themeModeProvider = NotifierProvider<ThemeModeNotifier, KaiaBrightness>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<KaiaBrightness> {
  @override
  KaiaBrightness build() => KaiaBrightness.light;

  void setTheme(KaiaBrightness value) => state = value;

  void toggle() {
    state = state == KaiaBrightness.light
        ? KaiaBrightness.dark
        : KaiaBrightness.light;
  }
}

String pondBackgroundAsset(KaiaBrightness mode) {
  return mode == KaiaBrightness.dark
      ? 'assets/kaia_wrapper_port/backgrounds/koi-pond-bg-dark.webp'
      : 'assets/kaia_wrapper_port/backgrounds/koi-pond-bg.webp';
}

ThemeData buildMyKaiaTheme(KaiaBrightness mode) {
  final isDark = mode == KaiaBrightness.dark;
  final kaia = isDark ? KaiaThemeColors.dark : KaiaThemeColors.light;
  final scheme = ColorScheme.fromSeed(
    seedColor: KaiaColors.accent,
    brightness: isDark ? Brightness.dark : Brightness.light,
  ).copyWith(
    primary: KaiaColors.accent,
    surface: kaia.chatSurface,
    onSurface: kaia.chatText,
  );

  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    scaffoldBackgroundColor: KaiaColors.scaffoldFallback,
    extensions: [kaia],
  );
}

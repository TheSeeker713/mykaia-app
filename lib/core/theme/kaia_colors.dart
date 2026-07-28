import 'package:flutter/material.dart';

/// Design tokens ported from _KAIA_Wrapper `src/styles/tokens.css`.
abstract final class KaiaColors {
  static const accent = Color(0xFF3D6B8C);
  static const chatSurfaceLight = Color(0xFFFFFFFF);
  static const chatSurfaceDark = Color(0xFF242A34);
  static const chatTextLight = Color(0xFF1A1A1A);
  static const chatTextDark = Color(0xFFE8E9ED);
  static const chromeMutedLight = Color(0xFF5C6570);
  static const chromeMutedDark = Color(0xFF9AA3B2);
  static const drawerFaceLight = Color(0xFFD8DEE8);
  static const drawerFaceDark = Color(0xFF3A4250);
  static const scaffoldFallback = Color(0xFF0E1218);
}

class KaiaThemeColors extends ThemeExtension<KaiaThemeColors> {
  const KaiaThemeColors({
    required this.chatSurface,
    required this.chatText,
    required this.chromeMuted,
    required this.drawerFace,
    required this.scrimOpacity,
  });

  final Color chatSurface;
  final Color chatText;
  final Color chromeMuted;
  final Color drawerFace;
  final double scrimOpacity;

  static const light = KaiaThemeColors(
    chatSurface: KaiaColors.chatSurfaceLight,
    chatText: KaiaColors.chatTextLight,
    chromeMuted: KaiaColors.chromeMutedLight,
    drawerFace: KaiaColors.drawerFaceLight,
    scrimOpacity: 0.2,
  );

  static const dark = KaiaThemeColors(
    chatSurface: KaiaColors.chatSurfaceDark,
    chatText: KaiaColors.chatTextDark,
    chromeMuted: KaiaColors.chromeMutedDark,
    drawerFace: KaiaColors.drawerFaceDark,
    scrimOpacity: 0.35,
  );

  @override
  KaiaThemeColors copyWith({
    Color? chatSurface,
    Color? chatText,
    Color? chromeMuted,
    Color? drawerFace,
    double? scrimOpacity,
  }) {
    return KaiaThemeColors(
      chatSurface: chatSurface ?? this.chatSurface,
      chatText: chatText ?? this.chatText,
      chromeMuted: chromeMuted ?? this.chromeMuted,
      drawerFace: drawerFace ?? this.drawerFace,
      scrimOpacity: scrimOpacity ?? this.scrimOpacity,
    );
  }

  @override
  KaiaThemeColors lerp(ThemeExtension<KaiaThemeColors>? other, double t) {
    if (other is! KaiaThemeColors) return this;
    return KaiaThemeColors(
      chatSurface: Color.lerp(chatSurface, other.chatSurface, t)!,
      chatText: Color.lerp(chatText, other.chatText, t)!,
      chromeMuted: Color.lerp(chromeMuted, other.chromeMuted, t)!,
      drawerFace: Color.lerp(drawerFace, other.drawerFace, t)!,
      scrimOpacity: scrimOpacity + (other.scrimOpacity - scrimOpacity) * t,
    );
  }
}

extension KaiaThemeX on BuildContext {
  KaiaThemeColors get kaia {
    return Theme.of(this).extension<KaiaThemeColors>() ?? KaiaThemeColors.light;
  }
}

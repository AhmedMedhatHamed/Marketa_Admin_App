import 'package:flutter/material.dart';

class AppThemes {
  // ─── Colours ────────────────────────────────────────────────────────────────
  static const _lightBg       = Color(0xFFF5F3EF);
  static const _lightSurface  = Color(0xFFFFFFFF);
  static const _lightPrimary  = Color(0xFF2D6A4F);
  static const _lightAccent   = Color(0xFF52B788);
  static const _lightText     = Color(0xFF1B1B1B);
  static const _lightSubtext  = Color(0xFF6B6B6B);

  static const _darkBg        = Color(0xFF0F1117);
  static const _darkSurface   = Color(0xFF1A1D27);
  static const _darkPrimary   = Color(0xFF52B788);
  static const _darkAccent    = Color(0xFF95D5B2);
  static const _darkText      = Color(0xFFF0EDE8);
  static const _darkSubtext   = Color(0xFF9A9A9A);

  // ─── Light Theme ────────────────────────────────────────────────────────────
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightBg,
    colorScheme: const ColorScheme.light(
      primary:    _lightPrimary,
      secondary:  _lightAccent,
      surface:    _lightSurface,
      onPrimary:  Colors.white,
      onSurface:  _lightText,
    ),
    textTheme: _buildTextTheme(isLight: true),
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightBg,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: _lightText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
      iconTheme: IconThemeData(color: _lightText),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? _lightPrimary : Colors.grey[400],
      ),
      trackColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
            ? _lightPrimary.withOpacity(0.3)
            : Colors.grey[300],
      ),
    ),
    extensions: [
      AppColors(
        background: _lightBg,
        surface: _lightSurface,
        primary: _lightPrimary,
        accent: _lightAccent,
        text: _lightText,
        subtext: _lightSubtext,
      ),
    ],
  );

  // ─── Dark Theme ─────────────────────────────────────────────────────────────
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _darkBg,
    colorScheme: const ColorScheme.dark(
      primary:    _darkPrimary,
      secondary:  _darkAccent,
      surface:    _darkSurface,
      onPrimary:  _darkBg,
      onSurface:  _darkText,
    ),
    textTheme: _buildTextTheme(isLight: false),
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkBg,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: _darkText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
      iconTheme: IconThemeData(color: _darkText),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? _darkPrimary : Colors.grey[600],
      ),
      trackColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
            ? _darkPrimary.withOpacity(0.35)
            : Colors.grey[800],
      ),
    ),
    extensions: [
      AppColors(
        background: _darkBg,
        surface: _darkSurface,
        primary: _darkPrimary,
        accent: _darkAccent,
        text: _darkText,
        subtext: _darkSubtext,
      ),
    ],
  );

  static TextTheme _buildTextTheme({required bool isLight}) {
    final base = isLight ? _lightText : _darkText;
    final sub  = isLight ? _lightSubtext : _darkSubtext;
    return TextTheme(
      displayLarge:  TextStyle(color: base, fontWeight: FontWeight.w700, fontSize: 36),
      displayMedium: TextStyle(color: base, fontWeight: FontWeight.w600, fontSize: 28),
      titleLarge:    TextStyle(color: base, fontWeight: FontWeight.w600, fontSize: 20),
      titleMedium:   TextStyle(color: base, fontWeight: FontWeight.w500, fontSize: 16),
      bodyLarge:     TextStyle(color: base, fontSize: 16),
      bodyMedium:    TextStyle(color: sub,  fontSize: 14),
      labelLarge:    TextStyle(color: base, fontWeight: FontWeight.w500, fontSize: 14),
    );
  }
}

// ─── Custom Extension ─────────────────────────────────────────────────────────
class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color surface;
  final Color primary;
  final Color accent;
  final Color text;
  final Color subtext;

  const AppColors({
    required this.background,
    required this.surface,
    required this.primary,
    required this.accent,
    required this.text,
    required this.subtext,
  });

  @override
  AppColors copyWith({
    Color? background, Color? surface, Color? primary,
    Color? accent, Color? text, Color? subtext,
  }) => AppColors(
    background: background ?? this.background,
    surface:    surface    ?? this.surface,
    primary:    primary    ?? this.primary,
    accent:     accent     ?? this.accent,
    text:       text       ?? this.text,
    subtext:    subtext    ?? this.subtext,
  );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface:    Color.lerp(surface,    other.surface,    t)!,
      primary:    Color.lerp(primary,    other.primary,    t)!,
      accent:     Color.lerp(accent,     other.accent,     t)!,
      text:       Color.lerp(text,       other.text,       t)!,
      subtext:    Color.lerp(subtext,    other.subtext,    t)!,
    );
  }
}
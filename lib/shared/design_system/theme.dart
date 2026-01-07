import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _primary = Color(0xFF11D4C4);
const _primaryDark = Color(0xFF0FAE6B);
const _bgLight = Color(0xFFF6F8F8);
const _bgDark = Color(0xFF102220);
const _textLight = Color(0xFF111817);
const _textDark = Color(0xFFFFFFFF);
const _mutedLight = Color(0xFF618986);
const _mutedDark = Color(0xFFA0B3B0);
const _surfaceLight = Color(0xFFFFFFFF);
const _surfaceDark = Color(0xFF1A2C29);
const _borderLight = Color(0xFFDCE5E4);
const _borderDark = Color(0xFF2A3C39);

ThemeData buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final backgroundColor = isDark ? _bgDark : _bgLight;
  final surfaceColor = isDark ? _surfaceDark : _surfaceLight;

  final baseScheme = ColorScheme.fromSeed(
    seedColor: _primary,
    brightness: brightness,
  );

  final colorScheme = baseScheme.copyWith(
    primary: _primary,
    onPrimary: _textLight,
    secondary: _mutedLight,
    onSecondary: _textLight,
    surface: surfaceColor,
    onSurface: isDark ? _textDark : _textLight,
    tertiary: _primaryDark,
    onTertiary: _textLight,
  );

  final textTheme = GoogleFonts.interTextTheme(
    TextTheme(
      displayLarge: const TextStyle(fontWeight: FontWeight.w800),
      displayMedium: const TextStyle(fontWeight: FontWeight.w700),
      titleLarge: const TextStyle(fontWeight: FontWeight.w700),
      titleMedium: const TextStyle(fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: isDark ? _textDark : _textLight),
      bodyMedium: TextStyle(color: isDark ? _textDark : _textLight),
      bodySmall: TextStyle(color: isDark ? _mutedDark : _mutedLight),
      labelLarge: const TextStyle(fontWeight: FontWeight.w700),
    ),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: colorScheme,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isDark ? _borderDark : _borderLight),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? _textDark : _textLight,
        side: BorderSide(color: isDark ? _borderDark : _borderLight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: isDark ? _borderDark : _borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: isDark ? _borderDark : _borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _primary, width: 1.6),
      ),
      labelStyle: TextStyle(color: isDark ? _mutedDark : _mutedLight),
    ),
    dividerColor: isDark ? _borderDark : _borderLight,
    chipTheme: ChipThemeData(
      backgroundColor: surfaceColor,
      selectedColor: _primary.withValues(alpha: 0.15),
      labelStyle: TextStyle(color: isDark ? _textDark : _textLight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    ),
  );
}

const kPagePadding = EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
const kCardSpacing = 14.0;
const kSafeBottom = SizedBox(height: 24);

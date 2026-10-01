import 'package:flutter/material.dart';

class AppTheme {
  // Brand Colors
  static const Color pumpkin = Color(0xFFFD802E);
  static const Color charcoal = Color(0xFF233D4C);

  // Font Families
  static const String displayFont = 'Modern Antiqua';
  static const String decorativeFont = 'Felipa';

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: pumpkin,
        primary: pumpkin,
        secondary: charcoal,
        surface: Colors.white,
      ),

      // Typography configuration
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: displayFont),
        displayMedium: TextStyle(fontFamily: displayFont),
        displaySmall: TextStyle(fontFamily: displayFont),
        headlineLarge: TextStyle(fontFamily: displayFont),
        headlineMedium: TextStyle(fontFamily: displayFont),
        headlineSmall: TextStyle(fontFamily: displayFont),
        titleLarge: TextStyle(fontFamily: displayFont),
        // Body text remains default for readability
      ),

      // Custom accent style that can be accessed via Theme.of(context).textTheme
      // or defined as a specific style here.
    );
  }

  /// Helper for decorative/accent text using Felipa
  static TextStyle get decorativeAccent =>
      const TextStyle(fontFamily: decorativeFont);
}

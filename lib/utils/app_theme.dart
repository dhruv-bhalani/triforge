import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFF00D4FF);
  static const Color secondary = Color(0xFF7B2FFF);
  static const Color accent = Color(0xFFFF6B35);
  static const Color bgDark = Color(0xFF050A14);
  static const Color bgCard = Color(0xFF0D1526);
  static const Color bgCard2 = Color(0xFF111827);
  static const Color textWhite = Color(0xFFF0F4FF);
  static const Color textGrey = Color(0xFF8892A4);
  static const Color border = Color(0xFF1E2D45);
  static const Color glowBlue = Color(0x3300D4FF);
  static const Color glowPurple = Color(0x337B2FFF);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bgDark,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: bgCard,
        error: Colors.red,
      ),
      textTheme: GoogleFonts.spaceGroteskTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: textWhite,
        displayColor: textWhite,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}

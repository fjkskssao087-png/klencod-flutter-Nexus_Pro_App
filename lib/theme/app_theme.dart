import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF000000),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF0A84FF),
        secondary: Color(0xFF5E5CE6),
        surface: Color(0xFF1A1A24),
      ),
      textTheme: GoogleFonts.tajawalTextTheme(ThemeData.dark().textTheme),
      useMaterial3: true,
    );
  }
}
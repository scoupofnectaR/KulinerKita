import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFFE8510A);
  static const Color primaryLight = Color(0xFFFFF3ED);
  static const Color background = Color(0xFFFFFBF7);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF888888);
  static const Color cardBg = Color(0xFFFFFFFF);

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      );
}
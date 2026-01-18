import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryColor = Color(0xFF2563eb);
  static const Color primaryHover = Color(0xFF1d4ed8);
  static const Color primaryLight = Color(0xFF3b82f6);
  static const Color accentColor = Color(0xFFf97316);
  static const Color accentHover = Color(0xFFea580c);
  static const Color accentLight = Color(0xFFfb923c);
  
  // Status Colors
  static const Color successColor = Color(0xFF10b981);
  static const Color errorColor = Color(0xFFef4444);
  static const Color warningColor = Color(0xFFf59e0b);
  static const Color infoColor = Color(0xFF06b6d4);
  
  // Neutral Colors
  static const Color gray50 = Color(0xFFf8fafc);
  static const Color gray100 = Color(0xFFf1f5f9);
  static const Color gray200 = Color(0xFFe2e8f0);
  static const Color gray300 = Color(0xFFcbd5e1);
  static const Color gray400 = Color(0xFF94a3b8);
  static const Color gray500 = Color(0xFF64748b);
  static const Color gray600 = Color(0xFF475569);
  static const Color gray700 = Color(0xFF334155);
  static const Color gray800 = Color(0xFF1e293b);
  static const Color gray900 = Color(0xFF0f172a);
  
  // Spacing
  static const double space0 = 0;
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space5 = 20;
  static const double space6 = 24;
  static const double space7 = 28;
  static const double space8 = 32;
  static const double space10 = 40;
  static const double space12 = 48;
  static const double space14 = 56;
  static const double space16 = 64;
  
  // Mobile Spacing
  static const double mobilePadding = 20;
  static const double mobileSectionGap = 24;
  static const double mobileCardGap = 16;
  static const double mobileElementGap = 12;
  
  // Border Radius
  static const double radiusXs = 6;
  static const double radiusSm = 10;
  static const double radiusMd = 14;
  static const double radiusLg = 18;
  static const double radiusXl = 22;
  static const double radius2xl = 28;
  static const double radiusFull = 9999;
  
  // Icon Sizes
  static const double icon2xs = 14;
  static const double iconXs = 16;
  static const double iconSm = 20;
  static const double iconMd = 24;
  static const double iconLg = 28;
  static const double iconXl = 32;
  static const double icon2xl = 40;
  
  // Text Sizes
  static const double text2xs = 10;
  static const double textXs = 12;
  static const double textSm = 14;
  static const double textBase = 16;
  static const double textLg = 18;
  static const double textXl = 20;
  static const double text2xl = 24;
  static const double text3xl = 30;
  static const double text4xl = 36;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        surface: Colors.white,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: gray900,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: gray50,
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: gray900,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: gray900),
      ),
      
      // Card Theme
      // cardTheme: CardTheme(
      //   color: Colors.white,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(radiusXl),
      //     side: const BorderSide(color: gray200),
      //   ),
      //   margin: EdgeInsets.zero,
      // ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: space6, vertical: space3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLg),
          ),
          textStyle: const TextStyle(
            fontSize: textBase,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: space4, vertical: space2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: space4, vertical: space3),
        hintStyle: const TextStyle(color: gray400),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: gray200,
        thickness: 1,
        space: 1,
      ),
      
      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: text4xl,
          fontWeight: FontWeight.w700,
          color: gray900,
          letterSpacing: -0.025,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: text3xl,
          fontWeight: FontWeight.w700,
          color: gray900,
          letterSpacing: -0.025,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: text2xl,
          fontWeight: FontWeight.w600,
          color: gray900,
          letterSpacing: -0.02,
          height: 1.375,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: textXl,
          fontWeight: FontWeight.w600,
          color: gray900,
          letterSpacing: -0.015,
          height: 1.375,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: textLg,
          fontWeight: FontWeight.w600,
          color: gray900,
          letterSpacing: -0.01,
          height: 1.375,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: textBase,
          color: gray600,
          height: 1.625,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: textSm,
          color: gray600,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: textXs,
          color: gray400,
          height: 1.5,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        surface: gray900,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: gray50,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: gray800,
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: gray900,
        foregroundColor: gray50,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: gray50),
      ),
      
      // Card Theme
      // cardTheme: CardTheme(
      //   color: gray900,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(radiusXl),
      //     side: const BorderSide(color: gray700),
      //   ),
      //   margin: EdgeInsets.zero,
      // ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: space6, vertical: space3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLg),
          ),
          textStyle: const TextStyle(
            fontSize: textBase,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: space4, vertical: space2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: gray900,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: space4, vertical: space3),
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: gray700,
        thickness: 1,
        space: 1,
      ),
      
      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: text4xl,
          fontWeight: FontWeight.w700,
          color: gray50,
          letterSpacing: -0.025,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: text3xl,
          fontWeight: FontWeight.w700,
          color: gray50,
          letterSpacing: -0.025,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: text2xl,
          fontWeight: FontWeight.w600,
          color: gray50,
          letterSpacing: -0.02,
          height: 1.375,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: textXl,
          fontWeight: FontWeight.w600,
          color: gray50,
          letterSpacing: -0.015,
          height: 1.375,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: textLg,
          fontWeight: FontWeight.w600,
          color: gray50,
          letterSpacing: -0.01,
          height: 1.375,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: textBase,
          color: gray300,
          height: 1.625,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: textSm,
          color: gray300,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: textXs,
          color: gray500,
          height: 1.5,
        ),
      ),
    );
  }
}

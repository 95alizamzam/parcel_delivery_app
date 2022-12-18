import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parcel_delivery_app/core/colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kwhite,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        color: kblack,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: kblack,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: kblack,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      //! body text1 : bold
      bodyLarge: GoogleFonts.poppins(
        color: kblack,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      //! body text1 : medium
      bodyMedium: GoogleFonts.poppins(
        color: kblack,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      //! body text1 : medium
      bodySmall: GoogleFonts.poppins(
        color: kblack,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

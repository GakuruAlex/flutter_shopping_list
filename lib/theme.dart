import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkPrimaryColor = Color.fromARGB(125, 98, 5, 198);
final lightPrimaryColor = Color.fromARGB(125, 124, 61, 175);
final primaryTextColor = Color.fromARGB(255, 255, 255, 255);
final accentColor = Color.fromARGB(219, 218, 170, 15);

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: darkPrimaryColor,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.acme(fontSize: 24, fontStyle: FontStyle.italic),
    bodyLarge: GoogleFonts.acme(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      color: primaryTextColor,
    ),
    bodyMedium: GoogleFonts.acme(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      color: primaryTextColor,
    ),
  ),
  scaffoldBackgroundColor: darkPrimaryColor,
  appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: accentColor,
    foregroundColor: primaryTextColor,
  ),
);

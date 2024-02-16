import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voco_riverpod_mvc/product/utilities/constans/colors/project_colors.dart';

class ProjectTheme {
  static final _fontFamily = GoogleFonts.archivoNarrow().fontFamily;
  static themeDataLight() => ThemeData(
      appBarTheme: _appBarThemeLight(),
      iconTheme: _iconThemeLight(),
      scaffoldBackgroundColor: ProjectColors.white,
      textTheme: _textThemeLight(),
      textSelectionTheme:
          const TextSelectionThemeData(selectionHandleColor: Colors.black),
      colorScheme: _colorShemeLight(),
      snackBarTheme: SnackBarThemeData(backgroundColor: ProjectColors.black),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ProjectColors.softPrupleDark));

  static ColorScheme _colorShemeLight() {
    return ColorScheme(
        brightness: Brightness.light,
        primary: ProjectColors.white,
        onPrimary: ProjectColors.black,
        secondary: ProjectColors.black,
        onSecondary: ProjectColors.black,
        error: ProjectColors.red,
        onError: ProjectColors.white,
        background: ProjectColors.white,
        onBackground: ProjectColors.grey,
        surface: ProjectColors.softPruple,
        onSurface: ProjectColors.white);
  }

  static TextTheme _textThemeLight() {
    return TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontFamily: GoogleFonts.ptSansNarrow().fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.black,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 11,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.black,
        ));
  }

  static IconThemeData _iconThemeLight() =>
      IconThemeData(color: ProjectColors.black);

  static AppBarTheme _appBarThemeLight() {
    return AppBarTheme(
      elevation: 0.0,
      backgroundColor: ProjectColors.white,
    );
  }
}

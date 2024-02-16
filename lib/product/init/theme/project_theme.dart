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
        progressIndicatorTheme: ProgressIndicatorThemeData(color: ProjectColors.softPrupleDark)
      );

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

  static themeDataDark() => ThemeData(
        colorScheme: _colorShemeDark(),
        textTheme: _textThemeDark(),
        iconTheme: _iconThemeDark(),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: ProjectColors.red2Dark),
        textSelectionTheme:
            const TextSelectionThemeData(selectionHandleColor: Colors.white),
        scaffoldBackgroundColor: ProjectColors.whiteDark,
        appBarTheme: _appBarThemeDark(),
        switchTheme: SwitchThemeData(
          //  overlayColor: MaterialStateProperty.all<Color>(Colors.yellow),
          trackColor: MaterialStateProperty.all<Color>(Colors.yellow),
          thumbColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      );

  static ColorScheme _colorShemeDark() {
    return ColorScheme(
        brightness: Brightness.light,
        primary: ProjectColors.whiteDark,
        onPrimary: ProjectColors.grey,
        secondary: ProjectColors.blackDark,
        onSecondary: ProjectColors.blackDark,
        error: ProjectColors.red2Dark,
        onError: ProjectColors.whiteDark,
        background: ProjectColors.whiteDark,
        onBackground: ProjectColors.greyDark,
        surface: ProjectColors.softPrupleDark,
        onSurface: ProjectColors.whiteDark);
  }

  static TextTheme _textThemeDark() {
    return TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.white,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.white,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 11,
          fontFamily: _fontFamily,
          fontWeight: FontWeight.normal,
          color: ProjectColors.white,
        ));
  }

  static IconThemeData _iconThemeDark() =>
      IconThemeData(color: ProjectColors.white);

  static AppBarTheme _appBarThemeDark() {
    return AppBarTheme(
      elevation: 0.0,
      backgroundColor: ProjectColors.whiteDark,
    );
  }
}

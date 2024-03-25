import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight(context) {
  var baseTheme = ThemeData(brightness: Brightness.light);

  return ThemeData(
    useMaterial3: false,
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme).copyWith(
      titleLarge: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      titleMedium: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      titleSmall: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      bodyLarge: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      bodyMedium: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
      bodySmall: GoogleFonts.lato(
          textStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(34, 40, 42, 1),
      )),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Color.fromRGBO(34, 40, 42, 1),
      ),
      centerTitle: true,
      elevation: 0,
    ),
    hoverColor: const Color.fromRGBO(255, 168, 170, 0.3),
    colorScheme: const ColorScheme(
      primary: Color.fromRGBO(12, 166, 242, 1),
      onPrimary: Color.fromRGBO(119, 205, 248, 1),
      onPrimaryContainer: Color.fromRGBO(226, 244, 253, 1),
      secondary: Color.fromRGBO(255, 143, 145, 1),
      onSecondary: Color.fromRGBO(255, 192, 194, 1),
      onSecondaryContainer: Color.fromRGBO(255, 242, 242, 1),
      tertiary: Color.fromRGBO(249, 223, 129, 1),
      onTertiary: Color.fromRGBO(252, 237, 184, 1),
      onTertiaryContainer: Color.fromRGBO(254, 251, 240, 1),
      // primary: Color.fromRGBO(0, 190, 239, 1),
      // onPrimary: Color.fromRGBO(223, 249, 255, 1),
      // onPrimaryContainer: Color.fromRGBO(223, 249, 255, 1),
      primaryContainer: Color.fromRGBO(34, 40, 42, 1),
      secondaryContainer: Color.fromRGBO(255, 182, 73, 1),
      // secondary: Color.fromRGBO(255, 168, 170, 1),
      // onSecondary: Color.fromRGBO(255, 234, 234, 1),
      // tertiary: Color.fromRGBO(250, 229, 152, 1),
      // onTertiary: Color.fromRGBO(250, 229, 152, 0.4),
      background: Color.fromRGBO(255, 255, 255, 1),
      onBackground: Color.fromRGBO(240, 243, 245, 1),

      surface: Color.fromRGBO(150, 152, 153, 1),
      onSurface: Color.fromRGBO(220, 223, 225, 1),
      surfaceVariant: Color.fromRGBO(240, 243, 245, 1), //background
      surfaceTint: Color.fromRGBO(83, 97, 102, 1),

      shadow: Color.fromRGBO(218, 215, 215, 1),

      error: Color.fromRGBO(212, 12, 12, 1),

      onError: Colors.white,
      brightness: Brightness.light,
      inversePrimary: Colors.white,
    ),
    dividerColor: const Color.fromRGBO(220, 223, 225, 1),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        gapPadding: 16,
        borderSide:
            BorderSide(color: Color.fromRGBO(153, 153, 153, 1), width: 2.0),
      ),
      contentPadding: EdgeInsets.all(16),
      labelStyle: TextStyle(fontSize: 14),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(34, 40, 42, 0.9),
      foregroundColor: Colors.white,
    ),

    // // accentColor: const Colors.black,
    // disabledColor: const Color.fromRGBO(196, 196, 196, 1),
    // backgroundColor: Colors.white,
    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: Colors.black,
    //   selectionColor: Colors.orange,
    //   selectionHandleColor: Colors.orange,
    // ),
    // iconTheme: const IconThemeData(color: Colors.white),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     primary: Colors.black,
    //     elevation: 0,
    //     shadowColor: Colors.white.withOpacity(0),
    //   ),
    // ),
  );
}

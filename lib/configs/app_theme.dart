import 'package:flutter/material.dart';

class AppTheme {
//input color
  static const inputfillColor = Color(0xFFEEEEEE);

// theme1 light color scheme
  static const colorSchemeTheme1Light = ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 254, 254, 254),
      onPrimary: Color.fromARGB(255, 37, 36, 36),
      primaryContainer: Color.fromARGB(79, 251, 243, 232),
      onPrimaryContainer: Color.fromARGB(79, 18, 18, 18),
      secondary: Color.fromARGB(255, 255, 102, 0),
      onSecondary: Color.fromARGB(255, 255, 252, 252),
      secondaryContainer: Color.fromARGB(255, 254, 233, 201),
      onSecondaryContainer: Colors.black,
      tertiary: Color.fromARGB(255, 43, 44, 46),
      onTertiary: Color.fromARGB(255, 255, 255, 255),
      tertiaryContainer: Color.fromARGB(96, 156, 162, 211),
      onTertiaryContainer: Colors.white,
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFFFF),
      onBackground: Color.fromARGB(255, 0, 0, 0),
      surface: Color(0xFFFFFFFF),
      onSurface: Color.fromARGB(255, 0, 0, 0));

  //theme 1 light
  static ThemeData appTheme1Light() {
    return ThemeData(
      // useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: colorSchemeTheme1Light,
      fontFamily: 'IranSans', primaryColor: const Color(0xFFFCFCFC),
      // primaryColorDark: Color(0xFF30336B),
      // primaryColorLight: Color(0x4Fff9900),
      textTheme: TextTheme(
          headlineMedium: TextStyle(
        color: colorSchemeTheme1Light.onBackground.withOpacity(0.8),
        fontFamily: 'OpenSans',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      )),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionHandleColor: Colors.blue,
          selectionColor: Colors.blue),
      //Text Input
      inputDecorationTheme: InputDecorationTheme(
        filled: true, iconColor: Colors.black,
        prefixIconColor: const Color.fromARGB(255, 60, 60, 60),
        suffixIconColor: const Color.fromARGB(255, 92, 91, 91),
        floatingLabelStyle: TextStyle(color: colorSchemeTheme1Light.onPrimary),
        // fillColor: inputfillColor,
        //کاهش ارتفاع ادیت بکس ها
        //Decrease TextFields Height
        contentPadding:
            const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: inputfillColor.withOpacity(0.40)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
              color: colorSchemeTheme1Light.onPrimary.withOpacity(0.5)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: inputfillColor.withOpacity(0.40)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

// theme1 dark color scheme
  static const colorSchemeTheme1Dark = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 18, 16, 16),
      onPrimary: Color.fromARGB(255, 223, 217, 217),
      secondary: Color.fromARGB(255, 185, 77, 0),
      onSecondary: Color.fromARGB(255, 169, 169, 169),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      background: Color.fromARGB(255, 28, 28, 28),
      onBackground: Color.fromARGB(255, 230, 230, 230),
      surface: Color.fromARGB(255, 16, 14, 14),
      onSurface: Color.fromARGB(255, 248, 245, 245));

  /// dark theme
  static ThemeData appTheme1Dark() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: colorSchemeTheme1Dark, fontFamily: 'IranSans',

      //Text Input
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputfillColor,
        //کاهش ارتفاع ادیت بکس ها
        //Decrease TextFields Height
        contentPadding:
            const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: inputfillColor.withOpacity(0.40)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: inputfillColor.withOpacity(0.40)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

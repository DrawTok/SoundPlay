import 'package:flutter/material.dart';
import 'package:sound_play/constants.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 44, 42, 42),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: kTextColor),
            bodyMedium: TextStyle(color: kTextColor),
            bodySmall: TextStyle(color: kTextColor)),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          labelStyle: TextStyle(color: kTextColor, fontSize: 24),
          hintStyle: TextStyle(color: kBorderColor)
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              side: BorderSide(color: kBorderColor)),
        )));
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(color: kTextColor),
  gapPadding: 10,
);

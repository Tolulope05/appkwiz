import 'package:appkwiz/configs/themes/app_light_theme.dart';
import 'package:appkwiz/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryDarkColorDark = Color(0xFF2E3C62);
const Color primaryColorDark = Color(0xFF99ACE1);
const Color mainTextColorDark = Colors.black;

class DarkTheme with SubThemeData {
// Do something...
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}

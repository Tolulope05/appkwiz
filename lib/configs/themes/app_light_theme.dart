import 'package:appkwiz/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primaryLightColorLight = Color(0xFF3ACECB);
const Color primaryColorLight = Color(0xFFF85187);

class LightTheme with SubThemeData {
// Do something!
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      iconTheme: getIconTheme(),
    );
  }
}

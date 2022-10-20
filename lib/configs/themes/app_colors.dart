import 'package:appkwiz/configs/themes/app_dark_theme.dart';
import 'package:appkwiz/configs/themes/app_light_theme.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:flutter/material.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
);

LinearGradient mainGradient(BuildContext context) {
  return UIParamters.isDarkMode() ? mainGradientDark : mainGradientLight;
}

Color customScaffoldColor(BuildContext context) {
  return UIParamters.isDarkMode()
      ? const Color.fromARGB(255, 20, 46, 158)
      : const Color.fromARGB(255, 221, 221, 221);
}

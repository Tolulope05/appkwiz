import 'package:appkwiz/configs/themes/app_dark_theme.dart';
import 'package:appkwiz/configs/themes/app_light_theme.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:flutter/material.dart';

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
);

LinearGradient mainGradient(BuildContext context) {
  return UIParamters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
}

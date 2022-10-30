import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui_paramters.dart';

TextStyle cardTitleStyle(context) => TextStyle(
      color: UIParamters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailsTextStyle = TextStyle(fontSize: 12);
const questionsTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const headerTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);

const appBarTS = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16, color: onSurfaceTextColor);

TextStyle countDownTimerTS() => TextStyle(
      color: UIParamters.isDarkMode()
          ? Theme.of(Get.context!).textTheme.bodyText1!.color
          : onSurfaceTextColor,
      letterSpacing: 2,
    );

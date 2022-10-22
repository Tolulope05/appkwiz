import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'ui_paramters.dart';

TextStyle cardTitleStyle(context) => TextStyle(
      color: UIParamters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailsTextStyle = TextStyle(fontSize: 12);
const headerTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);

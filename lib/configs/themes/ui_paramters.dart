import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorederRadius = 10.0;

double get mobilescreenPadding => _mobileScreenPadding;
double get cardBorederRadius => _cardBorederRadius;

class UIParamters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorederRadius);

  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}

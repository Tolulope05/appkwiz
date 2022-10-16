import 'package:flutter/material.dart';

class UIParamters {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

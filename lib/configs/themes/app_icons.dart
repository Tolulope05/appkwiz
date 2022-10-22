import 'package:flutter/cupertino.dart';

class AppIcons {
  AppIcons._(); // Singleton has only one instance in your app.
  static const fontFam = "AppIcons";
  static const IconData trophyOutline = IconData(0xe808, fontFamily: fontFam);
  static const IconData menuLeft = IconData(0xe805, fontFamily: fontFam);
  static const IconData peace = IconData(0xe806, fontFamily: fontFam);
} // simple Singleton Class with provate constructor

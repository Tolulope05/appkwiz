import 'package:appkwiz/configs/themes/app_dark_theme.dart';
import 'package:appkwiz/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
// Do something!
  @override
  void onInit() {
    // This is done when the app is in memeory but before the app boots up!
    // onInit() which is called when the controller is created,
    initalizeThemeData();
    super.onInit();
  }

  @override
  // TODO: implement onStart
  InternalFinalCallback<void> get onStart => super.onStart;

  void initalizeThemeData() {
    ThemeData _darkTheme = DarkTheme().buildDarkTheme();
    ThemeData _lightTheme = LightTheme().buildLightTheme();
    print("Yello done");
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}


  // TextButton(
                  //     onPressed: () {
                  //       Get.changeTheme(
                  //         Get.isDarkMode
                  //             ? LightTheme().buildLightTheme()
                  //             : DarkTheme().buildDarkTheme(),
                  //       );
                  //     },
                  //     child: Text("Shuffle Theme"))

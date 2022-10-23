import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:flutter/material.dart';

class MyMenuScreen extends StatelessWidget {
  const MyMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParamters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 020,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    print("Hello");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

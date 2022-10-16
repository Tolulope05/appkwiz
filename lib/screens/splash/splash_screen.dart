import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient(context)),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/app_splash_logo.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

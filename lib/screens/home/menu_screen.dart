import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/controllers/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
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
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
              Column(
                children: [
                  Obx(() => controller.user.value == null
                      ? SizedBox()
                      : Text(
                          controller.user.value!.displayName ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: onSurfaceTextColor,
                          ),
                        ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

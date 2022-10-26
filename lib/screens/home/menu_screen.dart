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
                  Obx(
                    () => controller.user.value == null
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(
                                // right: MediaQuery.of(context).size.width * 0.3,
                                ),
                            child: Text(
                              controller.user.value!.displayName ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor,
                              ),
                            ),
                          ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  _DrawerButton(
                    icon: Icons.web,
                    label: "Website",
                    onPress: () => controller.website(),
                  ),
                  _DrawerButton(
                    icon: Icons.facebook,
                    label: "Facebook",
                    onPress: () => controller.facebook(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: _DrawerButton(
                      icon: Icons.email,
                      label: "Email",
                      onPress: () => controller.email(),
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  _DrawerButton(
                    icon: Icons.logout,
                    label: "Sign Out",
                    onPress: () => controller.signOut(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onPress,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}

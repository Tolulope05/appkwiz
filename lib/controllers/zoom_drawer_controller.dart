import 'package:appkwiz/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  @override
  void onReady() {
    // We want to get the user from Firebase
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}
  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: "mailto",
      path: "fakunletolulope05@gmail.com",
    );
    _launch(emailLaunchUri);
  }

  _launch(Uri urlString) async {
    if (!await launchUrl(urlString)) {
      throw "Could not launch $urlString";
    }
    launchUrl(urlString);
  }

  void website() {
    final Uri websiteLaunchUri = Uri(
      path: "https://tolcoder.herokuapp.scom",
    );
    _launch(websiteLaunchUri);
    _launch(Uri());
  }

  void facebook() {
    final Uri websiteLaunchUri = Uri(
      path: "https://facebook.com/fakunletolulope",
    );
    _launch(websiteLaunchUri);
    _launch(Uri());
  }
}

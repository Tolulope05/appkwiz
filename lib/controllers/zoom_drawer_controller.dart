import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  @override
  void onReady() {
    // We want to get the user from Firebase
    super.onReady();
  }

  void signOut() {}
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

  void website() {}
}

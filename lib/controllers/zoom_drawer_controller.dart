import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}

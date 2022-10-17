import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
    //onReady() which is called after the widget is rendered on the screen
  }

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}

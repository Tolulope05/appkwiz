import 'package:appkwiz/controllers/auth_controller.dart';
import "package:get/get.dart";

/* Dependencies Binding */
// => You inject controllers in the bindings

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}

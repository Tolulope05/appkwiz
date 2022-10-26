import 'package:appkwiz/controllers/auth_controller.dart';
import 'package:appkwiz/controllers/theme_controller.dart';
import "package:get/get.dart";

import '../controllers/question_controller/question_paper_controller.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../services/firebase_storage_services.dart';

/* Dependencies Binding */
// => You inject controllers in the bindings

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(QuestionPaperController(), permanent: true);
    Get.lazyPut(() => MyZoomDrawerController(), fenix: true);
    Get.lazyPut(() => FirebaseStorageServices());
  }
}

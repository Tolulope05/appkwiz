import 'package:appkwiz/controllers/question_controller/question_paper_controller.dart';
import 'package:appkwiz/screens/home/home_screen.dart';
import 'package:appkwiz/screens/login/login_screen.dart';
import 'package:appkwiz/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/introduction/introduction.dart';

class Approute {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: "/introduction",
          page: () => const ApplictionIntroductionScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionPaperController());
              // Get.put(MyZoomDrawerController()); // attached to initial binding, It caused errors here
            },
          ),
        ),
        GetPage(
          name: "/login",
          page: () => LoginScreen(),
        ),
      ];
}

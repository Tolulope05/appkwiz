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
      ];
}

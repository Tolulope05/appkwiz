import 'package:get/get.dart';

import '../screens/introduction/introduction.dart';

class Approute {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => ApplictionIntroductionScreen(),
        ),
      ];
}

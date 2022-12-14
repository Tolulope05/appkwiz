import 'package:appkwiz/controllers/question_controller/question_paper_controller.dart';
import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:appkwiz/screens/home/home_screen.dart';
import 'package:appkwiz/screens/login/login_screen.dart';
import 'package:appkwiz/screens/question/answer_check_screen.dart';
import 'package:appkwiz/screens/question/question_screen.dart';
import 'package:appkwiz/screens/question/result_screen.dart';
import 'package:appkwiz/screens/question/test_overview_screen.dart';
import 'package:appkwiz/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../controllers/zoom_drawer_controller.dart';
import '../screens/introduction/introduction.dart';

class Approute {
  static List<GetPage> routes() => [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: ApplictionIntroductionScreen.routeName,
          page: () => const ApplictionIntroductionScreen(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionPaperController());
              Get.put(
                MyZoomDrawerController(),
              ); // attached to initial binding, It caused errors here
            },
          ),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: QuestionScreen.routeName,
          page: () => const QuestionScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionsController());
            },
          ),
        ),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionsController());
            },
          ),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionsController());
            },
          ),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => const AnswerCheckScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuestionsController());
            },
          ),
        ),
      ];
}

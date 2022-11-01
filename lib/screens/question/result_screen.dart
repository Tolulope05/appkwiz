import 'package:appkwiz/configs/themes/custom_text_style.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/controllers/question_controller/question_controller_extension.dart';
import 'package:appkwiz/screens/question/answer_check_screen.dart';
import 'package:appkwiz/widgets/common/main_button.dart';
import 'package:appkwiz/widgets/questions/answer_card.dart';
import 'package:appkwiz/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/question_controller/questions_controller.dart';
import '../../widgets/common/background_decoration.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../home/content_area.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({Key? key}) : super(key: key);
  static const String routeName = "/result-screen";

  @override
  Widget build(BuildContext context) {
    Color _textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.correctAnsweredQuestions,
        leading: const SizedBox(
          height: kToolbarHeight,
        ),
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
            child: ContentArea(
              child: Column(
                children: [
                  SvgPicture.asset("assets/images/bulb.svg"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "Congratulations",
                      style: headerTextStyle.copyWith(color: _textColor),
                    ),
                  ),
                  Text(
                    "You have ${controller.points} points.",
                    style: TextStyle(color: _textColor),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Tap below Question numbers to view correct answers",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: controller.allquestions.length,
                      itemBuilder: ((context, index) {
                        final _questions = controller.allquestions[index];
                        AnswerStatus _status = AnswerStatus.notanswerd;
                        final _selectedAnswer = _questions.selectedAnswer;
                        final _correctAnswer = _questions.correctAnswer;
                        if (_selectedAnswer == _correctAnswer) {
                          _status = AnswerStatus.correct;
                        } else if (_selectedAnswer == null) {
                          _status = AnswerStatus.wrong;
                        } else {
                          _status = AnswerStatus.wrong;
                        }
                        return QuestionNumberCard(
                          index: index,
                          status: _status,
                          onTap: () {
                            controller.jumpToQuestion(
                              index,
                              isGoBack: false,
                            ); // user submitted ! back.
                            Get.toNamed(AnswerCheckScreen.routeName);
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: UIParamters.mobileScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      onTap: () {
                        controller.tryAgain();
                      },
                      color: Colors.blueGrey,
                      title: "Try Again",
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: MainButton(
                      onTap: () {
                        controller.saveTestResult();
                      },
                      title: "Go Home",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

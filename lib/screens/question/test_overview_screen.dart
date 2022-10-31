import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:appkwiz/screens/home/content_area.dart';
import 'package:appkwiz/widgets/common/background_decoration.dart';
import 'package:appkwiz/widgets/common/custom_app_bar.dart';
import 'package:appkwiz/widgets/common/main_button.dart';
import 'package:appkwiz/widgets/questions/answer_card.dart';
import 'package:appkwiz/widgets/questions/count_down_timer.dart';
import 'package:appkwiz/widgets/questions/question_number_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/test-overview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: controller.completedTest),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
            child: ContentArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      CountDownTimer(
                        time: "",
                        color: UIParamters.isDarkMode()
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context).primaryColor,
                      ),
                      Obx(
                        () => Text(
                          "${controller.time} Remaining",
                          style: TextStyle(
                            color: UIParamters.isDarkMode()
                                ? Theme.of(Get.context!)
                                    .textTheme
                                    .bodyText1!
                                    .color
                                : Theme.of(context).primaryColor,
                            letterSpacing: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.allquestions.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Get.width ~/ 75,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          AnswerStatus? _answerStatus;
                          String? _selectedAnswer =
                              controller.allquestions[index].selectedAnswer;
                          if (_selectedAnswer != null) {
                            _answerStatus = AnswerStatus.answered;
                          }
                          return QuestionNumberCard(
                            index: index + 1,
                            status: _answerStatus,
                            onTap: () => controller.jumpToQuestion(index),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: MainButton(
                title: "Complete",
                onTap: () => controller.complete(),
              ),
            ),
          )
        ],
      )),
    );
  }
}

import 'package:appkwiz/configs/themes/app_colors.dart';
import 'package:appkwiz/configs/themes/custom_text_style.dart';
import 'package:appkwiz/configs/themes/ui_paramters.dart';
import 'package:appkwiz/controllers/firebase_ref/loading_status.dart';
import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:appkwiz/screens/home/content_area.dart';
import 'package:appkwiz/widgets/common/custom_app_bar.dart';
import 'package:appkwiz/widgets/common/main_button.dart';
import 'package:appkwiz/widgets/questions/answer_card.dart';
import 'package:appkwiz/widgets/questions/count_down_timer.dart';
import 'package:appkwiz/widgets/screen_shimmer/question_placeholer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common/background_decoration.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({Key? key}) : super(key: key);
  static const routeName = '/questionScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                color: onSurfaceTextColor,
                width: 2,
              ),
            ),
          ),
          child: Obx(() => CountDownTimer(
                time: controller.time.value,
                color: onSurfaceTextColor,
              )),
        ),
        showActionButton: true,
        titleWidget: Obx(() => Text(
              "Q ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
              style: appBarTS,
            )),
      ),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                  child: ContentArea(
                    child: QuestionScreenHolder(),
                  ),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: mobilescreenPadding,
                        right: mobilescreenPadding - 5,
                        left: mobilescreenPadding - 5,
                      ),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestions.value?.question ?? "",
                            style: questionsTextStyle,
                          ),
                          GetBuilder<QuestionsController>(
                            id: "answers_lists",
                            builder: (context) {
                              return ListView.separated(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 25),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .currentQuestions.value!.answers.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  final answer = controller
                                      .currentQuestions.value!.answers[index];
                                  return AnswerCard(
                                    answer:
                                        "${answer.identifier}. ${answer.answer}",
                                    onTap: () {
                                      controller
                                          .selectedAnswer(answer.identifier);
                                    },
                                    isSelected: answer.identifier ==
                                        controller.currentQuestions.value!
                                            .selectedAnswer,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParamters.mobileScreenPadding,
                  child: Row(
                    children: [
                      Visibility(
                        visible: controller.isFirstQuestion,
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onTap: () {
                              controller.prevQuestion();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Get.isDarkMode
                                  ? onSurfaceTextColor
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: controller.loadingStatus.value ==
                              LoadingStatus.completed,
                          child: MainButton(
                            onTap: () {
                              controller.isLastQuestion
                                  ? Container()
                                  : controller.nextQuestion();
                            },
                            title:
                                controller.isLastQuestion ? "Complete" : "Next",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

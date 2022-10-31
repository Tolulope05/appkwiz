import 'package:appkwiz/configs/themes/custom_text_style.dart';
import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:appkwiz/screens/home/content_area.dart';
import 'package:appkwiz/screens/question/result_screen.dart';
import 'package:appkwiz/widgets/common/background_decoration.dart';
import 'package:appkwiz/widgets/common/custom_app_bar.dart';
import 'package:appkwiz/widgets/questions/answer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/question_paper_model.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);
  static const String routeName = "/answer-check-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
          () => Text(
            'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
            style: appBarTS,
          ),
        ),
        showActionButton: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(controller.currentQuestions.value!.question),
                        GetBuilder<QuestionsController>(
                          id: "answer_review_list",
                          builder: (_) {
                            return ListView.separated(
                              separatorBuilder: ((_, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              }),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .currentQuestions.value!.answers.length,
                              itemBuilder: (_, index) {
                                final Answers answer = controller
                                        .currentQuestions.value!.answers[
                                    index]; // contains answer and identifiers
                                final String? selectedAnswer = controller
                                    .currentQuestions.value!.selectedAnswer;
                                final String? correctAnswer = controller
                                    .currentQuestions.value!.correctAnswer;
                                final String answerText =
                                    "${answer.identifier}. ${answer.answer}";
                                if (correctAnswer == selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  // Correct answer

                                } else if (selectedAnswer == null) {
                                  // not selected answer

                                } else if (correctAnswer != selectedAnswer &&
                                    answer.identifier == selectedAnswer) {
                                  // wrong answer
                                } else if (correctAnswer == answer.identifier) {
                                  // correct answer
                                }

                                return AnswerCard(
                                  answer: answerText,
                                  onTap: () {},
                                  isSelected: false,
                                );
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

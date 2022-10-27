import 'package:appkwiz/configs/themes/custom_text_style.dart';
import 'package:appkwiz/controllers/firebase_ref/loading_status.dart';
import 'package:appkwiz/controllers/question_controller/questions_controller.dart';
import 'package:appkwiz/screens/home/content_area.dart';
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
      body: BackgroundDecoration(
        child: Obx(() => Column(
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
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestions.value?.question ?? "",
                              style: questionsTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            )),
      ),
    );
  }
}
